      .setcpu "65C02"
      .include "via.inc"
      .include "acia.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   irq_handler

      .code

init:
      ldx #$ff
      txs

      lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_ENABLE_RTS_LOW | ACIA_RX_INT_ENABLE | ACIA_DTR_LOW)
      sta ACIA_COMMAND
      lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_19200)
      sta ACIA_CONTROL
      cli

dead_loop:
      bra dead_loop

irq_handler:
      pha
      lda ACIA_STATUS
      bpl exit_handler
      rol
      ; ignore DSR
      rol
      ; ignore DCD
      rol
      bpl tx_empty_exit
      pha
      lda prompt,x
      bne tx_char
      pla
      bra tx_empty_exit
tx_char:
      sta ACIA_DATA
      inx
      pla
tx_empty_exit:
      rol
      bpl rx_full_exit
      pha
      lda ACIA_DATA
      lda prompt,x
      bne not_fully_sent
      ldx #$00
not_fully_sent:
      pla
rx_full_exit:
      rol
      ; ignore overrun
      rol
      ; ignore framing error
      rol
      ; ignore parity error
exit_handler:
      pla
      rti

prompt:
      .byte "Hello IRQ>", $0a, $0d, $00