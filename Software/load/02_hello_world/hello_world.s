        .include "lcd.inc"
        .include "utils.inc"

        .code
        jsr _lcd_init
        write_lcd message
        lda #$03
        jsr _delay_sec
        jsr _lcd_clear
        rts

        .segment "RODATA"
message: .byte "Hello World from loadable module!", $00
