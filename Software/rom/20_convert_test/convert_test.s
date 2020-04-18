      .setcpu "65C02"
      .include "utils.inc"
      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      ldx #$ff
      txs

loop:
      lda #$61
      jsr convert_to_hex
      stx $2000
      sty $2001
      lda #$2a
      jsr convert_to_hex
      stx $2002
      sty $2003
      lda #$47
      jsr convert_to_hex
      stx $2004
      sty $2005
bra loop
