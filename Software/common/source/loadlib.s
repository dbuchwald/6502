        .include "syscalls.inc"

; Init routines
        .export _system_init
        .export _blink_init
        .export _lcd_init
        .export _acia_init
        .export _keyboard_init
; Common routines
        .export _delay_ms
        .export _delay_sec
        .export _convert_to_hex
; Blink routines
        .export _blink_led
        .export _strobe_led
; ACIA routines 
        .export _acia_is_data_available
        .export _acia_read_byte
        .export _acia_write_byte
        .export _acia_write_string
; Keyboard routines
        .export _keyboard_is_connected
        .export _keyboard_is_data_available
        .export _keyboard_read_char
; LCD routines
        .export _lcd_print
        .export _lcd_print_char
        .export _lcd_clear
        .export _lcd_set_position
        .export _lcd_display_mode
        .export _lcd_scroll_up
        .export _lcd_scroll_down
; XMODEM routines
        .export _modem_send
        .export _modem_receive
; string routines
        .export _strcmp
        .export _strlen
        .export _strtoupper
        .export _strtolower
        .export _strtriml
        .export _strtrimr

        .code

; Init routines
_system_init:
        jmp (_syscall_system_init)

_blink_init:
        jmp (_syscall_blink_init)

_lcd_init:
        jmp (_syscall_lcd_init)

_acia_init:
        jmp (_syscall_acia_init)

_keyboard_init:
        jmp (_syscall_keyboard_init)

; Common routines
_delay_ms:
        jmp (_syscall_delay_ms)

_delay_sec:
        jmp (_syscall_delay_sec)

_convert_to_hex:
        jmp (_syscall_convert_to_hex)

; Blink routines
_blink_led:
        jmp (_syscall_blink_led)
        
_strobe_led:
        jmp (_syscall_strobe_led)

; ACIA routines 
_acia_is_data_available:
        jmp (_syscall_acia_is_data_available)

_acia_read_byte:
        jmp (_syscall_acia_read_byte)

_acia_write_byte:
        jmp (_syscall_acia_write_byte)

_acia_write_string:
        jmp (_syscall_acia_write_string)

; Keyboard routines
_keyboard_is_connected:
        jmp (_syscall_keyboard_is_connected)

_keyboard_is_data_available:
        jmp (_syscall_keyboard_is_data_available)

_keyboard_read_char:
        jmp (_syscall_keyboard_read_char)

; LCD routines
_lcd_print:
        jmp (_syscall_lcd_print)

_lcd_print_char:
        jmp (_syscall_lcd_print_char)

_lcd_clear:
        jmp (_syscall_lcd_clear)

_lcd_set_position:
        jmp (_syscall_lcd_set_position)

_lcd_display_mode:
        jmp (_syscall_lcd_display_mode)

_lcd_scroll_up:
        jmp (_syscall_lcd_scroll_up)

_lcd_scroll_down:
        jmp (_syscall_lcd_scroll_down)

; XMODEM routines
_modem_send:
        jmp (_syscall_modem_send)

_modem_receive:
        jmp (_syscall_modem_receive)

; string routines
_strcmp:
        jmp (_syscall_strcmp)

_strlen:
        jmp (_syscall_strlen)

_strtoupper:
        jmp (_syscall_strtoupper)

_strtolower:
        jmp (_syscall_strtolower)

_strtriml:
        jmp (_syscall_strtriml)

_strtrimr:
        jmp (_syscall_strtrimr)