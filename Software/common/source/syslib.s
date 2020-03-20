        .include "syscalls.inc"

; Init routines
        .export _call_system_init
        .export _call_blink_init
        .export _call_lcd_init
        .export _call_acia_init
        .export _call_keyboard_init
; Common routines
        .export _call_delay_ms
        .export _call_delay_sec
        .export _call_convert_to_hex
; Blink routines
        .export _call_blink_led
        .export _call_strobe_led
; ACIA routines 
        .export _call_acia_is_data_available
        .export _call_acia_read_byte
        .export _call_acia_write_byte
; Keyboard routines
        .export _call_keyboard_is_connected
        .export _call_keyboard_is_data_available
        .export _call_keyboard_read_char
; LCD routines
        .export _call_lcd_print
        .export _call_lcd_print_char
        .export _call_lcd_clear
        .export _call_lcd_set_position
        .export _call_lcd_display_mode
        .export _call_lcd_scroll_up
        .export _call_lcd_scroll_down
; XMODEM routines
        .export _call_modem_send
        .export _call_modem_receive

        .code

; Init routines
_call_system_init:
        jmp (_syscall_system_init)

_call_blink_init:
        jmp (_syscall_blink_init)

_call_lcd_init:
        jmp (_syscall_lcd_init)

_call_acia_init:
        jmp (_syscall_acia_init)

_call_keyboard_init:
        jmp (_syscall_keyboard_init)

; Common routines
_call_delay_ms:
        jmp (_syscall_delay_ms)

_call_delay_sec:
        jmp (_syscall_delay_sec)

_call_convert_to_hex:
        jmp (_syscall_convert_to_hex)

; Blink routines
_call_blink_led:
        jmp (_syscall_blink_led)
        
_call_strobe_led:
        jmp (_syscall_strobe_led)

; ACIA routines 
_call_acia_is_data_available:
        jmp (_syscall_acia_is_data_available)

_call_acia_read_byte:
        jmp (_syscall_acia_read_byte)

_call_acia_write_byte:
        jmp (_syscall_acia_write_byte)

; Keyboard routines
_call_keyboard_is_connected:
        jmp (_syscall_keyboard_is_connected)

_call_keyboard_is_data_available:
        jmp (_syscall_keyboard_is_data_available)

_call_keyboard_read_char:
        jmp (_syscall_keyboard_read_char)

; LCD routines
_call_lcd_print:
        jmp (_syscall_lcd_print)

_call_lcd_print_char:
        jmp (_syscall_lcd_print_char)

_call_lcd_clear:
        jmp (_syscall_lcd_clear)

_call_lcd_set_position:
        jmp (_syscall_lcd_set_position)

_call_lcd_display_mode:
        jmp (_syscall_lcd_display_mode)

_call_lcd_scroll_up:
        jmp (_syscall_lcd_scroll_up)

_call_lcd_scroll_down:
        jmp (_syscall_lcd_scroll_down)

; XMODEM routines
_call_modem_send:
        jmp (_syscall_modem_send)

_call_modem_receive:
        jmp (_syscall_modem_receive)
