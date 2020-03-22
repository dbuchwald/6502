      .include "via.inc"

      .export _via1_init
      .export _via2_init
      .export _via1_output_portb
      .export _via2_output_portb

      .code

_via1_init:
      lda #$ff
      sta VIA1_DDRB
      rts

_via2_init:
      lda #$ff
      sta VIA2_DDRB
      rts

_via1_output_portb:
      sta VIA1_PORTB
      rts

_via2_output_portb:
      sta VIA2_PORTB
      rts
