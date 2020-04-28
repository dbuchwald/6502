        .import _parse_onoff
        .import parse_onoff
        .import _parse_hex_byte
        .import parse_hex_byte
        .import _parse_hex_word
        .import parse_hex_word
        .import _parse_dec_word
        .import parse_dec_word

        .macro parse_onoff token
        phx
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            ldx #>(.right (.tcount ({token})-1, {token}))
        .else
            ; assume absolute or zero page
            lda token
            ldx 1+(token)
        .endif
        jsr parse_onoff
        plx
        .endmacro

        .macro parse_hex_byte token
        phx
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            ldx #>(.right (.tcount ({token})-1, {token}))
        .else
            ; assume absolute or zero page
            lda token
            ldx 1+(token)
        .endif
        jsr parse_hex_byte
        plx
        .endmacro

        .macro parse_hex_word token
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            ldx #>(.right (.tcount ({token})-1, {token}))
        .else
            ; assume absolute or zero page
            lda token
            ldx 1+(token)
        .endif
        jsr parse_hex_word
        .endmacro

        .macro parse_dec_word token
        .if (.match (.left (1, {token}), #))
            ; immediate mode
            lda #<(.right (.tcount ({token})-1, {token}))
            ldx #>(.right (.tcount ({token})-1, {token}))
        .else
            ; assume absolute or zero page
            lda token
            ldx 1+(token)
        .endif
        jsr parse_dec_word
        .endmacro
