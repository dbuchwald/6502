      .setcpu "65C02"
      .include "via.inc"
      .include "lcd.inc"
      .include "utils.inc"
      .include "zeropage.inc"

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
loop:
      bra loop

      .segment "RODATA"

hello_msg:
      .byte "Hello 4-bit!", $00