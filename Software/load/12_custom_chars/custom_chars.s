        .include "lcd.inc"
        .include "utils.inc"

CHAR_MOUTH_OPEN   = $00
CHAR_MOUTH_CLOSED = $01

        .code
init:
        jsr _lcd_clear
        ; post character
        lcd_define_char CHAR_MOUTH_OPEN, #mouth_open_map
        lcd_define_char CHAR_MOUTH_CLOSED, #mouth_closed_map
        
        ldx #$05
        ldy #$01
        jsr lcd_set_position
        write_lcd #blahmsg

        stz counter

@main_loop:

        ldx #$03
        ldy #$01
        jsr lcd_set_position
        lda #(CHAR_MOUTH_OPEN)
        jsr _lcd_print_char

        lda #200
        jsr _delay_ms

        ldx #$03
        ldy #$01
        jsr lcd_set_position
        lda #(CHAR_MOUTH_CLOSED)
        jsr _lcd_print_char

        lda #150
        jsr _delay_ms

        inc counter
        lda counter
        cmp #$10
        bne @main_loop

        jsr _lcd_clear
        rts

        .segment "BSS"
counter:
        .res 1

        .segment "RODATA"
blahmsg:
        .asciiz "Blah blah..."

mouth_open_map:
        .byte %00001110
        .byte %00011111
        .byte %00010101
        .byte %00011111
        .byte %00010001
        .byte %00001110
        .byte %00000000
        .byte %00000000

mouth_closed_map:
        .byte %00001110
        .byte %00011111
        .byte %00010101
        .byte %00011111
        .byte %00011111
        .byte %00000000
        .byte %00000000
        .byte %00000000

; safeguarding from trim operation 
        .byte $ff

        