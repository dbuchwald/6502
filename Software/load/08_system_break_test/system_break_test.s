      .setcpu "65C02"
      .include "tty.inc"

init:
      writeln_tty #msgblocked

infinite_loop:
      jmp infinite_loop

      .segment "RODATA"
msgblocked:
      .byte "Running CPU blocking process.", $00
