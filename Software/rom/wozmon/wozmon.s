      .debuginfo  +
      .setcpu "65C02"

      .include "via_const.inc" 
      .include "via.inc"

      .include "lcd.inc"
      .include "blink.inc"
      .include "tty.inc"
      .include "keyboard.inc"

      .include "vdp_text_mode.inc"

      .include "zeropage.inc"



      .bss    
IN:    .res $10

ascii_value:
      .res 10 ; 'ABCD_EF12\0'  

last_keyboard_status:  
      .byte $00


      .RODATA
ready_message:
      .asciiz "MONITOR READY"      

;-------------------------------------------------------------------------
;  Vector area
;-------------------------------------------------------------------------
      .segment "VECTORS"
NMI_VEC:        .word   $0F00           ; NMI vector
RESET_VEC:      .word   RESET           ; RESET vector
IRQ_VEC:        .word   handle_irq      ; IRQ vector      


;-------------------------------------------------------------------------
;
;   The WOZ Monitor for the Apple 1
;   Written by Steve Wozniak 1976
;
;   Converted to assemble with ca65 by cbmeeks
;   https://gist.github.com/cbmeeks/
;
;   Original code with comments taken from 
;   http://www.sbprojects.com/projects/apple1/wozmon.php
;
;-------------------------------------------------------------------------


;-------------------------------------------------------------------------
;  Memory declaration
;-------------------------------------------------------------------------

XAML            :=      wozmon_zp             ; Last "opened" location Low
XAMH            :=      wozmon_zp + 1         ; Last "opened" location High
STL             :=      wozmon_zp + 2         ; Store address Low
STH             :=      wozmon_zp + 3         ; Store address High
L               :=      wozmon_zp + 4         ; Hex value parsing Low
H               :=      wozmon_zp + 5         ; Hex value parsing High
YSAV            :=      wozmon_zp + 6         ; Used to see if hex value is given
MODE            :=      wozmon_zp + 7         ; $00=XAM, $7F=STOR, $AE=BLOCK XAM




; KBD             :=      $D010           ; PIA.A keyboard input
; KBDCR           :=      $D011           ; PIA.A keyboard control register
; DSP             :=      $D012           ; PIA.B display output register
; DSPCR           :=      $D013           ; PIA.B display control register

; KBD b7..b0 are inputs, b6..b0 is ASCII input, b7 is constant high
;     Programmed to respond to low to high KBD strobe
; DSP b6..b0 are outputs, b7 is input
;     CB2 goes low when data is written, returns high when CB1 goes high
; Interrupts are enabled, though not used. KBD can be jumpered to IRQ,
; whereas DSP can be jumpered to NMI.

;-------------------------------------------------------------------------
;  Constants
;-------------------------------------------------------------------------

BS              :=   $7F ;   $DF             ; Backspace key, arrow left key
CR              :=   $00 ; DOWN   $8D             ; Carriage Return
ESC             :=   $1B             ; ESC key
PROMPT          :=   '>'             ; Prompt character

;-------------------------------------------------------------------------
;  Let's get started
;
;  The RESET routine is only to be entered by asserting the RESET line of
;  the system. This ensures that the data direction registers are selected.
;-------------------------------------------------------------------------
      .code

RESET:          
                CLD                     ; Clear decimal arithmetic mode

                  jsr _lcd_init
                  jsr vdp_text_init
                  jsr _blink_init

                  lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_VDP )
                  jsr _tty_init
                  jsr _keyboard_init

                  lda $ff
                  sta last_keyboard_status


                  lda #0
                  sta IN+5
                  
                  
            ;      CLI

                 writeln_tty #ready_message

                 LDY     #$7F      ; Mask for DSP data direction reg


; Program falls through to the GETLINE routine to save some program bytes
; Please note that Y still holds $7F, which will cause an automatic Escape

;-------------------------------------------------------------------------
; The GETLINE process
;-------------------------------------------------------------------------
                LDA     #ESC ; Not included or necessary in original  
