        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "lcd.inc"
        .include "modem.inc"
        .include "blink.inc"
        .include "core.inc"

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

        ; Display banner
        writeln_tty #msgemptyline
        writeln_tty #bannerh1
        writeln_tty #bannerh2
        writeln_tty #banner1
        writeln_tty #banner2
        writeln_tty #banner3
        writeln_tty #banner4
        writeln_tty #banner5
        writeln_tty #bannerh2
        writeln_tty #bannerh1
        writeln_tty #msgemptyline

        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2
        writeln_tty #msghello3

        register_system_break #system_break_handler

main_loop:
        ; Start with prompt
        write_tty #os1prompt

        ; Read line 
        tty_read_line #line_buffer, LINE_BUFFER_SIZE

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
        bne @compare_cmd_dump
        jsr _perform_load
        jmp main_loop

@compare_cmd_dump:
        strcmp #line_buffer, #cmd_dump
        cmp #$00
        bne @compare_cmd_run
        jsr _perform_dump
        jmp main_loop

@compare_cmd_run:
        strcmp #line_buffer, #cmd_run
        cmp #$00
        bne @compare_cmd_exit
        jsr _run_program
        jmp main_loop

@compare_cmd_exit:
        strcmp #line_buffer, #cmd_exit
        cmp #$00
        bne @invalid_command
        jsr _display_exit_message
        rts

@invalid_command:
        writeln_tty #msgerror
        writeln_tty #msghello3
        jmp main_loop
        
_display_help_message:
        writeln_tty #msghelp1
        writeln_tty #msghelp2
        writeln_tty #msghelp3
        writeln_tty #msghelp4
        writeln_tty #msghelp5
        rts

_perform_load:
        writeln_tty #msgload
@receive_file:
        jsr _modem_receive
        bcc @receive_file
        rts

_perform_dump:
        writeln_tty #msgdump

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
        lda (ptr3)
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
        writeln_tty #dump_line
        bra @line_loop
@exit:
        rts


_run_program:
        writeln_tty #msgrun
        jsr $1000
        rts

_display_exit_message:
        writeln_tty #msgbye
        rts

system_break_handler:
        writeln_tty #msgemptyline
        writeln_tty #msgemptyline
        writeln_tty #msgemptyline
        writeln_tty #msgsystembreak
        jsr _strobe_led
        jmp main_loop

        .segment "BSS"
dump_line:
        .res 64

line_buffer:
        .res LINE_BUFFER_SIZE

        .segment "RODATA"
bannerh1:
        .asciiz "+---------------------------+"
bannerh2:
        .asciiz "|                           |"
banner1:
        .asciiz "|   ####   ####     #   #   |"
banner2:
        .asciiz "|  ##  ## ##       #   ##   |"
banner3:
        .asciiz "|  #    #  ###    #   # #   |"
banner4:
        .asciiz "|  ##  ##    ##  #      #   |"
banner5:
        .asciiz "|   ####  ####  #      ###  |"
msghello1: 
        .asciiz "Welcome to OS/1 shell for DB6502 computer"
msghello2: 
        .asciiz "Enter command and follow by ENTER key"
msghello3:
        .asciiz "Currently supported commands are: HELP, LOAD, DUMP, RUN and EXIT"
msghelp1:
        .asciiz "HELP - display this message"
msghelp2:
        .asciiz "LOAD - load program"
msghelp3:
        .asciiz "RUN - run loaded program"
msghelp4:
        .asciiz "DUMP - show memory contents"
msghelp5:
        .asciiz "EXIT - exit the shell"
msgload:
        .asciiz "Initiating load operation..."
msgdump:
        .asciiz "Commencing dump operation..."
dump_template:
        .asciiz "0000xxxx  xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx"
msgrun:
        .asciiz "Running program..."
msgbye:
        .asciiz "Thank you for using OS/1 simple shell"
os1prompt:
        .asciiz "OS/1>"
msgerror:
        .asciiz "Command not recognized, please try again"
msgemptyline:
        .byte $00
msgsystembreak:
        .asciiz "System break initiated, returning to shell..."
cmd_help:
        .asciiz "HELP"
cmd_load:
        .asciiz "LOAD"
cmd_dump:
        .asciiz "DUMP"
cmd_run:
        .asciiz "RUN"
cmd_exit:
        .asciiz "EXIT"
