      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "core.inc"
      .include "acia.inc"
      .include "keyboard.inc"
      .include "syscalls.inc"

      .import _run_shell
      .export os1_version

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

      .code

init:
      ; clean up stack and zeropage
      ldx #$00
@clean_stack_loop:
      stz $0100,x
      stz $00,x
      inx
      bne @clean_stack_loop
      ; Set up stack
      ldx #$ff
      txs
      ; Run setup routine
      jsr _system_init
      ; Display hello message
      write_lcd #os1_version
      ; Display keyboard status
      ldx #$00
      ldy #$01
      jsr lcd_set_position
      lda #1
      jsr _delay_sec
      jsr _keyboard_is_connected
      cmp #(KEYBOARD_NOT_CONNECTED)
      beq @no_keyboard
      write_lcd #keyboard_connected
      bra @wait_for_1s
@no_keyboard:
      write_lcd #keyboard_disconnected
@wait_for_1s:
      lda #01
      jsr _delay_sec
      jsr _lcd_newline

      write_lcd #instruction
@wait_for_acia_input:
      jsr _acia_is_data_available
      cmp #(ACIA_NO_DATA_AVAILABLE)
      beq @check_keyboard
      jsr _acia_read_byte
      bra @run_shell
@check_keyboard:
      jsr _keyboard_is_data_available
      cmp #(KEYBOARD_NO_DATA_AVAILABLE)
      beq @wait_for_acia_input
      jsr _keyboard_read_char
@run_shell:
      jsr _lcd_clear
      write_lcd #shell_connected
      jsr _run_shell
      ; Disable interrupt processing during init
      sei 
      jmp init

      .segment "RODATA"

os1_version:
      .asciiz "OS/1 version 0.3.0C"
keyboard_disconnected:
      .asciiz "No keyboard"
keyboard_connected:
      .asciiz "Keyboard connected"
instruction:
      .asciiz "Connect serial port (19200 N8S1 CTS/RTS) and press any key in terminal window"
shell_connected:
      .asciiz "Shell connected"
