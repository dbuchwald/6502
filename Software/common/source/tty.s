        .include "zeropage.inc"
        .include "string.inc"
        .include "acia.inc"
        .include "lcd.inc"
        .include "keyboard.inc"
        .include "utils.inc"

        .export _tty_init
        .export _tty_read_line
        .export _tty_write
        .export _tty_writeln
        .export _tty_write_hex

TTY_CONFIG_INPUT_SERIAL   = %00000001
TTY_CONFIG_INPUT_KEYBOARD = %00000010
TTY_CONFIG_OUTPUT_SERIAL  = %00000100
TTY_CONFIG_OUTPUT_LCD     = %00001000

ENTER                   = $0d
BACKSPACE               = $7f
ESC                     = $1b

        .code

; Assumes configuration in A register
_tty_init:
        sta tty_config
        rts

; Blocks until full line read (Enter pressed)
_tty_read_line:
        phy
        pha
        ldy #$00
        lda #$00
@clean_buffer_loop:
        sta (ptr1),y
        iny
        cpy tmp1
        bne @clean_buffer_loop
        ldy #$00
        ; decrease tmp1, since we want always the last char to be null
        dec tmp1
@read_char_loop:
        ; Read one characted from serial (blocks until read)
        jsr _tty_read_byte
        cmp #(ENTER)
        bne @not_enter
        ; line buffer contains the command now, send newline chars
        jsr _tty_send_newline
        ; return now
        pla
        ply
        rts
@not_enter:
        cmp #(BACKSPACE)
        bne @not_backspace
        ; check if we are at the beginning of the buffer - if so, ignore
        cpy #$00
        beq @read_char_loop
        ; decrease pointer
        dey
        ; clean buffer entry
        lda #$00
        sta (ptr1),y
        ; send backspace character
        jsr _tty_send_backspace
        bra @read_char_loop
@not_backspace:
        ; check if special character (0-31)
        cmp #$20
        bmi @read_char_loop
        ; check for extra chars (127-255) 
        cmp #$7e 
        bpl @read_char_loop
        ; check for buffer full 
        cpy tmp1
        ; if full, go back - accept enter or backspace
        beq @read_char_loop
        ; store character in buffer
        sta (ptr1),y
        ; send back for echo
        jsr _tty_write_byte
        ; increase pointer
        iny
        bra @read_char_loop

; Write null terminated string to output
_tty_write:
        pha
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_SERIAL)
        ; Serial output disabled
        beq @skip_serial
        ; Send series of characters for backspace
        jsr _acia_write_string
@skip_serial:
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_LCD)
        ; lcd output disabled
        beq @skip_lcd
        ; Send string to lcd
        jsr _lcd_print
@skip_lcd:
        pla
        rts

; Write null terminated string to output followed by newline char
_tty_writeln:
        jsr _tty_write
        jsr _tty_send_newline
        rts

; Reads data from enabled input channers
_tty_read_byte:
        lda tty_config
        and #(TTY_CONFIG_INPUT_SERIAL)
        ; Serial input disabled
        beq @skip_serial
        jsr _acia_is_data_available
        ; skip, no data available at this point
        bcc @skip_serial
        ; read and send back
        jsr _acia_read_byte
        rts
@skip_serial:
        lda tty_config
        and #(TTY_CONFIG_INPUT_KEYBOARD)
        ; keyboard input disabled
        beq @skip_keyboard
        jsr _keyboard_is_data_available
        ; no data available, skip
        bcc @skip_keyboard
        ; read and send back
        jsr _keyboard_read_char
        rts
@skip_keyboard:
        ; nothing found yet, keep polling
        bra _tty_read_byte

; Assumes input in A, sends to proper channels
_tty_write_byte:
        ; preserve index
        phx
        ; transfer A to X for temp storage
        tax
        ; check if serial output flag is set
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_SERIAL)
        beq @skip_serial
        ; get char code back from storage
        txa
        jsr _acia_write_byte
@skip_serial:
        ; do the same for LCD
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_LCD)
        beq @skip_lcd
        ; get char code back from storage
        txa 
        jsr _lcd_print_char
@skip_lcd:
        ; either way, restore character
        txa
        plx
        rts

_tty_write_hex:
        pha
        phx
        phy
        jsr _convert_to_hex
        txa
        jsr _tty_write_byte
        tya
        jsr _tty_write_byte
        ply
        plx
        pla
        rts

; Sends newline instruction to selected channels
_tty_send_newline:
        pha
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_SERIAL)
        ; Serial output disabled
        beq @skip_serial
        ; Send series of characters for backspace
        push_ptr ptr1
        write_acia #acia_newline
        pull_ptr ptr1
@skip_serial:
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_LCD)
        ; lcd output disabled
        beq @skip_lcd
        lda #('>')
        jsr _lcd_print_char
@skip_lcd:
        pla
        rts

; Sends backspace instruction to selected channels
_tty_send_backspace:
        pha
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_SERIAL)
        ; Serial output disabled
        beq @skip_serial
        ; Send series of characters for backspace
        push_ptr ptr1
        write_acia #acia_backspace
        pull_ptr ptr1
@skip_serial:
        lda tty_config
        and #(TTY_CONFIG_OUTPUT_LCD)
        ; lcd output disabled
        beq @skip_lcd
        lda #('<')
        jsr _lcd_print_char
@skip_lcd:
        pla
        rts

        .segment "RODATA"
acia_newline:
        .byte CR, LF, $00
acia_backspace:
        .byte ESC,"[D ",ESC,"[D",$00
