      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "core.inc"
      .include "acia.inc"
      .include "modem.inc"
      .include "syscalls.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

      .code

init:
      ; Set up stack
      ldx #$ff
      txs
      ; Run setup routine
      jsr _system_init
      ; lda #$03
      ; jsr _delay_sec

wait_for_acia_input:
      jsr _acia_is_data_available
      cmp #(ACIA_NO_DATA_AVAILABLE)
      beq wait_for_acia_input
      jsr _acia_read_byte

      ldx #00
prompt_loop:
      lda prompt,x
      beq main_loop
      jsr _acia_write_byte
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