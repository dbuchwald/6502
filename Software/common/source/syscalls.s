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
        .include "via_utils.inc"

; Init routines
        .export _syscall__system_init
        .export _syscall__blink_init
        .export _syscall__lcd_init
        .export _syscall__acia_init
        .export _syscall__keyboard_init
; Core routines
        .export _syscall__register_user_break
        .export _syscall__deregister_user_break
        .export _syscall__register_user_irq
        .export _syscall__deregister_user_irq
; Common routines
        .export _syscall__delay_ms
        .export _syscall__delay_sec
        .export _syscall__convert_to_hex
        .export _syscall_convert_to_hex
        .export _syscall__convert_hex_to_dec
        .export _syscall_convert_hex_to_dec
; Blink routines
        .export _syscall__blink_led
        .export _syscall__strobe_led
; VIA routines
        .export _syscall_via2_get_register
        .export _syscall__via2_get_register
        .export _syscall_via2_set_register
        .export _syscall__via2_set_register
; ACIA routines 
        .export _syscall__acia_is_data_available
        .export _syscall__acia_read_byte
        .export _syscall__acia_write_byte
        .export _syscall__acia_write_string
; Keyboard routines
        .export _syscall__keyboard_is_connected
        .export _syscall__keyboard_is_data_available
        .export _syscall__keyboard_read_char
; LCD routines
        .export _syscall__lcd_print
        .export _syscall__lcd_print_char
        .export _syscall__lcd_clear
        .export _syscall__lcd_get_position
        .export _syscall_lcd_get_position
        .export _syscall__lcd_set_position
        .export _syscall_lcd_set_position
        .export _syscall__lcd_backspace
        .export _syscall__lcd_newline
        .export _syscall__lcd_display_mode
        .export _syscall__lcd_scroll_up
        .export _syscall__lcd_scroll_down
        .export _syscall__lcd_define_char
        .export _syscall_lcd_define_char
; XMODEM routines
        .export _syscall__modem_send
        .export _syscall__modem_receive
; string routines
        .export _syscall__strcopy
        .export _syscall_strcopy
        .export _syscall__strcompare
        .export _syscall_strcompare
        .export _syscall__strlength
        .export _syscall__strtoupper
        .export _syscall__strtolower
        .export _syscall__strtriml
        .export _syscall__strtrimr
        .export _syscall__strtokenize
        .export _syscall_strtokenize
        .export _syscall__strgettoken
; parser routines
        .export _syscall__parse_onoff
        .export _syscall_parse_onoff
        .export _syscall__parse_hex_byte
        .export _syscall_parse_hex_byte
        .export _syscall__parse_hex_word
        .export _syscall_parse_hex_word
        .export _syscall__parse_dec_word
        .export _syscall_parse_dec_word
; tty routines
        .export _syscall__tty_init
        .export _syscall__tty_read_line
        .export _syscall_tty_read_line
        .export _syscall__tty_write
        .export _syscall__tty_writeln
        .export _syscall__tty_write_hex
        .export _syscall__tty_write_dec
        .export _syscall__tty_send_newline
        .export _syscall__tty_send_character
; menu routines
        .export _syscall__run_menu
        .export _syscall_run_menu
        .export _syscall__setup_menuitem

        .segment "SYSCALLS"

        .macro SYSCALL_VECTOR _function
        .ifndef load
        .word _function
        .else
        .word $0000
        .endif
        .endmacro

_syscall__system_init:
        SYSCALL_VECTOR _system_init
_syscall__blink_init:
        SYSCALL_VECTOR _blink_init
_syscall__lcd_init:
        SYSCALL_VECTOR _lcd_init
_syscall__acia_init:
        SYSCALL_VECTOR _acia_init
_syscall__keyboard_init:
        SYSCALL_VECTOR _keyboard_init
_syscall__register_user_break:
        SYSCALL_VECTOR _register_user_break
_syscall__deregister_user_break:
        SYSCALL_VECTOR _deregister_user_break
_syscall__register_user_irq:
        SYSCALL_VECTOR _register_user_irq
_syscall__deregister_user_irq:
        SYSCALL_VECTOR _deregister_user_irq
_syscall__delay_ms:
        SYSCALL_VECTOR _delay_ms
_syscall__delay_sec:
        SYSCALL_VECTOR _delay_sec
_syscall__convert_to_hex:
        SYSCALL_VECTOR _convert_to_hex
_syscall_convert_to_hex:
        SYSCALL_VECTOR convert_to_hex
_syscall__convert_hex_to_dec:
        SYSCALL_VECTOR _convert_hex_to_dec
_syscall_convert_hex_to_dec:
        SYSCALL_VECTOR convert_hex_to_dec
_syscall__blink_led:
        SYSCALL_VECTOR _blink_led
_syscall__strobe_led:
        SYSCALL_VECTOR _strobe_led
_syscall_via2_get_register:
        SYSCALL_VECTOR via2_get_register
