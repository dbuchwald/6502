        .include "sys_const.inc"

        .export serial_rx_buffer
        .export serial_tx_buffer
        .export keyboard_buffer
        .export lcd_line_buffer

        .segment "SYSRAM"
        .align 256

serial_rx_buffer:
        .res ACIA_RX_BUFFER_SIZE
serial_tx_buffer:
        .res ACIA_TX_BUFFER_SIZE
keyboard_buffer:
        .res KEYBOARD_BUFFER_SIZE
lcd_line_buffer:
        .res LCD_COLUMNS

