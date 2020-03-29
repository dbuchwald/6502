        .include "string.inc"
        .include "acia.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "lcd.inc"

LINE_BUFFER_SIZE = 64

ENTER = $0d
BACKSPACE = $7f
ESC = $1b

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

        .macro acia_read_line buffer
        pha
        lda #<buffer
        sta ptr1
        lda #>buffer
        sta ptr1+1
        pla
        jsr _acia_read_line
        .endmacro

        .code
init:
        ; Display hello messages
        write_acia msghello1
        write_acia msghello2
        write_acia msghello3

main_loop:
        ; Start with prompt
        write_acia os1prompt

        ; Read line 
        acia_read_line line_buffer

        ; Trim the line
        strtriml line_buffer
        strtrimr line_buffer

        ; If empty - display prompt again
        strlen line_buffer
        cmp #$00
        beq main_loop

        ; Convert to upper case for comparison
        strtoupper line_buffer

@compare_cmd_help:
        strcmp line_buffer, cmd_help
        cmp #$00
        bne @compare_cmd_load
        jsr _display_help_message
        jmp main_loop

@compare_cmd_load:
        strcmp line_buffer, cmd_load
        cmp #$00
        bne @compare_cmd_exit
        jsr _display_load_message
        jmp main_loop

@compare_cmd_exit:
        strcmp line_buffer, cmd_exit
        cmp #$00
        bne @invalid_command
        jsr _display_exit_message
        rts

@invalid_command:
        write_acia msgerror
        write_acia msghello3
        jmp main_loop
        
_display_help_message:
        write_acia msghelp1
        write_acia msghelp2
        write_acia msghelp3
        rts

_display_load_message:
        write_acia msgload
        rts

_display_exit_message:
        write_acia msgbye
        rts

_acia_read_line:
        phy
        pha
        ldy #$00
        lda #$00
@clean_buffer_loop:
        sta (ptr1),y
        iny
        cpy #(LINE_BUFFER_SIZE)
        bne @clean_buffer_loop
        ldy #$00
@read_char_loop:
        ; Read one characted from serial (blocks until read)
        jsr _acia_read_byte
        cmp #(ENTER)
        bne @not_enter
        ; line buffer contains the command now, send newline chars
        lda #(CR)
        jsr _acia_write_byte
        lda #(LF)
        jsr _acia_write_byte
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
        write_acia tty_backspace
        bra @read_char_loop
@not_backspace:
        ; check if special character (0-31)
        cmp #$20
        bmi @read_char_loop
        ; check for extra chars (127-255) 
        cmp #$7e 
        bpl @read_char_loop
        ; check for buffer full
        cpy #(LINE_BUFFER_SIZE-1)
        ; if full, go back - accept enter or backspace
        beq @read_char_loop
        ; store character in buffer
        sta (ptr1),y
        ; send back for echo
        jsr _acia_write_byte
        ; increase pointer
        iny
        bra @read_char_loop


        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE

        .segment "RODATA"
msghello1: 
        .byte "Welcome to OS/1 simple shell", CR, LF, $00
msghello2: 
        .byte "Try entering simple commands followed by ENTER", CR, LF, $00
msghello3:
        .byte "Currently supported commands are: HELP, LOAD and EXIT", CR, LF, $00
msghelp1:
        .byte "HELP - display this message", CR, LF, $00
msghelp2:
        .byte "LOAD - load program", CR, LF, $00
msghelp3:
        .byte "EXIT - exit the shell", CR, LF, $00
msgload:
        .byte "Pretending to load program now...", CR, LF, $00
msgbye:
        .byte "Thank you for using OS/1 simple shell", CR, LF, $00
os1prompt:
        .byte "OS/1>", $00
msgerror:
        .byte "Command not recognized, please try again", CR, LF, $00
cmd_help:
        .byte "HELP", $00
cmd_load:
        .byte "LOAD", $00
cmd_exit:
        .byte "EXIT", $00

tty_backspace:
        .byte ESC,"[D ",ESC,"[D",$00