_syscall__via2_get_register:
        SYSCALL_VECTOR _via2_get_register
_syscall_via2_set_register:
        SYSCALL_VECTOR via2_set_register
_syscall__via2_set_register:
        SYSCALL_VECTOR _via2_set_register
_syscall__acia_is_data_available:
        SYSCALL_VECTOR _acia_is_data_available
_syscall__acia_read_byte:
        SYSCALL_VECTOR _acia_read_byte
_syscall__acia_write_byte:
        SYSCALL_VECTOR _acia_write_byte
_syscall__acia_write_string:
        SYSCALL_VECTOR _acia_write_string
_syscall__keyboard_is_connected:
        SYSCALL_VECTOR _keyboard_is_connected
_syscall__keyboard_is_data_available:
        SYSCALL_VECTOR _keyboard_is_data_available
_syscall__keyboard_read_char:
        SYSCALL_VECTOR _keyboard_read_char
_syscall__lcd_print:
        SYSCALL_VECTOR _lcd_print
_syscall__lcd_print_char:
        SYSCALL_VECTOR _lcd_print_char
_syscall__lcd_clear:
        SYSCALL_VECTOR _lcd_clear
_syscall__lcd_get_position:
        SYSCALL_VECTOR _lcd_get_position
_syscall_lcd_get_position:
        SYSCALL_VECTOR lcd_get_position
_syscall__lcd_set_position:
        SYSCALL_VECTOR _lcd_set_position
_syscall_lcd_set_position:
        SYSCALL_VECTOR lcd_set_position
_syscall__lcd_backspace:
        SYSCALL_VECTOR _lcd_backspace
_syscall__lcd_newline:
        SYSCALL_VECTOR _lcd_newline
_syscall__lcd_display_mode:
        SYSCALL_VECTOR _lcd_display_mode
_syscall__lcd_scroll_up:
        SYSCALL_VECTOR _lcd_scroll_up
_syscall__lcd_scroll_down:
        SYSCALL_VECTOR _lcd_scroll_down
_syscall__lcd_define_char:
        SYSCALL_VECTOR _lcd_define_char
_syscall_lcd_define_char:
        SYSCALL_VECTOR lcd_define_char
_syscall__modem_send:
        SYSCALL_VECTOR _modem_send
_syscall__modem_receive:
        SYSCALL_VECTOR _modem_receive
_syscall__strcopy:
        SYSCALL_VECTOR _strcopy
_syscall_strcopy:
        SYSCALL_VECTOR strcopy
_syscall__strcompare:
        SYSCALL_VECTOR _strcompare
_syscall_strcompare:
        SYSCALL_VECTOR strcompare
_syscall__strlength:
        SYSCALL_VECTOR _strlength
_syscall__strtoupper:
        SYSCALL_VECTOR _strtoupper
_syscall__strtolower:
        SYSCALL_VECTOR _strtolower
_syscall__strtriml:
        SYSCALL_VECTOR _strtriml
_syscall__strtrimr:
        SYSCALL_VECTOR _strtrimr
_syscall__strtokenize:
        SYSCALL_VECTOR _strtokenize
_syscall_strtokenize:
        SYSCALL_VECTOR strtokenize
_syscall__strgettoken:
        SYSCALL_VECTOR _strgettoken
_syscall__parse_onoff:
        SYSCALL_VECTOR _parse_onoff
_syscall_parse_onoff:
        SYSCALL_VECTOR parse_onoff
_syscall__parse_hex_byte:
        SYSCALL_VECTOR _parse_hex_byte
_syscall_parse_hex_byte:
        SYSCALL_VECTOR parse_hex_byte
_syscall__parse_hex_word:
        SYSCALL_VECTOR _parse_hex_word
_syscall_parse_hex_word:
        SYSCALL_VECTOR parse_hex_word
_syscall__parse_dec_word:
        SYSCALL_VECTOR _parse_dec_word
_syscall_parse_dec_word:
        SYSCALL_VECTOR parse_dec_word
_syscall__tty_init:
        SYSCALL_VECTOR _tty_init
_syscall__tty_read_line:
        SYSCALL_VECTOR _tty_read_line
_syscall_tty_read_line:
        SYSCALL_VECTOR tty_read_line
_syscall__tty_write:
        SYSCALL_VECTOR _tty_write
_syscall__tty_writeln:
        SYSCALL_VECTOR _tty_writeln
_syscall__tty_write_hex:
        SYSCALL_VECTOR _tty_write_hex
_syscall__tty_write_dec:
        SYSCALL_VECTOR _tty_write_dec
_syscall__tty_send_newline:
        SYSCALL_VECTOR _tty_send_newline
_syscall__tty_send_character:
        SYSCALL_VECTOR _tty_send_character
_syscall__run_menu:
        SYSCALL_VECTOR _run_menu
_syscall_run_menu:
        SYSCALL_VECTOR run_menu
_syscall__setup_menuitem:
        SYSCALL_VECTOR _setup_menuitem
