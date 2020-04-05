        .import _parse_onoff
        .import _parse_hex_byte
        .import _parse_hex_word

        .macro parse_onoff token
        pha
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            sta ptr1
            lda #>(.right (.tcount ({token})-1, {token}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda token
            sta ptr1
            lda 1+(token)
            sta ptr1+1
        .endif
        pla
        jsr _parse_onoff
        .endmacro

        .macro parse_hex_byte token
        pha
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            sta ptr1
            lda #>(.right (.tcount ({token})-1, {token}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda token
            sta ptr1
            lda 1+(token)
            sta ptr1+1
        .endif
        pla
        jsr _parse_hex_byte
        .endmacro

        .macro parse_hex_word token
        pha
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            sta ptr1
            lda #>(.right (.tcount ({token})-1, {token}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda token
            sta ptr1
            lda 1+(token)
            sta ptr1+1
        .endif
        pla
        jsr _parse_hex_word
        .endmacro
