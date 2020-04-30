        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"
        .include "tokens.inc"

        .import parse_line
        .import get_immediate_flag
        .import get_line_number
        .import get_token_code
        .import get_variable_section_size
        .import get_variable_section_ptr

LINE_BUFFER_SIZE=64

        .code

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
        beq main_loop
        jsr get_token_code
        cmp #(TOKEN_PRINT)
        bne @not_print
        jsr get_variable_section_ptr
        sta variable_section_ptr
        stx variable_section_ptr+1
        writeln_tty variable_section_ptr
        jmp main_loop

@not_print:
        cmp #(TOKEN_QUIT)
        beq exit
        jmp main_loop

@parse_error:
        write_tty #err_parse_failed
        jsr get_variable_section_ptr
        sta variable_section_ptr
        stx variable_section_ptr+1
        writeln_tty variable_section_ptr 

        jmp main_loop

exit:
        rts

        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE
return_buffer_ptr:
        .res 2
variable_section_ptr:
        .res 2

        .segment "RODATA"

basic_prompt:
        .asciiz "OS/1 Basic>"

err_parse_failed:
        .asciiz "Unable to parse line: "
