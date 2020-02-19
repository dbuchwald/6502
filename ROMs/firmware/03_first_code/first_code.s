      .setcpu "65C02"

      .segment "VECTORS"

      .word   $eaea
      .word   init
      .word   $eaea

      .code

init:
      lda #$42
      sta $6000
