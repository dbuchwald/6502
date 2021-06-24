        .include "syscalls.inc"

; Init routines
        .export _system_init
        .export _latch_init
        .export _blink_init
        .export _lcd_init
        .export _serial_init
        .export _keyboard_init
; Core routines
        .export _register_user_break
        .export _deregister_user_break
        .export _register_user_irq
        .export _deregister_user_irq
; Common routines
        .export _delay_init
        .export _delay_ms
        .export _delay_sec
        .export _convert_to_hex
        .export convert_to_hex
        .export _convert_hex_to_dec
        .export convert_hex_to_dec
        .export _get_cpu_mhz
; Latch routinex
        .export _latch_write
        .export latch_write
        .export _latch_set
        .export _latch_reset
        .export _latch_get
; Blink routines
        .export _blink_led
        .export _strobe_led
; VIA routines
        .export via2_get_register
        .export _via2_get_register
        .export via2_set_register
        .export _via2_set_register
; Serial routines 
        .export _serial_is_data_available
        .export _serial_read_byte
        .export _serial_write_byte
        .export serial_write_byte
        .export _serial_write_string
        .export serial_write_string
        .export _serial_flush
        .export _serial_disable
; Keyboard routines
        .export _keyboard_is_connected
        .export _keyboard_is_data_available
        .export _keyboard_read_char
; LCD routines
        .export _lcd_print
        .export _lcd_print_char
        .export _lcd_clear
        .export _lcd_get_position
        .export lcd_get_position
        .export _lcd_set_position
        .export lcd_set_position
        .export _lcd_backspace
        .export _lcd_newline
        .export _lcd_display_mode
        .export _lcd_scroll_up
        .export _lcd_scroll_down
        .export _lcd_define_char
        .export lcd_define_char
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
        .export _strgettoken
; parser routines
        .export _parse_onoff
        .export parse_onoff
        .export _parse_hex_byte
        .export parse_hex_byte
        .export _parse_hex_word
        .export parse_hex_word
        .export _parse_dec_word
        .export parse_dec_word
; tty routines
        .export _tty_init
        .export _tty_read_line
        .export tty_read_line
        .export _tty_write
        .export _tty_writeln
        .export _tty_write_hex
        .export _tty_write_dec
        .export _tty_send_newline
        .export _tty_send_character
; menu routines
        .export _run_menu
        .export run_menu
        .export _setup_menuitem

        .code

; Init routines
_system_init:
        jmp (_syscall__system_init)

_latch_init:
        jmp (_syscall__latch_init)

_blink_init:
        jmp (_syscall__blink_init)

_lcd_init:
        jmp (_syscall__lcd_init)

_serial_init:
        jmp (_syscall__serial_init)

_keyboard_init:
        jmp (_syscall__keyboard_init)

; Core routines
_register_user_break:
        jmp (_syscall__register_user_break)

_deregister_user_break:
        jmp (_syscall__deregister_user_break)

_register_user_irq:
        jmp (_syscall__register_user_irq)

_deregister_user_irq:
        jmp (_syscall__deregister_user_irq)

; Common routines
_delay_init:
        jmp (_syscall__delay_init)

_delay_ms:
        jmp (_syscall__delay_ms)

_delay_sec:
        jmp (_syscall__delay_sec)

_convert_to_hex:
        jmp (_syscall__convert_to_hex)

convert_to_hex:
        jmp (_syscall_convert_to_hex)

_convert_hex_to_dec:
        jmp (_syscall__convert_hex_to_dec)

convert_hex_to_dec:
        jmp (_syscall_convert_hex_to_dec)

_get_cpu_mhz:
        jmp (_syscall__get_cpu_mhz)

; Latch routines
        .export _latch_write
_latch_write:
        jmp (_syscall__latch_write)

latch_write:
        jmp (_syscall_latch_write)

_latch_set:
        jmp (_syscall__latch_set)

_latch_reset:
        jmp (_syscall__latch_reset)

_latch_get:
        jmp (_syscall__latch_get)

; Blink routines
_blink_led:
        jmp (_syscall__blink_led)
        
_strobe_led:
        jmp (_syscall__strobe_led)

; VIA routines
via2_get_register:
        jmp (_syscall_via2_get_register)

_via2_get_register:
        jmp (_syscall__via2_get_register)

via2_set_register:
        jmp (_syscall_via2_set_register)

_via2_set_register:
        jmp (_syscall__via2_set_register)

; Serial routines 
_serial_is_data_available:
        jmp (_syscall__serial_is_data_available)

_serial_read_byte:
        jmp (_syscall__serial_read_byte)

_serial_write_byte:
        jmp (_syscall__serial_write_byte)

serial_write_byte:
        jmp (_syscall_serial_write_byte)

_serial_write_string:
        jmp (_syscall__serial_write_string)

serial_write_string:
        jmp (_syscall_serial_write_string)

_serial_flush:
        jmp (_syscall__serial_flush)

_serial_disable:
        jmp (_syscall__serial_disable)

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

lcd_get_position:
        jmp (_syscall_lcd_get_position)

_lcd_set_position:
        jmp (_syscall__lcd_set_position)

lcd_set_position:
        jmp (_syscall_lcd_set_position)

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

lcd_define_char:
        jmp (_syscall_lcd_define_char)

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

_strgettoken:
        jmp (_syscall__strgettoken)

; parser routines
_parse_onoff:
        jmp (_syscall__parse_onoff)

parse_onoff:
        jmp (_syscall_parse_onoff)

_parse_hex_byte:
        jmp (_syscall__parse_hex_byte)

parse_hex_byte:
        jmp (_syscall_parse_hex_byte)

_parse_hex_word:
        jmp (_syscall__parse_hex_word)

parse_hex_word:
        jmp (_syscall_parse_hex_word)

_parse_dec_word:
        jmp (_syscall__parse_dec_word)

parse_dec_word:
        jmp (_syscall_parse_dec_word)

; tty routines
_tty_init:
        jmp (_syscall__tty_init)

_tty_read_line:
        jmp (_syscall__tty_read_line)

tty_read_line:
        jmp (_syscall_tty_read_line)

_tty_write:
        jmp (_syscall__tty_write)

_tty_writeln:
        jmp (_syscall__tty_writeln)

_tty_write_hex:
        jmp (_syscall__tty_write_hex)

_tty_write_dec:
        jmp (_syscall__tty_write_dec)

_tty_send_newline:
        jmp (_syscall__tty_send_newline)

_tty_send_character:
        jmp (_syscall__tty_send_character)

; menu routines
_run_menu:
        jmp (_syscall__run_menu)

run_menu:
        jmp (_syscall_run_menu)

_setup_menuitem:
        jmp (_syscall__setup_menuitem)
