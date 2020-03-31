        .include "sys_const.inc"

        .export acia_rx_buffer
        .export acia_tx_buffer
        .export keyboard_buffer
        .export lcd_line_buffer

        .segment "SYSRAM"
        .align 256

acia_rx_buffer:
        .res ACIA_RX_BUFFER_SIZE
acia_tx_buffer:
        .res ACIA_TX_BUFFER_SIZE
keyboard_buffer:
        .res KEYBOARD_BUFFER_SIZE
lcd_line_buffer:
        .res LCD_COLUMNS

