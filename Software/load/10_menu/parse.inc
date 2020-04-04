        .import _parse_onoff_p
        .import _parse_hex_byte_p
        .import _parse_hex_word_p

        .macro parse_onoff_p token_pointer
        pha
        lda token_pointer
        sta ptr1
        lda token_pointer+1
        sta ptr1+1
        pla
        jsr _parse_onoff_p
        .endmacro

        .macro parse_hex_byte_p token_pointer
        pha
        lda token_pointer
        sta ptr1
        lda token_pointer+1
        sta ptr1+1
        pla
        jsr _parse_hex_byte_p
        .endmacro

        .macro parse_hex_word_p token_pointer
        pha
        lda token_pointer
        sta ptr1
        lda token_pointer+1
        sta ptr1+1
        pla
        jsr _parse_hex_word_p
        .endmacro
