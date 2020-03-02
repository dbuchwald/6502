      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .include "via.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      lda #$01
      sta VIA1_DDRB
      lda #$01
      sta VIA1_PORTB
      jsr _lcd_init
      lda #<hello_msg
      sta lcd_out_ptr
      lda #>hello_msg
      sta lcd_out_ptr+1
      jsr _lcd_print
      lda #$05
      jsr _delay_sec
      ldx #$00
      jsr _lcd_clear
      lda #$03
      jsr _delay_sec
char_loop:
      lda chars_msg,x
      beq end_loop
      jsr _lcd_print_char
      lda #$01
      jsr _delay_sec
      inx
      bra char_loop
end_loop:
      bra end_loop

      .segment "RODATA"

hello_msg:
      .byte "Hello 4-bit!", $00
chars_msg:
      .byte "Single chars!",$00
