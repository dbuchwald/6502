      .include "via.inc"
      .include "utils.inc"

      .export _blink_init
      .export _blink_led
      .export _strobe_led

BLINK_LED_ON  = $01
BLINK_LED_OFF = $00

      .code
; POSITIVE C COMPLIANT
; Initialize DDRB bit to output
_blink_init:
      pha
      lda VIA1_DDRB
      ora #%00000001
      sta VIA1_DDRB
      pla
      rts

; POSITIVE C COMPLIANT - input in A
; no return value, no temp variables
_blink_led:
; store current value of accumulator
      pha
      cmp #(BLINK_LED_OFF)
      beq @disable_led
; if carry clear - disable LED
; enable LED otherwise
      lda VIA1_PORTB
      ora #%00000001
      bra @send_signal
@disable_led:
; send signal
      lda VIA1_PORTB
      and #%11111110
@send_signal:
      sta VIA1_PORTB
; restore accumulator value
      pla
      rts

; POSITIVE C COMPLIANT
; Short "on/off" blink
_strobe_led:
      pha
      lda #(BLINK_LED_ON)
      jsr _blink_led
      lda #150
      jsr _delay_ms
      lda #(BLINK_LED_OFF)
      jsr _blink_led
      lda #150
      jsr _delay_ms
      pla
      rts