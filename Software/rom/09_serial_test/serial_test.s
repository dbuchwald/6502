      .setcpu "65C02"
      .include "via.inc"
      .import __ACIA_START__

ACIA_DATA    = __ACIA_START__ + $00
ACIA_STATUS  = __ACIA_START__ + $01
ACIA_COMMAND = __ACIA_START__ + $02
ACIA_CONTROL = __ACIA_START__ + $03

ACIA_STOP_BITS_1 = %00000000
ACIA_STOP_BITS_2 = %10000000
ACIA_DATA_BITS_8 = %00000000
ACIA_DATA_BITS_7 = %00100000
ACIA_DATA_BITS_6 = %01000000
ACIA_DATA_BITS_5 = %01100000
ACIA_CLOCK_EXT   = %00000000
ACIA_CLOCK_INT   = %00010000
ACIA_BAUD_16XEXT = %00000000
ACIA_BAUD_50     = %00000001
ACIA_BAUD_75     = %00000010
ACIA_BAUD_109    = %00000011
ACIA_BAUD_134    = %00000100
ACIA_BAUD_150    = %00000101
ACIA_BAUD_300    = %00000110
ACIA_BAUD_600    = %00000111
ACIA_BAUD_1200   = %00001000
ACIA_BAUD_1800   = %00001001
ACIA_BAUD_2400   = %00001010
ACIA_BAUD_3600   = %00001011
ACIA_BAUD_4800   = %00001100
ACIA_BAUD_7200   = %00001101
ACIA_BAUD_9600   = %00001110
ACIA_BAUD_19200  = %00001111

; ACIA command register bit values

ACIA_PARITY_ODD              = %00000000
ACIA_PARITY_EVEN             = %01000000
ACIA_PARITY_MARK             = %10000000
ACIA_PARITY_SPACE            = %11000000
ACIA_PARITY_DISABLE          = %00000000
ACIA_PARITY_ENABLE           = %00100000
ACIA_ECHO_DISABLE            = %00000000
ACIA_ECHO_ENABLE             = %00010000
ACIA_TX_INT_DISABLE_RTS_HIGH = %00000000
ACIA_TX_INT_ENABLE_RTS_LOW   = %00000100
ACIA_TX_INT_DISABLE_RTS_LOW  = %00001000
ACIA_TX_INT_DISABLE_BREAK    = %00001100
ACIA_RX_INT_ENABLE           = %00000000
ACIA_RX_INT_DISABLE          = %00000010
ACIA_DTR_HIGH                = %00000000
ACIA_DTR_LOW                 = %00000001

; ACIA status register bit masks

ACIA_STATUS_IRQ        = 1 << 7
ACIA_STATUS_DSR        = 1 << 6
ACIA_STATUS_DCD        = 1 << 5
ACIA_STATUS_TX_EMPTY   = 1 << 4
ACIA_STATUS_RX_FULL    = 1 << 3
ACIA_STATUS_OVERRUN    = 1 << 2
ACIA_STATUS_FRAME_ERR  = 1 << 1
ACIA_STATUS_PARITY_ERR = 1 << 0

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
      lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_19200)
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