        .include "syslib.inc"

        .code
;         ldx #10
; main_loop:
;         sec
;         jsr _call_blink_led
;         lda #250
;         jsr _call_delay_ms
;         clc
;         jsr _call_blink_led
;         lda #250
;         jsr _call_delay_ms
;         dex
;         bne main_loop
        jsr _call_lcd_clear
        ldx #$00
main_loop:
        lda message,x
        beq done
        jsr _call_lcd_print_char
        inx
        bra main_loop
done:
        lda #$03
        jsr _call_delay_sec
        jsr _call_lcd_clear
        rts

        .segment "RODATA"
message: .byte "Hello World from loadable module!", $00
