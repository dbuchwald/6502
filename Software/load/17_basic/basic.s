        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"

        .import parse_line

LINE_BUFFER_SIZE=64

        .zeropage
line_ptr:
        .res 2

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

        bcs main_loop
        writeln_tty #err_line_num

        bra main_loop

; @print_line_num:
;         stx line_number
;         sta line_number+1

;         write_tty #msg_line_num
;         write_tty_address line_number
;         jsr _tty_send_newline
;         jmp main_loop

exit:
        rts


        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE

line_number:
        .res 2

        .segment "RODATA"

basic_prompt:
        .asciiz "OS/1 Basic>"

cmd_list:
        .asciiz "CMD"
cmd_print:
        .asciiz "PRINT"
cmd_goto:
        .asciiz "GOTO"
cmd_run:
        .asciiz "RUN"
cmd_quit:
        .asciiz "QUIT"

err_line_num:
        .asciiz "Unable to parse line number..."

msg_line_num:
        .asciiz "Line number is: "