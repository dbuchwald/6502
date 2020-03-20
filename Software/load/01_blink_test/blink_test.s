        .include "syslib.inc"

        .code
        ldx #10
main_loop:
        sec
        jsr _call_blink_led
        lda #250
        jsr _call_delay_ms
        clc
        jsr _call_blink_led
        lda #250
        jsr _call_delay_ms
        dex
        bne main_loop
        rts
