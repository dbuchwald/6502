      .import __VIA1_START__
      .import __VIA2_START__

      .export VIA1_PORTB
      .export VIA1_PORTA
      .export VIA1_DDRB
      .export VIA1_DDRA
      .export VIA1_T1CL
      .export VIA1_T1CH
      .export VIA1_T1LL
      .export VIA1_T1LH
      .export VIA1_T2CL
      .export VIA1_T2CH
      .export VIA1_SR
      .export VIA1_ACR
      .export VIA1_PCR
      .export VIA1_IFR
      .export VIA1_IER
      .export VIA1_PANH

      .export VIA2_PORTB
      .export VIA2_PORTA
      .export VIA2_DDRB
      .export VIA2_DDRA
      .export VIA2_T1CL
      .export VIA2_T1CH
      .export VIA2_T1LL
      .export VIA2_T1LH
      .export VIA2_T2CL
      .export VIA2_T2CH
      .export VIA2_SR
      .export VIA2_ACR
      .export VIA2_PCR
      .export VIA2_IFR
      .export VIA2_IER
      .export VIA2_PANH

VIA1_PORTB = __VIA1_START__ + $00
VIA1_PORTA = __VIA1_START__ + $01
VIA1_DDRB  = __VIA1_START__ + $02
VIA1_DDRA  = __VIA1_START__ + $03
VIA1_T1CL  = __VIA1_START__ + $04
VIA1_T1CH  = __VIA1_START__ + $05
VIA1_T1LL  = __VIA1_START__ + $06
VIA1_T1LH  = __VIA1_START__ + $07
VIA1_T2CL  = __VIA1_START__ + $08
VIA1_T2CH  = __VIA1_START__ + $09
VIA1_SR    = __VIA1_START__ + $0a
VIA1_ACR   = __VIA1_START__ + $0b
VIA1_PCR   = __VIA1_START__ + $0c
VIA1_IFR   = __VIA1_START__ + $0d
VIA1_IER   = __VIA1_START__ + $0e
VIA1_PANH  = __VIA1_START__ + $0f

VIA2_PORTB = __VIA2_START__ + $00
VIA2_PORTA = __VIA2_START__ + $01
VIA2_DDRB  = __VIA2_START__ + $02
VIA2_DDRA  = __VIA2_START__ + $03
VIA2_T1CL  = __VIA1_START__ + $04
VIA2_T1CH  = __VIA1_START__ + $05
VIA2_T1LL  = __VIA1_START__ + $06
VIA2_T1LH  = __VIA1_START__ + $07
VIA2_T2CL  = __VIA1_START__ + $08
VIA2_T2CH  = __VIA1_START__ + $09
VIA2_SR    = __VIA1_START__ + $0a
VIA2_ACR   = __VIA1_START__ + $0b
VIA2_PCR   = __VIA1_START__ + $0c
VIA2_IFR   = __VIA1_START__ + $0d
VIA2_IER   = __VIA1_START__ + $0e
VIA2_PANH  = __VIA1_START__ + $0f
