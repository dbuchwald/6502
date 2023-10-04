      .setcpu "65C02"

      .include "via_const.inc" 
      .include "via.inc"

      .include "lcd.inc"
      .include "blink.inc"
      .include "tty.inc"
      .include "keyboard.inc"

      .include "vdp_text_mode.inc"

      .include "spi_sd.inc"
      .include "fat32.inc"

      .include "zeropage.inc"



      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   handle_irq


fat32_readbuffer = fat32_workspace


; zp_sd_address = $40         ; 2 bytes
; zp_sd_currentsector = $42   ; 4 bytes
; zp_fat32_variables = $46    ; 24 bytes

; fat32_workspace = $200      ; two pages

      .bss
buffer: 
      .res 512           

ascii_value:
      .res 10 ; 'ABCD_EF12\0'  

last_keyboard_status:  
      .byte $00

dump_page:
      .res 2      

      .RODATA


subdirname:
  .asciiz "SUBFOLDR   "
filename:
  .asciiz "DEEPFILETXT"     

ready_message:
      .asciiz "READY"



      .code

init:  
      ldx #$ff
      txs

      jsr sd_init

      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_VDP )
      jsr _tty_init
      jsr _keyboard_init

      lda $ff
      sta last_keyboard_status

      cli

      writeln_tty #ready_message

     jsr fat32_init
     bcc initsuccess
 
      ; Error during FAT32 initialization
      lda #'Z'
      jsr _tty_send_character
      lda fat32_errorstage
      jsr _tty_write_hex

      lda #' '
      jsr _tty_send_character


      lda sd_currentsector
      jsr _tty_write_hex
      lda sd_currentsector+1
      jsr _tty_write_hex
      lda sd_currentsector+2
      jsr _tty_write_hex
      lda sd_currentsector+3
      jsr _tty_write_hex            

      ldx #<(fat32_workspace+128*0) ; LOW Byte!
      stx dump_page
      ldy #>(fat32_workspace+128*0)
      sty dump_page + 1
      jsr hex_dump

wait: 
      jsr _keyboard_is_data_available
      cmp #KEYBOARD_DATA_AVAILABLE
      bne wait

      jsr _strobe_led
      jsr idle_clock

      jsr _keyboard_read_char
      jsr _tty_write_hex

      lda dump_page ; LOW Byte!
      ldy dump_page + 1
      
      clc
      adc #128
      bcc no_carry
      iny

no_carry:     
      tax

      stx dump_page
      sty dump_page + 1

      jsr hex_dump

      bra wait


initsuccess:

      ; Open root directory
      jsr fat32_openroot

      ; Find subdirectory by name
      ldx #<subdirname
      ldy #>subdirname
      jsr fat32_finddirent
      bcc foundsubdir

      ; Subdirectory not found
      lda #'X'
      jsr _tty_send_character
      jmp loop

foundsubdir:

      ; Open subdirectory
      jsr fat32_opendirent

      ; Find file by name
      ldx #<filename
      ldy #>filename
      jsr fat32_finddirent
      bcc foundfile

      ; File not found
      lda #'Y'
      jsr _tty_send_character
      jmp loop

foundfile:

      ; Open file
      jsr fat32_opendirent

      ; Read file contents into buffer
      lda #<buffer
      sta fat32_address
      lda #>buffer
      sta fat32_address+1

      jsr fat32_file_read


      ; Dump data to LCD

      jsr _lcd_clear

      ldy #0

printloop:
      lda buffer,y
      jsr _tty_send_character

      iny

      cpy #16
      bne not16
      jsr _lcd_newline
not16:

      cpy #32
      bne printloop


  ; loop forever
loop:
      jsr _strobe_led
      jmp loop

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
      ; bpl not_via2

      ; and #VIA_IFR_TIME_OUT_T1
      ; bne not_via2_timer1

      ; lda #VIA_IFR_TIME_OUT_T1      ; Clear the Timer interrupt
      ; sta VIA2_IFR

not_via2_timer1:
not_via2:
      pla
      rti
