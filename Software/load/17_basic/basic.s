        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"

        .import parse_line

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

        ; Compare against quit command
        strcompare #line_buffer, #cmd_quit
        cmp #$00
        beq exit

        ; parse_dec_word #line_buffer
        ; bcs @print_line_num
        ; writeln_tty #err_line_num
        lda #<line_buffer
        ldx #>line_buffer

        jsr parse_line
        sta return_buffer_ptr
        stx return_buffer_ptr+1

        bcc @parse_error
        bra main_loop

@parse_error:
        write_tty #err_parse_failed
        copy_ptr return_buffer_ptr, variable_section_ptr
        inc_ptr variable_section_ptr, #$05
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

cmd_quit:
        .asciiz "QUIT"

err_parse_failed:
        .asciiz "Unable to parse line: "
