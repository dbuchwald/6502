        .include "zeropage.inc"

        .import _tty_init
        .import _tty_read_line
        .import tty_read_line
        .import _tty_write
        .import _tty_writeln
        .import _tty_write_hex
        .import _tty_write_dec
        .import _tty_send_newline
        .import _tty_send_character

        .macro tty_read_line buffer, buffer_size
        pha
        phx
        phy
        .if (.match (.left (1, {buffer}), #))
            ; immediate mode
            lda #<(.right (.tcount ({buffer})-1, {buffer}))
            ldx #>(.right (.tcount ({buffer})-1, {buffer}))
        .else
            ; assume absolute or zero page
            lda buffer
            ldx 1+(buffer)
        .endif
        ldy #(buffer_size)
        jsr tty_read_line
        ply
        plx
        pla
        .endmacro

        .macro write_tty string
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
        jsr _tty_write
        plx
        pla
        .endmacro

        .macro writeln_tty string
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
        jsr _tty_writeln
        plx
        pla
        .endmacro

        .macro write_tty_hex
        jsr _tty_write_hex
        .endmacro

        .macro write_tty_address pointer
        pha
        .if (.match (.left (1, {pointer}), #))
            ; immediate mode
            lda #>(.right (.tcount ({pointer})-1, {pointer}))
            jsr _tty_write_hex
            lda #<(.right (.tcount ({pointer})-1, {pointer}))
            jsr _tty_write_hex
        .else
            ; assume absolute or zero page
            lda 1+(pointer)
            jsr _tty_write_hex
            lda pointer
            jsr _tty_write_hex
        .endif
        pla
        .endmacro

        .macro write_tty_dec value
        pha
        phx
        .if (.match (.left (1, {value}), #))
            ; immediate mode
            lda #<(.right (.tcount ({value})-1, {value}))
            ldx #>(.right (.tcount ({value})-1, {value}))
        .else
            ; assume absolute or zero page
            lda value
            ldx 1+(value)
        .endif
        jsr _tty_write_dec
        plx
        pla
        .endmacro

TTY_CONFIG_INPUT_SERIAL   = %00000001
TTY_CONFIG_INPUT_KEYBOARD = %00000010
TTY_CONFIG_OUTPUT_SERIAL  = %00000100
TTY_CONFIG_OUTPUT_LCD     = %00001000