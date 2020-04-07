        .include "zeropage.inc"

        .import _tty_init
        .import _tty_read_line
        .import _tty_write
        .import _tty_writeln
        .import _tty_write_hex
        .import _tty_send_newline

        .macro tty_read_line buffer, buffer_size
        pha
        .if (.match (.left (1, {buffer}), #))
            ; immediate mode
            lda #<(.right (.tcount ({buffer})-1, {buffer}))
            sta ptr1
            lda #>(.right (.tcount ({buffer})-1, {buffer}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda buffer
            sta ptr1
            lda 1+(buffer)
            sta ptr1+1
        .endif
        lda #buffer_size
        sta tmp1
        pla
        jsr _tty_read_line
        .endmacro

        .macro write_tty string
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
        jsr _tty_write
        .endmacro

        .macro writeln_tty string
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
        jsr _tty_writeln
        .endmacro

        .macro write_tty_hex
        jsr _tty_write_hex
        .endmacro

        .macro write_tty_address pointer
        pha
        .if (.match (.left (1, {pointer}), #))
            ; immediate mode
            lda #<(.right (.tcount ({pointer})-1, {pointer}))
            jsr _tty_write_hex
            lda #>(.right (.tcount ({pointer})-1, {pointer}))
            jsr _tty_write_hex
        .else
            ; assume absolute or zero page
            lda pointer
            jsr _tty_write_hex
            lda 1+(pointer)
            jsr _tty_write_hex
        .endif
        pla
        .endmacro

TTY_CONFIG_INPUT_SERIAL   = %00000001
TTY_CONFIG_INPUT_KEYBOARD = %00000010
TTY_CONFIG_OUTPUT_SERIAL  = %00000100
TTY_CONFIG_OUTPUT_LCD     = %00001000