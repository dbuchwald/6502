        .include "zeropage.inc"

        .import _serial_init
        .import _handle_serial_irq
        .import _serial_is_data_available
        .import _serial_read_byte
        .import serial_write_byte
        .import serial_write_string
        .import _serial_write_byte
        .import _serial_write_string
        .import _serial_flush
        .import _serial_disable

        .macro serial_write_string channel, string
        pha
        phx
        phy
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            ldx #>(.right (.tcount ({string})-1, {string}))
        .else
            ; assume absolute or zero page
            lda string
            ldx 1+(string)
        .endif
        ldy channel
        jsr serial_write_string
        ply
        plx
        pla
        .endmacro
