
        .macro switch value
        lda value
        .endmacro
        
        .macro case value, vector
        .local @skip
        cmp value
        bne @skip 
        jmp vector
@skip:
        .endmacro

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

        .macro inc_ptr pointer, offset
        .ifblank offset
        .local @skip
        inc pointer
        bne @skip
        inc pointer+1
@skip:
        .else
        php
        pha
        clc
        lda pointer
        adc offset
        sta pointer
        lda pointer+1
        adc #$00
        sta pointer+1
        pla
        plp 
        .endif
        .endmacro

        .macro dec_ptr pointer, offset
        .ifblank offset
        .local @skip
        pha
        lda pointer
        bne @skip
        dec pointer+1
@skip:
        dec pointer
        pla
        .else
        php
        pha
        sec
        lda pointer
        sbc offset
        sta pointer
        lda pointer+1
        sbc #$00
        sta pointer+1
        pla
        plp
        .endif
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

        .macro add_offset pointer, offset
        pha
        php
        clc
        lda pointer
        adc offset
        sta pointer
        lda pointer+1
        adc offset+1
        sta pointer+1
        plp
        pla
        .endmacro

        .macro add_offset_relative pointer, offset
        pha
        php
        lda offset
        bpl @not_neg
        dec pointer+1
@not_neg:
        clc
        adc pointer
        sta pointer
        lda pointer+1
        adc #$00
        sta pointer+1
        plp
        pla
        .endmacro     
