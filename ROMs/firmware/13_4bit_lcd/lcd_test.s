      .setcpu "65C02"
      .include "via.inc"
      .include "lcd.inc"
      .include "utils.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      jsr _lcd_init
loop:
      bra loop

