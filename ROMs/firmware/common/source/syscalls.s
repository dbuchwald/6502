
        .include "core.inc"
        .include "blink.inc"
        .include "lcd.inc"
        .include "acia.inc"
        .include "keyboard.inc"
        .include "modem.inc"
        .include "zeropage.inc"

; Init routines
        .export _syscall_system_init
        .export _syscall_blink_init
        .export _syscall_lcd_init
        .export _syscall_acia_init
        .export _syscall_keyboard_init
; Common routines
        .export _syscall_delay_ms
        .export _syscall_delay_sec
        .export _syscall_convert_to_hex
; Blink routines
        .export _syscall_blink_led
        .export _syscall_strobe_led
; ACIA routines 
        .export _syscall_acia_is_data_available
        .export _syscall_acia_read_byte
        .export _syscall_acia_write_byte
; Keyboard routines
        .export _syscall_keyboard_is_connected
        .export _syscall_keyboard_is_data_available
        .export _syscall_keyboard_read_char
; LCD routines
        .export _syscall_lcd_print
        .export _syscall_lcd_print_char
        .export _syscall_lcd_clear
        .export _syscall_lcd_set_position
        .export _syscall_lcd_display_mode
        .export _syscall_lcd_scroll_up
        .export _syscall_lcd_scroll_down
; XMODEM routines
        .export _syscall_modem_send
        .export _syscall_modem_receive

        .segment "SYSCALLS"

_syscall_system_init:
        .word _system_init
_syscall_blink_init:
        .word _blink_init
_syscall_lcd_init:
        .word _lcd_init
_syscall_acia_init:
        .word _acia_init
_syscall_keyboard_init:
        .word _keyboard_init
_syscall_delay_ms:
        .word _delay_ms
_syscall_delay_sec:
        .word _delay_sec
_syscall_convert_to_hex:
        .word _syscall_convert_to_hex
_syscall_blink_led:
        .word _blink_led
_syscall_strobe_led:
        .word _strobe_led