NOTCR:
                CMP     #BS             ; Backspace key?
                BEQ     BACKSPACE       ; Yes
                CMP     #ESC            ; ESC?
                BEQ     ESCAPE          ; Yes
                INY                     ; Advance text index
                BPL     NEXTCHAR        ; Auto ESC if line longer than 127

ESCAPE:
GETLINE:
                LDA     #CR             ; Send CR
                JSR     _tty_send_newline
                LDA     #PROMPT         ; Print prompt character
                JSR     _tty_send_character            ; Output it
                LDA     #' '         ; Print prompt character
                JSR     _tty_send_character            ; Output it

                LDY     #1            ; Start a new input line
BACKSPACE:
                DEY                     ; Backup text index
                BMI     GETLINE         ; Oops, line empty, reinitialize

NEXTCHAR:
                lda VIA1_IFR
                and #VIA_IFR_CA1_ACTIVE_EDGE
                beq NEXTCHAR
                jsr _handle_keyboard_irq

                jsr _keyboard_is_data_available
                cmp #KEYBOARD_DATA_AVAILABLE
                bne NEXTCHAR  

                jsr _keyboard_read_char
                jsr _tty_send_character

                STA     IN,Y              ; Add to text buffer
               
                CMP     #CR
                BNE     NOTCR           ; not CR!


; Line received, now let's parse it
                LDY     #$FF       ; Reset text index
                LDA     #0              ; Default mode is XAM
                TAX                     ; X=0

SETSTOR:
                ASL                     ; Leaves $7B if setting STOR mode
SETMODE:
                STA     MODE            ; Set mode flags
BLSKIP:
                INY                     ; Advance text index
NEXTITEM:
                LDA     IN,Y            ; Get character 
                ORA     #$80            ; KKE - set msbit here?

                CMP     #CR | $80
                BEQ     GETLINE         ; We're done if it's CR

                CMP     #'.' | $80
                BCC     BLSKIP          ; Ignore everything below "."

; gets here 

                BEQ     SETMODE         ; Set BLOCK XAM mode ("." = $AE)
                CMP     #':' | $80
                BEQ     SETSTOR         ; Set STOR mode. $BA will become $7B
                CMP     #'R' | $80
                BEQ     RUN             ; Run the program. Forget the rest.

                STX     L               ; Clear input value (X=0)
                STX     H
                STY     YSAV            ; Save Y for comparison

; Here we're trying to parse a new hex value

