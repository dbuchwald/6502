        .include "via_const.inc"
        .include "macros.inc"
        .include "zeropage.inc"

        .import __VIA2_START__
        .export via2_get_register
        .export _via2_get_register
        .export via2_set_register
        .export _via2_set_register

        .code

; NEGATIVE C COMPLIANT
via2_get_register:
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
        lda __VIA2_START__,X
        rts

; C version of the set register routine
_via2_get_register:
        tax
        lda __VIA2_START__,X
        rts

; NEGATIVE C COMPLIANT
via2_set_register:
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
        sta __VIA2_START__,X
        rts

; C version of the set register routine
_via2_set_register:
        pha
        lda (sp)
        tax
        pla
        sta __VIA2_START__,X
        inc_ptr sp
        rts