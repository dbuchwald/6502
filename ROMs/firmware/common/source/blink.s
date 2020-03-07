      .include "via.inc"

      .export _blink_led

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