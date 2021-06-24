      .include "sys_const.inc"
      .include "zeropage.inc"

      .zeropage

sp:                    .res 2
sreg:                  .res 2
regsave:               .res 4
latch_register:        .res 1
ptr1:                  .res 2
ptr2:                  .res 2
ptr3:                  .res 2
ptr4:                  .res 2
tmp1:                  .res 1
tmp2:                  .res 1
tmp3:                  .res 1
tmp4:                  .res 1
lcd_temp_char1:        .res 1
lcd_temp_char2:        .res 1
lcd_temp_char3:        .res 1
serial_rx_rptr:        .res SERIAL_CHANNELS_COUNT
serial_rx_wptr:        .res SERIAL_CHANNELS_COUNT
serial_tx_rptr:        .res SERIAL_CHANNELS_COUNT
serial_tx_wptr:        .res SERIAL_CHANNELS_COUNT
serial_rx_buffer_ptr:  .res SERIAL_CHANNELS_COUNT*2
serial_tx_buffer_ptr:  .res SERIAL_CHANNELS_COUNT*2
serial_buffer_tmp_ptr: .res 2
keyboard_conn:         .res 1
keyboard_rptr:         .res 1
keyboard_wptr:         .res 1
tty_config:            .res 1
system_break_flag:     .res 1
system_break_address:  .res 2
system_break_sp:       .res 1
user_break_address:    .res 2
user_break_sp:         .res 1
user_irq_address:      .res 2
