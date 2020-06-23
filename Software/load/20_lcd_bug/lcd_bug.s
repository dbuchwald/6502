        .include "lcd.inc"
        .include "utils.inc"

        .code
init:
        jsr _lcd_clear
        lda #200
        jsr _delay_ms
        write_lcd #message
        lda #100
        jsr _delay_ms
        jsr _lcd_scroll_down
        lda #100
        jsr _delay_ms
        jsr _lcd_scroll_down
        ; jsr _lcd_init
        ; write_lcd #message
        ; lda #$03
        ; jsr _delay_sec
        ; jsr _lcd_clear
        rts

        .segment "RODATA"
message: .byte "@ABCDEFGHIJKLMNO0123456789:;<=>?", $00
