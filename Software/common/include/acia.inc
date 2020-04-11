        .include "zeropage.inc"

        .import _acia_init
        .import _handle_acia_irq
        .import _acia_is_data_available
        .import _acia_read_byte
        .import _acia_write_byte
        .import _acia_write_string
        .import ACIA_STATUS

ACIA_DATA_AVAILABLE    = $01
ACIA_NO_DATA_AVAILABLE = $00

        .macro write_acia string
        pha
        phx
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            ldx #>(.right (.tcount ({string})-1, {string}))
        .else
            ; assume absolute or zero page
            lda string
            ldx 1+(string)
        .endif
        jsr _acia_write_string
        plx
        pla
        .endmacro
