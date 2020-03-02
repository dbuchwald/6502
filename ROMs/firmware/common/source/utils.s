      .include "zeropage.inc"

      .export _delay_ms
      .export _delay_sec

_delay_ms:
      sta tmp1
      txa
      pha
      tya
      pha
      ldx tmp1

      ldy #190
loop1:
      dey
      bne loop1

loop2:
      dex
      beq return

      nop
      ldy #198
loop3:
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

_delay_sec:
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


