        .setcpu "65C02"
        .include "blink.inc"
        .include "utils.inc"

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

        .code
init:
        jsr _blink_init
        ldx #10
main_loop:
        lda #(BLINK_LED_ON)
        jsr _blink_led
        lda #250
        jsr _delay_ms
        lda #(BLINK_LED_OFF)
        jsr _blink_led
        lda #250
        jsr _delay_ms
        dex
        bne main_loop
        rts
