      .include "clock.inc"
      .include "zeropage.inc"

      .export _delay_init
      .export _delay_ms
      .export _delay_sec

      .code
; POSITIVE C COMPLIANT
_delay_init:
      rts

; POSITIVE C COMPLIANT
_delay_ms:
      ; Skip the routine when 1MHz clock is disabled
      .if fastclock=0
      rts
      .endif
      sta tmp1
      txa
      pha
      tya
      pha
      ldx tmp1

      .if clock_divider=0
      ldy #190
      .else
      ldy #46
      .endif
loop1:
      .if clock_mhz>1
      .repeat (clock_mhz-1)
      nop ; two cycles
      adc $00 ; three cycles
      .endrepeat
      .endif
      dey
      bne loop1

loop2:
      dex
      beq return

      nop
      .if clock_divider=0
      ldy #198
      .else
      ldy #49
      .endif
loop3:
      .if clock_mhz>1
      .repeat (clock_mhz-1)
      nop ; two cycles
      adc $00 ; three cycles
      .endrepeat
      .endif
      dey
      bne loop3

      jmp loop2

return:
      pla
      tay
      pla
      tax
      lda tmp1
      rts

; POSITIVE C COMPLIANT
_delay_sec:
      ; Skip the routine when 1MHz clock is disabled
      .if fastclock=0
      rts
      .endif
; store original value in A register
      pha
; multiply by 4
      asl
      asl
outer_loop:
; exit if 0 quarter-seconds left
      cmp #$00
      beq exit_delay_sec
; store current counter
      pha
; sleep for 250 ms
      lda #250
      jsr _delay_ms
; get previous value of A register
      pla
; decrease by one quarter-second
      dec
; repeat outer loop
      bra outer_loop
exit_delay_sec:
; restore original value of A register
      pla
; return
      rts