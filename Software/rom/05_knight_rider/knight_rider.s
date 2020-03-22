      .setcpu "65C02"
      .include "via.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      lda #$ff
      sta VIA2_DDRB
      lda #$01
      sta VIA2_PORTB
loop_l:
      rol A
      bcs loop_r
      sta VIA2_PORTB
      jmp loop_l
loop_r:
      ror A
      bcs loop_l
      sta VIA2_PORTB
      jmp loop_r
