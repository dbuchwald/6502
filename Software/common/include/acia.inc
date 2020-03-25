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
        lda #<string
        sta acia_str_ptr
        lda #>string
        sta acia_str_ptr+1
        pla
        jsr _acia_write_string
        .endmacro   
        