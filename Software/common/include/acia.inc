        .include "zeropage.inc"

        .import _acia_init
        .import _handle_acia_irq
        .import _acia_is_data_available
        .import _acia_read_byte
        .import _acia_write_byte
        .import _acia_write_string
        .import ACIA_STATUS

        .macro write_acia string
        pha
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            sta ptr1
            lda #>(.right (.tcount ({string})-1, {string}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda string
            sta ptr1
            lda 1+(string)
            sta ptr1+1
        .endif
        pla
        jsr _acia_write_string
        .endmacro
