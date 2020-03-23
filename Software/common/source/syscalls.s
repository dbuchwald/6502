
        .include "core.inc"
        .include "blink.inc"
        .include "lcd.inc"
        .include "acia.inc"
        .include "keyboard.inc"
        .include "modem.inc"
        .include "zeropage.inc"
        .include "utils.inc"

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

        .macro SYSCALL_VECTOR _function
        .ifndef load
        .word _function
        .else
        .word $0000
        .endif
        .endmacro

_syscall_system_init:
        SYSCALL_VECTOR _system_init
_syscall_blink_init:
        SYSCALL_VECTOR _blink_init
_syscall_lcd_init:
        SYSCALL_VECTOR _lcd_init
_syscall_acia_init:
        SYSCALL_VECTOR _acia_init
_syscall_keyboard_init:
        SYSCALL_VECTOR _keyboard_init
_syscall_delay_ms:
        SYSCALL_VECTOR _delay_ms
_syscall_delay_sec:
        SYSCALL_VECTOR _delay_sec
_syscall_convert_to_hex:
        SYSCALL_VECTOR _syscall_convert_to_hex
_syscall_blink_led:
        SYSCALL_VECTOR _blink_led
_syscall_strobe_led:
        SYSCALL_VECTOR _strobe_led
_syscall_acia_is_data_available:
        SYSCALL_VECTOR _acia_is_data_available
_syscall_acia_read_byte:
        SYSCALL_VECTOR _acia_read_byte
_syscall_acia_write_byte:
        SYSCALL_VECTOR _acia_write_byte
_syscall_keyboard_is_connected:
        SYSCALL_VECTOR _keyboard_is_connected
_syscall_keyboard_is_data_available:
        SYSCALL_VECTOR _keyboard_is_data_available
_syscall_keyboard_read_char:
        SYSCALL_VECTOR _keyboard_read_char
_syscall_lcd_print:
        SYSCALL_VECTOR _lcd_print
_syscall_lcd_print_char:
        SYSCALL_VECTOR _lcd_print_char
_syscall_lcd_clear:
        SYSCALL_VECTOR _lcd_clear
_syscall_lcd_set_position:
        SYSCALL_VECTOR _lcd_set_position
_syscall_lcd_display_mode:
        SYSCALL_VECTOR _lcd_display_mode
_syscall_lcd_scroll_up:
        SYSCALL_VECTOR _lcd_scroll_up
_syscall_lcd_scroll_down:
        SYSCALL_VECTOR _lcd_scroll_down
_syscall_modem_send:
        SYSCALL_VECTOR _modem_send
_syscall_modem_receive:
        SYSCALL_VECTOR _modem_receive