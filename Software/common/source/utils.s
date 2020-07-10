      .include "zeropage.inc"
      .include "macros.inc"
      .include "clock.inc"

      .export _delay_ms
      .export _delay_sec
      .export convert_to_hex
      .export _convert_to_hex
      .export convert_hex_to_dec
      .export _convert_hex_to_dec

      .code
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

; C wrapper for convert_to_hex function
; output buffer in A/X
; input value on stack
_convert_to_hex:
        sta ptr1
        stx ptr1+1
        lda (sp)
        jsr convert_to_hex
        txa
        sta (ptr1)
        tya
        ldy #$01
        sta (ptr1),y
        inc_ptr sp
        rts

; NEGATIVE C COMPLIANT - value returned in X, Y
; Destroys X and Y registers - output values there
; Y - lsb char
; X - msb char
convert_to_hex:
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

; C wrapper for covert_hex_to_dec function:
; output buffer address in A/X, input on stack
_convert_hex_to_dec:
      sta ptr1
      stx ptr1+1
      ldy #$01
      lda (sp),y
      tax
      lda (sp)
      jsr convert_hex_to_dec
      inc_ptr sp, #$02
      rts

; NEGATIVE C compliant
; input in A/X, output in ptr1
convert_hex_to_dec:
      phy
      sta hex_to_dec_in
      stx hex_to_dec_in+1
      ; enable decimal arithmetic
      sed
      stz hex_to_dec_out
      stz hex_to_dec_out+1
      stz hex_to_dec_out+2
      ldx #$2d ; 3*15
@convert_loop:
      asl hex_to_dec_in
      rol hex_to_dec_in+1
      bcc @next_bit
      lda hex_to_dec_out
      clc
      adc hex_to_dec_table+2,x
      sta hex_to_dec_out
      lda hex_to_dec_out+1
      adc hex_to_dec_table+1,x
      sta hex_to_dec_out+1
      lda hex_to_dec_out+2
      adc hex_to_dec_table,x
      sta hex_to_dec_out+2
@next_bit:
      dex
      dex
      dex
      bpl @convert_loop
      cld
      ldy #$02
@copy_loop:
      lda hex_to_dec_out,y
      sta (ptr1),y
      dey
      bpl @copy_loop
      ply
      rts

      .segment "BSS"
hex_to_dec_in:
      .res 2
hex_to_dec_out:
      .res 3

      .segment "RODATA"
hex_chars:
      .byte "0123456789abcdef"
hex_to_dec_table:
      .byte $00, $00, $01,   $00, $00, $02,   $00, $00, $04,   $00, $00, $08
      .byte $00, $00, $16,   $00, $00, $32,   $00, $00, $64,   $00, $01, $28
      .byte $00, $02, $56,   $00, $05, $12,   $00, $10, $24,   $00, $20, $48
      .byte $00, $40, $96,   $00, $81, $92,   $01, $63, $84,   $03, $27, $68
