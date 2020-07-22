; Init routines
        .forceimport _syscall__system_init
        .forceimport _syscall__blink_init
        .forceimport _syscall__lcd_init
        .forceimport _syscall__acia_init
        .forceimport _syscall__keyboard_init
; Core routines
        .forceimport _syscall__register_user_break
        .forceimport _syscall__deregister_user_break
        .forceimport _syscall__register_user_irq
        .forceimport _syscall__deregister_user_irq
; Common routines
        .forceimport _syscall__delay_ms
        .forceimport _syscall__delay_sec
        .forceimport _syscall__convert_to_hex
        .forceimport _syscall_convert_to_hex
        .forceimport _syscall__convert_hex_to_dec
        .forceimport _syscall_convert_hex_to_dec
; Blink routines
        .forceimport _syscall__blink_led
        .forceimport _syscall__strobe_led
; VIA routines
        .forceimport _syscall_via2_get_register
        .forceimport _syscall__via2_get_register
        .forceimport _syscall_via2_set_register
        .forceimport _syscall__via2_set_register
; ACIA routines 
        .forceimport _syscall__acia_is_data_available
        .forceimport _syscall__acia_read_byte
        .forceimport _syscall__acia_write_byte
        .forceimport _syscall__acia_write_string
; Keyboard routines
        .forceimport _syscall__keyboard_is_connected
        .forceimport _syscall__keyboard_is_data_available
        .forceimport _syscall__keyboard_read_char
; LCD routines
        .forceimport _syscall__lcd_print
        .forceimport _syscall__lcd_print_char
        .forceimport _syscall__lcd_clear
        .forceimport _syscall__lcd_get_position
        .forceimport _syscall_lcd_get_position
        .forceimport _syscall__lcd_set_position
        .forceimport _syscall_lcd_set_position
        .forceimport _syscall__lcd_backspace
        .forceimport _syscall__lcd_newline
        .forceimport _syscall__lcd_display_mode
        .forceimport _syscall__lcd_scroll_up
        .forceimport _syscall__lcd_scroll_down
        .forceimport _syscall__lcd_define_char
        .forceimport _syscall_lcd_define_char
; XMODEM routines
        .forceimport _syscall__modem_send
        .forceimport _syscall__modem_receive
; string routines
        .forceimport _syscall__strcopy
        .forceimport _syscall_strcopy
        .forceimport _syscall__strcompare
        .forceimport _syscall_strcompare
        .forceimport _syscall__strlength
        .forceimport _syscall__strtoupper
        .forceimport _syscall__strtolower
        .forceimport _syscall__strtriml
        .forceimport _syscall__strtrimr
        .forceimport _syscall__strtokenize
        .forceimport _syscall_strtokenize
        .forceimport _syscall__strgettoken
; parser routines
        .forceimport _syscall__parse_onoff
        .forceimport _syscall_parse_onoff
        .forceimport _syscall__parse_hex_byte
        .forceimport _syscall_parse_hex_byte
        .forceimport _syscall__parse_hex_word
        .forceimport _syscall_parse_hex_word
        .forceimport _syscall__parse_dec_word
        .forceimport _syscall_parse_dec_word
; tty routines
        .forceimport _syscall__tty_init
        .forceimport _syscall__tty_read_line
        .forceimport _syscall_tty_read_line
        .forceimport _syscall__tty_write
        .forceimport _syscall__tty_writeln
        .forceimport _syscall__tty_write_hex
        .forceimport _syscall__tty_write_dec
        .forceimport _syscall__tty_send_newline
        .forceimport _syscall__tty_send_character
; menu routines
        .forceimport _syscall__run_menu
        .forceimport _syscall_run_menu
        .forceimport _syscall__setup_menuitem

