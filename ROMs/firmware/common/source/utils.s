      .include "zeropage.inc"

      .export _delay_ms
      .export _delay_sec
      .export _convert_to_hex

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

; Destroys X and Y registers - output values there
; Y - lsb char
; X - msb char
_convert_to_hex:
      ; not an error, preserving input
      pha
      pha
      ; lsb first
      and #$0f
      ; use x index to load to output register (Y)
      tax
      ldy hex_chars,x
      ; msb now
      pla
      lsr
      lsr
      lsr
      lsr
      ; get character here
      tax
      lda hex_chars,x
      ; transfer result to output (X)
      tax
      ; restoring input
      pla
      rts

      .segment "RODATA"
hex_chars:
      .byte "0123456789abcdef"