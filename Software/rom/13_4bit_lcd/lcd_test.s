      .setcpu "65C02"
      .include "lcd.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      jsr _lcd_init
      lda #<hello_msg
      sta lcd_out_ptr
      lda #>hello_msg
      sta lcd_out_ptr+1
      jsr _lcd_print
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