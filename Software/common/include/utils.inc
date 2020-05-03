        .import _delay_ms
        .import _delay_sec
        .import _convert_to_hex
        .import convert_to_hex
        .import _convert_hex_to_dec
        .import convert_hex_to_dec

        .macro convert_hex_to_dec hex_num, dec_buffer
        .if (.match (.left (1, {dec_buffer}), #))
            ; immediate mode
            lda #<(.right (.tcount ({dec_buffer})-1, {dec_buffer}))
            sta ptr1
            lda #>(.right (.tcount ({dec_buffer})-1, {dec_buffer}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda dec_buffer
            sta ptr1
            lda 1+(dec_buffer)
            sta ptr1+1
        .endif
        .if (.match (.left (1, {hex_num}), #))
            ; immediate mode
            lda #<(.right (.tcount ({hex_num})-1, {hex_num}))
            ldx #>(.right (.tcount ({hex_num})-1, {hex_num}))
        .else
            ; assume absolute or zero page
            lda hex_num
            ldx 1+(hex_num)
        .endif
        jsr convert_hex_to_dec
        .endmacro
