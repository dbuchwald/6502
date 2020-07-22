        .include "via_const.inc"

        .import __VIA2_START__
        .export _via2_set_register
        .export _via2_get_register

        .code

_via2_get_register:
; ; DUMB Code left here for reference. This is possibly the
; ; most idiotic code I have written in years
;       pha
;       lda #<__VIA2_START__
;       sta ptr1
;       lda #>__VIA2_START__
;       sta ptr1+1
;       pla
;       clc
;       adc ptr1
;       sta ptr1
;       lda #$00
;       adc ptr1+1
;       sta ptr1+1
;       lda (ptr1)
;       rts
        phx
        tax
        lda __VIA2_START__,X
        plx
        rts

_via2_set_register:
; ; DUMB Code left here for reference. This is possibly the
; ; most idiotic code I have written in years
;       pha
;       lda #<__VIA2_START__
;       sta ptr1
;       lda #>__VIA2_START__
;       sta ptr1+1
;       pla
;       clc
;       adc ptr1
;       sta ptr1
;       lda #$00
;       adc ptr1+1
;       sta ptr1+1
;       txa
;       sta (ptr1)
;       rts
; Order of parameters intentionally reversed, I just prefer C
; convention of via2_set_register(register, value)
        pha
        txa
        plx
        sta __VIA2_START__,X
        rts
