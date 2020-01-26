      .setcpu "65C02"

      .segment "VECTORS"

      .word   $eaea
      .word   init
      .word   $eaea

      .code

init: