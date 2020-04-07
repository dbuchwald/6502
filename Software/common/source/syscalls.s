
        .include "core.inc"
        .include "blink.inc"
        .include "lcd.inc"
        .include "acia.inc"
        .include "keyboard.inc"
        .include "modem.inc"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "string.inc"
        .include "tty.inc"
        .include "parse.inc"
        .include "menu.inc"

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
        .export _syscall_acia_write_string
; Keyboard routines
        .export _syscall_keyboard_is_connected
        .export _syscall_keyboard_is_data_available
        .export _syscall_keyboard_read_char
; LCD routines
        .export _syscall_lcd_print
        .export _syscall_lcd_print_char
        .export _syscall_lcd_clear
        .export _syscall_lcd_get_position
        .export _syscall_lcd_set_position
        .export _syscall_lcd_backspace
        .export _syscall_lcd_newline
        .export _syscall_lcd_display_mode
        .export _syscall_lcd_scroll_up
        .export _syscall_lcd_scroll_down
; XMODEM routines
        .export _syscall_modem_send
        .export _syscall_modem_receive
; string routines
        .export _syscall_strcmp
        .export _syscall_strlen
        .export _syscall_strtoupper
        .export _syscall_strtolower
        .export _syscall_strtriml
        .export _syscall_strtrimr
        .export _syscall_strtokenize
; parser routines
        .export _syscall_parse_onoff
        .export _syscall_parse_hex_byte
        .export _syscall_parse_hex_word
; tty routines
        .export _syscall_tty_init
        .export _syscall_tty_read_line
        .export _syscall_tty_write
        .export _syscall_tty_writeln
        .export _syscall_tty_write_hex
        .export _syscall_tty_send_newline
; menu routines
        .export _syscall_run_menu

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
        SYSCALL_VECTOR _convert_to_hex
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
_syscall_acia_write_string:
        SYSCALL_VECTOR _acia_write_string
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
_syscall_lcd_get_position:
        SYSCALL_VECTOR _lcd_get_position
_syscall_lcd_set_position:
        SYSCALL_VECTOR _lcd_set_position
_syscall_lcd_backspace:
        SYSCALL_VECTOR _syscall_lcd_backspace
_syscall_lcd_newline:
        SYSCALL_VECTOR _syscall_lcd_newline   
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
_syscall_strcmp:
        SYSCALL_VECTOR _strcmp
_syscall_strlen:
        SYSCALL_VECTOR _strlen
_syscall_strtoupper:
        SYSCALL_VECTOR _strtoupper
_syscall_strtolower:
        SYSCALL_VECTOR _strtolower
_syscall_strtriml:
        SYSCALL_VECTOR _strtriml
_syscall_strtrimr:
        SYSCALL_VECTOR _strtrimr
_syscall_strtokenize:
        SYSCALL_VECTOR _strtokenize
_syscall_parse_onoff:
        SYSCALL_VECTOR _parse_onoff
_syscall_parse_hex_byte:
        SYSCALL_VECTOR _parse_hex_byte
_syscall_parse_hex_word:
        SYSCALL_VECTOR _parse_hex_word
_syscall_tty_init:
        SYSCALL_VECTOR _tty_init
_syscall_tty_read_line:
        SYSCALL_VECTOR _tty_read_line
_syscall_tty_write:
        SYSCALL_VECTOR _tty_write
_syscall_tty_writeln:
        SYSCALL_VECTOR _tty_writeln
_syscall_tty_write_hex:
        SYSCALL_VECTOR _tty_write_hex
_syscall_tty_send_newline:
        SYSCALL_VECTOR _tty_send_newline
_syscall_run_menu:
        SYSCALL_VECTOR _run_menu
