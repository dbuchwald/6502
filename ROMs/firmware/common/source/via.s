      .import __VIA1_START__
      .import __VIA2_START__
      .export VIA1_PORTB
      .export VIA1_PORTA
      .export VIA1_DDRB
      .export VIA1_DDRA
      .export VIA2_PORTB
      .export VIA2_PORTA
      .export VIA2_DDRB
      .export VIA2_DDRA

VIA1_PORTB = __VIA1_START__ + $00
VIA1_PORTA = __VIA1_START__ + $01
VIA1_DDRB  = __VIA1_START__ + $02
VIA1_DDRA  = __VIA1_START__ + $03

VIA2_PORTB = __VIA2_START__ + $00
VIA2_PORTA = __VIA2_START__ + $01
VIA2_DDRB  = __VIA2_START__ + $02
VIA2_DDRA  = __VIA2_START__ + $03
