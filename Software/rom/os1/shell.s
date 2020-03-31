        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "lcd.inc"
        .include "modem.inc"

        .export run_shell

        .macro hex_to_buffer
        jsr _convert_to_hex
        txa
        ldx tmp1
        sta dump_line,x
        inx
        tya
        sta dump_line,x
        inx
        stx tmp1
        .endmacro

LINE_BUFFER_SIZE = 64

        .code
run_shell:
        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL)
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
        bne @compare_cmd_dump
        jsr _perform_load
        jmp main_loop

@compare_cmd_dump:
        strcmp line_buffer, cmd_dump
        cmp #$00
        bne @compare_cmd_run
        jsr _perform_dump
        jmp main_loop

@compare_cmd_run:
        strcmp line_buffer, cmd_run
        cmp #$00
        bne @compare_cmd_exit
        jsr _run_program
        jmp main_loop

@compare_cmd_exit:
        strcmp line_buffer, cmd_exit
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
        writeln_tty msghelp4
        rts

_perform_load:
        writeln_tty msgload
@receive_file:
        jsr _modem_receive
        bcc @receive_file
        rts

_perform_dump:
        writeln_tty msgdump

        ldx #$00
@template_loop:
        lda dump_template,x
        sta dump_line,x
        inx
        cmp #$00
        bne @template_loop

        lda #$00
        sta ptr3

        lda #$10
        sta ptr3+1
@line_loop:
        lda #04
        sta tmp1
        lda ptr3+1
        hex_to_buffer
        lda ptr3
        hex_to_buffer
        inc tmp1
        inc tmp1
@byte_loop:
        ldy #$00
        lda (ptr3),y
        hex_to_buffer
        inc tmp1
        inc ptr3
        bne @next_item
        inc ptr3+1
        lda ptr3+1
        cmp #$20
        beq @exit
@next_item:
        lda ptr3
        and #%00000111
        bne @byte_loop
        inc tmp1
        lda ptr3
        and #%00001111
        bne @byte_loop
        writeln_tty dump_line
        bra @line_loop
@exit:
        rts


_run_program:
        writeln_tty msgrun
        jsr $1000
        rts

_display_exit_message:
        writeln_tty msgbye
        rts

        .segment "BSS"
dump_line:
        .res 64

line_buffer:
        .res LINE_BUFFER_SIZE

        .segment "RODATA"
msghello1: 
        .byte "Welcome to OS/1 shell", $00
msghello2: 
        .byte "Enter command and follow by ENTER key", $00
msghello3:
        .byte "Currently supported commands are: HELP, LOAD, DUMP, RUN and EXIT", $00
msghelp1:
        .byte "HELP - display this message", $00
msghelp2:
        .byte "LOAD - load program", $00
msghelp3:
        .byte "RUN - run loaded program", $00
msghelp4:
        .byte "DUMP - show memory contents", $00
msghelp5:
        .byte "EXIT - exit the shell", $00
msgload:
        .byte "Initiating load operation...", $00
msgdump:
        .byte "Commencing dump operation...", $00
dump_template:
        .byte "0000xxxx  xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx", $00
msgrun:
        .byte "Running program...", $00
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
cmd_dump:
        .byte "DUMP", $00
cmd_run:
        .byte "RUN", $00
cmd_exit:
        .byte "EXIT", $00
