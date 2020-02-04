        .import __VIA1_START__
        .export VIA1_PORTB
        .export VIA1_PORTA
        .export VIA1_DDRB
        .export VIA1_DDRA

VIA1_PORTB = __VIA1_START__ + $00
VIA1_PORTA = __VIA1_START__ + $01
VIA1_DDRB  = __VIA1_START__ + $02
VIA1_DDRA  = __VIA1_START__ + $03