        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"
        .include "tokens.inc"
        .include "core.inc"
        .include "blink.inc"

        .import parse_line
        .import get_immediate_flag
        .import get_line_number
        .import get_token_code
        .import get_variable_section_size
        .import get_variable_section_ptr

        .import new_program
        .import add_new_line
        .import run_command

        .export register_exit

LINE_BUFFER_SIZE=64

        .code

        jsr new_program
        stz exit_flag

        register_user_break #user_break_handler
main_loop:
        ; Display prompt
        write_tty #basic_prompt

        ; Read one line
        tty_read_line #line_buffer, LINE_BUFFER_SIZE

        strtriml #line_buffer
        strtrimr #line_buffer

        ; If empty - repeat
        strlength #line_buffer
        cmp #$00
        beq main_loop

        lda #<line_buffer
        ldx #>line_buffer

        jsr parse_line
        sta return_buffer_ptr
        stx return_buffer_ptr+1

        bcc @parse_error
        copy_ptr return_buffer_ptr, ptr1
        jsr get_immediate_flag
        beq @add_line_to_program
        ; execute immediately
        copy_ptr return_buffer_ptr, command_ptr
        ; skip immediate flag and line number for immediate execution
        inc_ptr command_ptr, #$03
        ; load parameters
        lda command_ptr
        ldx command_ptr+1
        jsr run_command
        ; check if exit triggered by command
        bit exit_flag
        bne exit
        jmp main_loop

@add_line_to_program:
        lda return_buffer_ptr
        ldx return_buffer_ptr+1
        jsr add_new_line
        jmp main_loop

@parse_error:
        write_tty #err_parse_failed
        jsr get_variable_section_ptr
        sta variable_section_ptr
        stx variable_section_ptr+1
        writeln_tty variable_section_ptr 

        jmp main_loop

exit:
        jsr _deregister_user_break
        rts

register_exit:
        lda #$ff
        sta exit_flag
        rts

user_break_handler:
        jsr _tty_send_newline
        writeln_tty #msgsystembreak
        jsr _tty_send_newline
        jsr _strobe_led
        jmp main_loop

        .segment "BSS"
exit_flag:
        .res 1
line_buffer:
        .res LINE_BUFFER_SIZE
return_buffer_ptr:
        .res 2
command_ptr:
        .res 2
variable_section_ptr:
        .res 2

        .segment "RODATA"

basic_prompt:
        .asciiz "OS/1 Basic>"

err_parse_failed:
        .asciiz "Unable to parse line: "

msgsystembreak:
        .asciiz "User break initiated, returing to BASIC shell..."
