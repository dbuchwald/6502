        .import _delay_ms
        .import _delay_sec
        .import _convert_to_hex

        .macro push_ptr address
        lda address+1
        pha
        lda address
        pha
        .endmacro

        .macro pull_ptr address
        pla
        sta address
        pla
        sta address+1
        .endmacro

        .macro copy_ptr source, target
        pha
        .if (.match (.left (1, {source}), #))
            ; immediate mode
            lda #<(.right (.tcount ({source})-1, {source}))
            sta target
            lda #>(.right (.tcount ({source})-1, {source}))
            sta target+1
        .else
            ; assume absolute or zero page
            lda source
            sta target
            lda 1+(source)
            sta target+1
        .endif
        pla
        .endmacro

        .macro inc_ptr pointer
        .local @skip
        inc pointer
        bne @skip
        inc pointer+1
@skip:
        .endmacro

        .macro dec_ptr pointer
        .local @skip
        pha
        lda pointer
        bne @skip
        dec pointer+1
@skip:
        dec pointer
        pla
        .endmacro

        .macro cmp_ptr pointer1, pointer2
        .local @skip
        lda pointer1+1
        cmp pointer2+1
        bne @skip
        lda pointer1
        cmp pointer2
@skip:
        .endmacro