      .include "via.inc"

      .export _via1_init
      .export _via1_output_portb

      .code

_via1_init:
      lda #$ff
      sta VIA1_DDRB

_via1_output_portb:
      sta VIA1_PORTB
      rts
