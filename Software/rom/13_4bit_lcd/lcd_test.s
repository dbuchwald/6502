      .setcpu "65C02"
      .include "lcd.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      jsr _lcd_init

      write_lcd #hello_msg

      ldx #$00
char_loop:
      lda chars_msg,x
      beq end_loop
      jsr _lcd_print_char
      inx
      bra char_loop
end_loop:
      bra end_loop

      .segment "RODATA"

hello_msg:
      .byte "Hello 4-bit!", $00
chars_msg:
      .byte " Chars!",$00