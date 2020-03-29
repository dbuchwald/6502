        .include "zeropage.inc"

        .import _tty_init
        .import _tty_read_line
        .import _tty_write
        .import _tty_writeln

        .macro tty_read_line buffer, buffer_size
        pha
        lda #<buffer
        sta ptr1
        lda #>buffer
        sta ptr1+1
        lda #buffer_size
        sta tmp1
        pla
        jsr _tty_read_line
        .endmacro

        .macro write_tty string
        pha
        lda #<string
        sta ptr1
        lda #>string
        sta ptr1+1
        pla
        jsr _tty_write
        .endmacro

        .macro writeln_tty string
        pha
        lda #<string
        sta ptr1
        lda #>string
        sta ptr1+1
        pla
        jsr _tty_writeln
        .endmacro


TTY_CONFIG_INPUT_SERIAL   = %00000001
TTY_CONFIG_INPUT_KEYBOARD = %00000010
TTY_CONFIG_OUTPUT_SERIAL  = %00000100
TTY_CONFIG_OUTPUT_LCD     = %00001000