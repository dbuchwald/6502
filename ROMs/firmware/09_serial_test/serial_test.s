      .setcpu "65C02"
      .include "via.inc"
      .include "acia.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      ldx #$ff
      txs

      lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_DISABLE_RTS_LOW | ACIA_RX_INT_DISABLE | ACIA_DTR_LOW)
      sta ACIA_COMMAND
      lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_9600)
      sta ACIA_CONTROL

send_loop:
      ldx #$00
write_char:
      lda prompt, x
      beq read_loop
      pha
wait_txd_empty:
      lda ACIA_STATUS
      and #ACIA_STATUS_TX_EMPTY
      beq wait_txd_empty
      pla 
      sta ACIA_DATA
      inx
      bra write_char

read_loop:
wait_rxd_full:
      lda ACIA_STATUS
      and #ACIA_STATUS_RX_FULL
      beq wait_rxd_full
      lda ACIA_DATA
      bra send_loop

prompt:
      .byte "Hello>", $0a, $0d, $00