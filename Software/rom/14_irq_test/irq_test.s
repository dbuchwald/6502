      .setcpu "65C02"
      .include "via.inc"
      .include "via_const.inc"
      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   irq_handler

      .code

init:
irq_init:
      lda #$01
      sta VIA1_DDRB


      lda #(VIA_ACR_T1_CONT_NO_PB7)
      sta VIA1_ACR
      lda #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG)
      sta VIA1_IER

      lda #$60
      sta VIA1_T1CL
      lda #$00
      sta VIA1_T1CH
      cli

program_loop:
      jmp program_loop

irq_handler:
      pha
      lda VIA1_T1CL

      lda #$01
      sta VIA1_PORTB
      lda #$00
      sta VIA1_PORTB

      pla
      rti
