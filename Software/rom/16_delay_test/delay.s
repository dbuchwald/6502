      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
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

      write_lcd #hello_msg

      lda #$03
      jsr _delay_sec
      ldx #$00
      jsr _lcd_clear
      lda #$02
      jsr _delay_sec
      ldx #05
      ldy #01
      jsr lcd_set_position
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
      .byte "Hello 4-bit! Long text kept here for testing purposes of the LCD implementation including full word wrap", $00
chars_msg:
      .byte "Single chars!",$00
