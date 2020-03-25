      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .include "via.inc"
      .include "blink.inc"
      .include "core.inc"
      .include "acia.inc"
      .include "keyboard.inc"
      .include "modem.inc"

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
@main_loop:
      ; Display hello message
      write_lcd welcome_message
      ; Display keyboard status
      ldx #$00
      ldy #$01
      jsr _lcd_set_position
      lda #1
      jsr _delay_sec
      jsr _keyboard_is_connected
      bcc @no_keyboard
      write_lcd keyboard_connected
      bra @wait_for_3s
@no_keyboard:
      write_lcd keyboard_disconnected
@wait_for_3s:
      lda #02
      jsr _delay_sec

      jsr _lcd_clear
      write_lcd instruction
      jsr _keyboard_is_connected
      bcc @wait_for_acia
      write_lcd instruction_keyboard
@wait_for_keyboard_input:
      jsr _keyboard_read_char
      cmp #(KEY_ENTER)
      bne @wait_for_keyboard_input
      bra @receive_file
@wait_for_acia:
      write_lcd instruction_serial
@wait_for_acia_input:
      jsr _acia_is_data_available
      bcc @wait_for_acia_input
      jsr _acia_read_byte

@receive_file:
      jsr _modem_receive
      bcc @receive_file
      jsr $1000
      jsr _lcd_clear
      jmp @main_loop

      .segment "RODATA"

welcome_message:
      .byte "OS/1 Bootloader", $00
keyboard_disconnected:
      .byte "No keyboard", $00
keyboard_connected:
      .byte "Keyboard connected", $00
instruction:
      .byte "Connect serial port (19200 N8S1 CTS/RTS) and press enter",$00
instruction_keyboard:
      .byte " on the keyboard",$00
instruction_serial:
      .byte " in terminal window", $00
