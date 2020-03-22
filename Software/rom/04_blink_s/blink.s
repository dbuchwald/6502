      .setcpu "65C02"
      .include "via.inc"

      .segment "VECTORS"

      .word   $eaea
      .word   init
      .word   $eaea

      .code

init:
      lda #$ff
      sta VIA2_DDRB
loop:
      lda #$55
      sta VIA2_PORTB
      lda #$aa
      sta VIA2_PORTB
      jmp loop
