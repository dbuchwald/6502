      .setcpu "65C02"
      .include "via.inc"

      .segment "VECTORS"

      .word   $eaea
      .word   init
      .word   $eaea

      .code

init:
      lda #$ff
      sta VIA1_DDRB
loop:
      lda #$55
      sta VIA1_PORTB
      lda #$aa
      sta VIA1_PORTB
      jmp loop
