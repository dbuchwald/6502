      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .include "via.inc"
      .include "blink.inc"
      .include "core.inc"
      .include "acia.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

      .code

init:
      jsr _init_system
      ldx #00
prompt_loop:
      lda prompt,x
      beq main_loop
      jsr _acia_write_byte
      inx
      bra prompt_loop

main_loop:
      jsr _acia_is_data_available
      cmp #00
      beq main_loop
      jsr _acia_read_byte
      jsr _lcd_print_char
      bra main_loop

prompt:
      .asciiz "OS/1 >>"