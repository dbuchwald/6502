      .include "via.inc"
      .include "utils.inc"

      .export _init_blink_led
      .export _blink_led
      .export _strobe_led

; Initialize DDRB bit to output
_init_blink_led:
      pha
      lda VIA1_DDRB
      ora #%00000001
      sta VIA1_DDRB
      pla
      rts

; operation is determined by carry flag
_blink_led:
; store current value of accumulator
      pha
      lda VIA1_PORTB
; if carry clear - disable LED
      bcc @disable_led
; enable LED otherwise
      ora #%00000001
      bra @send_signal
@disable_led:
; send signal
      and #%11111110
@send_signal:
      sta VIA1_PORTB
; restore accumulator value
      pla
      rts

; Short "on/off" blink
_strobe_led:
      sec
      jsr _blink_led
      lda #150
      jsr _delay_ms
      clc
      jsr _blink_led
      lda #150
      jsr _delay_ms
      rts