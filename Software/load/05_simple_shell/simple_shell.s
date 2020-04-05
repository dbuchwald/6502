        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "lcd.inc"

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

LINE_BUFFER_SIZE = 10

        .code
init:
        ; all input, all output
        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL | TTY_CONFIG_OUTPUT_LCD)
        jsr _tty_init

        ; Display hello messages
        writeln_tty msghello1
        writeln_tty msghello2
        writeln_tty msghello3

main_loop:
        ; Start with prompt
        write_tty os1prompt

        ; Read line 
        tty_read_line line_buffer, LINE_BUFFER_SIZE

        ; Trim the line
        strtriml #line_buffer
        strtrimr #line_buffer

        ; If empty - display prompt again
        strlen #line_buffer
        cmp #$00
        beq main_loop

        ; Convert to upper case for comparison
        strtoupper #line_buffer

@compare_cmd_help:
        strcmp #line_buffer, #cmd_help
        cmp #$00
        bne @compare_cmd_load
        jsr _display_help_message
        jmp main_loop

@compare_cmd_load:
        strcmp #line_buffer, #cmd_load
        cmp #$00
        bne @compare_cmd_exit
        jsr _display_load_message
        jmp main_loop

@compare_cmd_exit:
        strcmp #line_buffer, #cmd_exit
        cmp #$00
        bne @invalid_command
        jsr _display_exit_message
        rts

@invalid_command:
        writeln_tty msgerror
        writeln_tty msghello3
        jmp main_loop
        
_display_help_message:
        writeln_tty msghelp1
        writeln_tty msghelp2
        writeln_tty msghelp3
        rts

_display_load_message:
        writeln_tty msgload
        rts

_display_exit_message:
        writeln_tty msgbye
        rts

        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE

        .segment "RODATA"
msghello1: 
        .byte "Welcome to OS/1 simple shell", $00
msghello2: 
        .byte "Try entering simple commands followed by ENTER", $00
msghello3:
        .byte "Currently supported commands are: HELP, LOAD and EXIT", $00
msghelp1:
        .byte "HELP - display this message", $00
msghelp2:
        .byte "LOAD - load program", $00
msghelp3:
        .byte "EXIT - exit the shell", $00
msgload:
        .byte "Pretending to load program now...", $00
msgbye:
        .byte "Thank you for using OS/1 simple shell", $00
os1prompt:
        .byte "OS/1>", $00
msgerror:
        .byte "Command not recognized, please try again", $00
cmd_help:
        .byte "HELP", $00
cmd_load:
        .byte "LOAD", $00
cmd_exit:
        .byte "EXIT", $00
