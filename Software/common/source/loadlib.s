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
        .export _c_strcpy
        .export _asm_strcpy
        .export _c_strcmp
        .export _asm_strcmp
        .export _strlen
        .export _strtoupper
        .export _strtolower
        .export _strtriml
        .export _strtrimr
        .export _c_strtokenize
        .export _asm_strtokenize
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

_lcd_get_position:
        jmp (_syscall_lcd_get_position)

_lcd_set_position:
        jmp (_syscall_lcd_set_position)

_lcd_backspace:
        jmp (_syscall_lcd_backspace)

_lcd_newline:
        jmp (_syscall_lcd_newline)

_lcd_display_mode:
        jmp (_syscall_lcd_display_mode)

_lcd_scroll_up:
        jmp (_syscall_lcd_scroll_up)

_lcd_scroll_down:
        jmp (_syscall_lcd_scroll_down)

_lcd_define_char:
        jmp (_syscall_lcd_define_char)

; XMODEM routines
_modem_send:
        jmp (_syscall_modem_send)

_modem_receive:
        jmp (_syscall_modem_receive)

; string routines
_c_strcpy:
        jmp (_syscall_c_strcpy)

_asm_strcpy:
        jmp (_syscall_asm_strcpy)

_c_strcmp:
        jmp (_syscall_c_strcmp)

_asm_strcmp:
        jmp (_syscall_asm_strcmp)

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

_asm_strtokenize:
        jmp (_syscall_asm_strtokenize)

_c_strtokenize:
        jmp (_syscall_c_strtokenize)

; parser routines
_parse_onoff:
        jmp (_syscall_parse_onoff)

_parse_hex_byte:
        jmp (_syscall_parse_hex_byte)

_parse_hex_word:
        jmp (_syscall_parse_hex_word)

; tty routines
_tty_init:
        jmp (_syscall_tty_init)

_tty_read_line:
        jmp (_syscall_tty_read_line)

_tty_write:
        jmp (_syscall_tty_write)

_tty_writeln:
        jmp (_syscall_tty_writeln)

_tty_write_hex:
        jmp (_syscall_tty_write_hex)

_tty_send_newline:
        jmp (_syscall_tty_send_newline)

; menu routines
_run_menu:
        jmp (_syscall_run_menu)
