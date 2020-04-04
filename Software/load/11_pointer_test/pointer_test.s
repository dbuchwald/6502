        .include "string.inc"

        .macro  pstrlen    arg
                .if (.match (.left (1, {arg}), #))
                    ; immediate mode
                    lda #<(.right (.tcount ({arg})-1, {arg}))
                    sta ptr1
                    lda #>(.right (.tcount ({arg})-1, {arg}))
                    sta ptr1+1
                .else
                    ; assume absolute or zero page
                    lda arg
                    sta ptr1
                    lda 1+(arg)
                    sta ptr1+1
                .endif
                jsr _strlen
        .endmacro

        .macro  pstrcmp    arg1, arg2
                .if (.match (.left (1, {arg1}), #))
                    ; immediate mode
                    lda #<(.right (.tcount ({arg1})-1, {arg1}))
                    sta ptr1
                    lda #>(.right (.tcount ({arg1})-1, {arg1}))
                    sta ptr1+1
                .else
                    ; assume absolute or zero page
                    lda arg1
                    sta ptr1
                    lda 1+(arg1)
                    sta ptr1+1
                .endif
                .if (.match (.left (1, {arg2}), #))
                    ; immediate mode
                    lda #<(.right (.tcount ({arg2})-1, {arg2}))
                    sta ptr2
                    lda #>(.right (.tcount ({arg2})-1, {arg2}))
                    sta ptr2+1
                .else
                    ; assume absolute or zero page
                    lda arg2
                    sta ptr2
                    lda 1+(arg2)
                    sta ptr2+1
                .endif
                jsr _strcmp
        .endmacro

        .code
init:
        ; strcmp strc1, strc2
        ; .byte "####"
        ; strcmpp strc1p, strc2p
        ;pstrlen #strc1
        ;pstrlen strc1p 
        pstrcmp #strc1, #strc2
        .byte "####"
        pstrcmp strc1p, strc2p
        .byte "####"
        pstrcmp #strc1, strc2p
        .byte "####"
        pstrcmp strc1p, #strc2
        rts

        .segment "RODATA"
strc1:   .byte "abcd", $00
strc2:   .byte "abcd", $00

strc1p:  .word strc1
strc2p:  .word strc2