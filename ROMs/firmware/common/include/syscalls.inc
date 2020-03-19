; Init routines
        .import _syscall_system_init
        .import _syscall_blink_init
        .import _syscall_lcd_init
        .import _syscall_acia_init
        .import _syscall_keyboard_init
; Common routines
        .import _syscall_delay_ms
        .import _syscall_delay_sec
        .import _syscall_convert_to_hex
; Blink routines
        .import _syscall_blink_led
        .import _syscall_strobe_led
; ACIA routines 
        .import _syscall_acia_is_data_available
        .import _syscall_acia_read_byte
        .import _syscall_acia_write_byte
; Keyboard routines
        .import _syscall_keyboard_is_connected
        .import _syscall_keyboard_is_data_available
        .import _syscall_keyboard_read_char
; LCD routines
        .import _syscall_lcd_print
        .import _syscall_lcd_print_char
        .import _syscall_lcd_clear
        .import _syscall_lcd_set_position
        .import _syscall_lcd_display_mode
        .import _syscall_lcd_scroll_up
        .import _syscall_lcd_scroll_down
; XMODEM routines
        .import _syscall_modem_send
        .import _syscall_modem_receive
