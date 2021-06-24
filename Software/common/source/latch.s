      .include "utils.inc"
      .include "macros.inc"
      .include "zeropage.inc"

      .import __LATCH_START__

      .export _latch_init
      .export _latch_write
      .export latch_write
      .export _latch_set
      .export _latch_reset
      .export _latch_get

LQ0_FLAG   = %00000001
LQ1_FLAG   = %00000010
LQ2_FLAG   = %00000100
LQ3_FLAG   = %00001000
LQ4_FLAG   = %00010000
LQ5_FLAG   = %00100000
LQ6_FLAG   = %01000000
EXRAM_FLAG = %10000000

LATCH_ADDRESS = __LATCH_START__

      .code
; POSITIVE C COMPLIANT
; Initialize latch register with 0x00
_latch_init:
      stz latch_register
      stz LATCH_ADDRESS
      rts

; POSITIVE C COMPLIANT - input mask in A
_latch_set:
      pha
      ora latch_register
      sta latch_register
      sta LATCH_ADDRESS
      pla
      rts

; POSITIVE C COMPLIANT - input mask in A
_latch_reset:
      pha
      eor #$ff
      and latch_register
      sta latch_register
      sta LATCH_ADDRESS
      pla
      rts

; C wrapper for latch_write
_latch_write:
      tax
      lda (sp)
      jsr latch_write
      inc_ptr sp
      rts 

; NEGATIVE C COMPLIANT - input value in A, mask in X
latch_write:
      pha
      ; normally bit in A should not be 1
      ; where bit in X is 0, but just to make sure
      stx tmp1
      and tmp1
      sta tmp1
      ; resume operation
      txa
      eor #$ff
      and latch_register
      ora tmp1
      sta latch_register
      sta LATCH_ADDRESS
      pla
      rts

; POSITIVE C COMPLIANT - result in A
_latch_get:
      lda latch_register
      rts