NEXTHEX:
                LDA     IN,Y            ; Get character for hex test (don't mess with top bit this time)
                EOR     #$30            ; Map digits to 0-9
                CMP     #9+1            ; Is it a decimal digit?
                BCC     DIG             ; Yes!
                ADC     #$88            ; Map letter "A"-"F" to $FA-FF
                CMP     #$FA            ; Hex letter?
                BCC     NOTHEX          ; No! Character not hex

DIG:
                ASL
                ASL                     ; Hex digit to MSD of A
                ASL
                ASL

                LDX     #4              ; Shift count
HEXSHIFT:
                ASL                     ; Hex digit left, MSB to carry
                ROL     L               ; Rotate into LSD
                ROL     H               ; Rotate into MSD
                DEX                     ; Done 4 shifts?
                BNE     HEXSHIFT        ; No, loop
                INY                     ; Advance text index
                BNE     NEXTHEX         ; Always taken

NOTHEX:
                CPY     YSAV            ; Was at least 1 hex digit given?
                BEQ     ESCAPE          ; No! Ignore all, start from scratch

                BIT     MODE            ; Test MODE byte
                BVC     NOTSTOR         ; B6=0 is STOR, 1 is XAM or BLOCK XAM

; STOR mode, save LSD of new hex byte

                LDA     L               ; LSDs of hex data
                STA     (STL,X)         ; Store current 'store index'(X=0)
                INC     STL             ; Increment store index.
                BNE     NEXTITEM        ; No carry!
                INC     STH             ; Add carry to 'store index' high
TONEXTITEM:
                JMP     NEXTITEM        ; Get next command item.

;-------------------------------------------------------------------------
;  RUN user's program from last opened location
;-------------------------------------------------------------------------

RUN:
                JMP     (XAML)          ; Run user program

;-------------------------------------------------------------------------
;  We're not in Store mode
;-------------------------------------------------------------------------

NOTSTOR:
                BMI     XAMNEXT         ; B7 = 0 for XAM, 1 for BLOCK XAM

; We're in XAM mode now

                LDX     #2              ; Copy 2 bytes
SETADR:
                LDA     L-1, X          ; Copy hex data to
                STA     STL-1, X        ; 'store index'
                STA     XAML-1, X       ; and to 'XAM index'
                DEX                     ; Next of 2 bytes
                BNE     SETADR          ; Loop unless X = 0

; Print address and data from this address, fall through next BNE.

NXTPRNT:
                BNE     PRDATA          ; NE means no address to print
                LDA     #CR             ; Print CR first
                jsr     _tty_send_newline
                
                LDA     XAMH            ; Output high-order byte of address
                JSR     _tty_write_hex   
                LDA     XAML            ; Output low-order byte of address
                JSR     _tty_write_hex   
                LDA     #':'            ; Print colon
                JSR     _tty_send_character

PRDATA:
                LDA     #' '            ; Print space
                JSR     _tty_send_character
                LDA     (XAML,X)        ; Get data from address (X=0)
                JSR     _tty_write_hex  ; Output it in hex format

XAMNEXT:
                STX     MODE            ; 0 -> MODE (XAM mode).
                LDA     XAML            ; See if there is more to print
                CMP     L
                LDA     XAMH
                SBC     H
                BCS     TONEXTITEM      ; Not less! No more data to output

                INC     XAML            ; Increment 'examine index'
                BNE     MOD8CHK         ; No carry!
                INC     XAMH

MOD8CHK:
                LDA     XAML            ; If address MOD 8 = 0 start new line
                AND     #%0000111
                BPL     NXTPRNT         ; Always taken.


;-----------------------------------------------------


hex_dump:
; Dump a buffer to the screen in HEX and ASCII
; Addr MSB in x
; Addr LSB in y
; USES tmp1, tmp2, tmp3

      .scope

BYTE = ptr4  
LSB = ptr4
MSB = ptr4+1
LINE = tmp3

      sty MSB
      stx LSB
      stz LINE

      jsr _tty_send_newline

start_line:
      lda MSB
      jsr _tty_write_hex
      lda LSB
      jsr _tty_write_hex

      lda #':'
      jsr _tty_send_character

      ldy #0

write_byte:
      lda (BYTE), y
      jsr _tty_write_hex

      cmp #$20
      bpl printable

      lda #' '

printable:
      sta ascii_value,y

      lda #' '
      jsr _tty_send_character
      
      cpy #3
      bne no_extra
      jsr _tty_send_character

no_extra:
      iny

      cpy #8
      bne write_byte

      ; tya
      ; clc
      ; ror
      ; bcs write_byte
      ; ror
      ; bcs write_byte
      ; ror
      ; bcs write_byte
      ; if we get here, we just carried to a multiple of 8, so new line

      lda #0
      sta ascii_value+8 ;; still need to inject a space in the middle
      writeln_tty #ascii_value

      inc LINE
      lda LINE
      cmp #16
      beq done

      lda #8
      clc
      adc LSB
      sta LSB

      bcc start_line
      inc MSB

      bra start_line

done:
      rts
      .endscope


handle_irq:
      pha
      lda VIA1_IFR
      bpl not_via1

      phx
      tax
      and #VIA_IFR_CA1_ACTIVE_EDGE
      beq not_keyboard

      jsr _handle_keyboard_irq
not_keyboard:
      plx      

not_via1:
      ; lda VIA2_IFR
      ; bpl 
      ;buffer: 
      ;.res 512           

      ; lda #VIA_IFR_TIME
      ;buffer: 
      ;.res 512           

      pla
      rti
