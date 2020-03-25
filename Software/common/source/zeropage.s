      .include "zeropage.inc"

      .zeropage

sp:            .res 2
sreg:          .res 2
regsave:       .res 4
ptr1:          .res 2
ptr2:          .res 2
ptr3:          .res 2
ptr4:          .res 2
tmp1:          .res 1
tmp2:          .res 1
tmp3:          .res 1
tmp4:          .res 1
lcd_out_ptr:   .res 2
acia_rx_rptr:  .res 1
acia_rx_wptr:  .res 1
acia_tx_rptr:  .res 1
acia_tx_wptr:  .res 1
acia_str_ptr:  .res 2
keyboard_conn: .res 1
keyboard_rptr: .res 1
keyboard_wptr: .res 1

