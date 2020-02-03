      .setcpu "65C02"


      .export __STARTUP__ : absolute = 1

      .import zerobss
      .import copydata

      .segment "VECTORS"

      .word   $eaea
      .word   init
      .word   $eaea

      .import _main

      .segment "STARTUP"
      ;.code

init:
      cld
      ldx #$ff
      txs

      jsr zerobss
      jsr copydata
      jsr _main
