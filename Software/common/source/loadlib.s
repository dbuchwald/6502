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
        .export _lcd_get_position
        .export _lcd_set_position
        .export _lcd_backspace
        .export _lcd_newline
        .export _lcd_display_mode
        .export _lcd_scroll_up
        .export _lcd_scroll_down
        .export _lcd_define_char
; XMODEM routines
        .export _modem_send
        .export _modem_receive
; string routines
        .export _strcopy
        .export strcopy
        .export _strcompare
        .export strcompare
        .export _strlength
        .export _strtoupper
        .export _strtolower
        .export _strtriml
        .export _strtrimr
        .export _strtokenize
        .export strtokenize
; parser routines
        .export _parse_onoff
        .export _parse_hex_byte
        .export _parse_hex_word
; tty routines
        .export _tty_init
        .export _tty_read_line
        .export _tty_write
        .export _tty_writeln
        .export _tty_write_hex
        .export _tty_send_newline
; menu routines
        .export _run_menu

        .code

; Init routines
_system_init:
        jmp (_syscall__system_init)

_blink_init:
        jmp (_syscall__blink_init)

_lcd_init:
        jmp (_syscall__lcd_init)

_acia_init:
        jmp (_syscall__acia_init)

_keyboard_init:
        jmp (_syscall__keyboard_init)

; Common routines
_delay_ms:
        jmp (_syscall__delay_ms)

_delay_sec:
        jmp (_syscall__delay_sec)

_convert_to_hex:
        jmp (_syscall__convert_to_hex)

; Blink routines
_blink_led:
        jmp (_syscall__blink_led)
        
_strobe_led:
        jmp (_syscall__strobe_led)

; ACIA routines 
_acia_is_data_available:
        jmp (_syscall__acia_is_data_available)

_acia_read_byte:
        jmp (_syscall__acia_read_byte)

_acia_write_byte:
        jmp (_syscall__acia_write_byte)

_acia_write_string:
        jmp (_syscall__acia_write_string)

; Keyboard routines
_keyboard_is_connected:
        jmp (_syscall__keyboard_is_connected)

_keyboard_is_data_available:
        jmp (_syscall__keyboard_is_data_available)

_keyboard_read_char:
        jmp (_syscall__keyboard_read_char)

; LCD routines
_lcd_print:
        jmp (_syscall__lcd_print)

_lcd_print_char:
        jmp (_syscall__lcd_print_char)

_lcd_clear:
        jmp (_syscall__lcd_clear)

_lcd_get_position:
        jmp (_syscall__lcd_get_position)

_lcd_set_position:
        jmp (_syscall__lcd_set_position)

_lcd_backspace:
        jmp (_syscall__lcd_backspace)

_lcd_newline:
        jmp (_syscall__lcd_newline)

_lcd_display_mode:
        jmp (_syscall__lcd_display_mode)

_lcd_scroll_up:
        jmp (_syscall__lcd_scroll_up)

_lcd_scroll_down:
        jmp (_syscall__lcd_scroll_down)

_lcd_define_char:
        jmp (_syscall__lcd_define_char)

; XMODEM routines
_modem_send:
        jmp (_syscall__modem_send)

_modem_receive:
        jmp (_syscall__modem_receive)

; string routines
_strcopy:
        jmp (_syscall__strcopy)

strcopy:
        jmp (_syscall_strcopy)

_strcompare:
        jmp (_syscall__strcompare)

strcompare:
        jmp (_syscall_strcompare)

_strlength:
        jmp (_syscall__strlength)

_strtoupper:
        jmp (_syscall__strtoupper)

_strtolower:
        jmp (_syscall__strtolower)

_strtriml:
        jmp (_syscall__strtriml)

_strtrimr:
        jmp (_syscall__strtrimr)

strtokenize:
        jmp (_syscall_strtokenize)

_strtokenize:
        jmp (_syscall__strtokenize)

; parser routines
_parse_onoff:
        jmp (_syscall__parse_onoff)

_parse_hex_byte:
        jmp (_syscall__parse_hex_byte)

_parse_hex_word:
        jmp (_syscall__parse_hex_word)

; tty routines
_tty_init:
        jmp (_syscall__tty_init)

_tty_read_line:
        jmp (_syscall__tty_read_line)

_tty_write:
        jmp (_syscall__tty_write)

_tty_writeln:
        jmp (_syscall__tty_writeln)

_tty_write_hex:
        jmp (_syscall__tty_write_hex)

_tty_send_newline:
        jmp (_syscall__tty_send_newline)

; menu routines
_run_menu:
        jmp (_syscall__run_menu)
