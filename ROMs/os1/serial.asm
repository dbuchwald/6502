; ---------------------------------------------------------------------------------
; Source file containing serial control routines
; Author: Dawid Buchwald
; Date: 22/01/2020
; ---------------------------------------------------------------------------------
  include "arch/WDC65C51.asm"

serial_port_init:
  lda #(WDC65C51_CMD_ODD_PARITY | WDC65C51_CMD_PARITY_DISABLE | WDC65C51_CMD_ECHO_DISABLE | WDC65C51_CMD_RTS_NOIRQ | WDC65C51_CMD_RECV_NOIRQ | WDC65C51_CMD_DTR_ENABLE)

  sta WDC65C51_ACIA_COMMAND

  lda #(WDC65C51_CTRL_1STOP | WDC65C51_CTRL_8BITWORD | WDC65C51_CTRL_CLK_BAUDR | WDC65C51_CTRL_BAUD_19200)

  sta WDC65C51_ACIA_CONTROL
  rts

serial_port_write_data:
  sta WDC65C51_ACIA_DATA
  lda #$01
  jsr os1_function_delay
  rts

serial_port_read_data:
  lda WDC65C51_ACIA_STATUS
  and #WDC65C51_STATUS_RDR_FULL
  beq serial_port_read_data
  lda WDC65C51_ACIA_DATA
  rts
