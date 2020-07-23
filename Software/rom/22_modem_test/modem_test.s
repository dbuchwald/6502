      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "core.inc"
      .include "serial.inc"
      .include "modem.inc"
      .include "syscalls.inc"
      .include "sys_const.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

CHANNEL = CHANNEL0

      .code

init:
      ; Set up stack
      ldx #$ff
      txs
      ; Run setup routine
      jsr _system_init
      ; lda #$03
      ; jsr _delay_sec

wait_for_serial_input:
      lda #CHANNEL
      jsr _serial_is_data_available
      cmp #(SERIAL_NO_DATA_AVAILABLE)
      beq wait_for_serial_input
      lda #CHANNEL
      jsr _serial_read_byte

      ldx #00
prompt_loop:
      lda prompt,x
      beq main_loop
      ldy #CHANNEL
      jsr serial_write_byte
      inx
      bra prompt_loop

main_loop:
      jsr _modem_receive
      cmp #(MODEM_RECEIVE_SUCCESS)
      bne main_loop
      jsr $1000
      jmp main_loop

      .segment "RODATA"
prompt:
      .byte "OS/1 Boot", $0a, $0d, $00