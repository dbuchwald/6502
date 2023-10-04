      .setcpu "65C02"

      .include "vdp.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "vdp_text_mode.inc"
      .include "via.inc"
      .include "via_const.inc" 
    
      .include "lcd.inc"
      .include "tty.inc"
      .include "keyboard.inc"
      .include "blink.inc"
      .include "zeropage.inc"


VDP_NAME_TABLE_BASE     = $0000
CURSOR                  = '_'
SPACE                   = ' '
PROMPT                  = '>'             ; Prompt character
CR              :=   $00 ;

     .RODATA
ready_message:
      .asciiz "Ready"      


command_tab:
      .asciiz "read"
      .word READ_CMD
      .asciiz "write"
      .word WRITE_CMD
command_tab_end = *      



      .segment "BSS"
last_keyboard_status:  
      .byte $00

IN:    
      .res 41

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   handle_irq

      .code
init:  
      ldx #$ff
      txs

      cld                     ; Clear decimal arithmetic mode

      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_INPUT_POLLING )
      ;lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_VDP )
      jsr _tty_init
      jsr _keyboard_init

      lda #0
      sta IN+40


      ;cli

      writeln_tty #ready_message

loopa:
      tty_read_line #IN, 40
      writeln_tty #IN
      bra loopa






      LDY     #$7F      ; Mask for DSP data direction reg


; Program falls through to the GETLINE routine to save some program bytes
; Please note that Y still holds $7F, which will cause an automatic Escape

;-------------------------------------------------------------------------
; The GETLINE process
;-------------------------------------------------------------------------
                LDA     #KEY_ESCAPE       ; Not included or necessary in original  
NOTCR:
                CMP     #KEY_BACKSPACE             ; Backspace key?
                BEQ     BACKSPACE       ; Yes
                CMP     #KEY_ESCAPE
                
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

                jsr _strobe_led

                jsr _tty_send_newline
                writeln_tty #IN  

                bra GETLINE


; Demo KB Option
handle_irq:
      .scope
      ; Preserve A register
      pha
      ; Load interrupt flag register
      lda VIA1_IFR
      ; Not a VIA1 interrupt
      bpl @not_via1
      ; Preserve X register
      phx
      ; Prerve A in X for testing
      tax
      ; Check for keyboard interrupt
      and #(VIA_IFR_CA1_ACTIVE_EDGE)
      beq @not_keyboard
      jsr _handle_keyboard_irq
@not_keyboard:
      ; Restore X
      plx
@not_via1:
      ; Restore A
      pla
      ; Done
      rti
      .endscope