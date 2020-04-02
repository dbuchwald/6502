; Init routines
        .forceimport _syscall_system_init
        .forceimport _syscall_blink_init
        .forceimport _syscall_lcd_init
        .forceimport _syscall_acia_init
        .forceimport _syscall_keyboard_init
; Common routines
        .forceimport _syscall_delay_ms
        .forceimport _syscall_delay_sec
        .forceimport _syscall_convert_to_hex
; Blink routines
        .forceimport _syscall_blink_led
        .forceimport _syscall_strobe_led
; ACIA routines 
        .forceimport _syscall_acia_is_data_available
        .forceimport _syscall_acia_read_byte
        .forceimport _syscall_acia_write_byte
        .forceimport _syscall_acia_write_string
; Keyboard routines
        .forceimport _syscall_keyboard_is_connected
        .forceimport _syscall_keyboard_is_data_available
        .forceimport _syscall_keyboard_read_char
; LCD routines
        .forceimport _syscall_lcd_print
        .forceimport _syscall_lcd_print_char
        .forceimport _syscall_lcd_clear
        .forceimport _syscall_lcd_set_position
        .forceimport _syscall_lcd_display_mode
        .forceimport _syscall_lcd_scroll_up
        .forceimport _syscall_lcd_scroll_down
; XMODEM routines
        .forceimport _syscall_modem_send
        .forceimport _syscall_modem_receive
; string routines
        .forceimport _syscall_strcmp
        .forceimport _syscall_strlen
        .forceimport _syscall_strtoupper
        .forceimport _syscall_strtolower
        .forceimport _syscall_strtriml
        .forceimport _syscall_strtrimr
        .forceimport _syscall_strtokenize
; tty routines
        .forceimport _syscall_tty_init
        .forceimport _syscall_tty_read_line
        .forceimport _syscall_tty_write
        .forceimport _syscall_tty_writeln

