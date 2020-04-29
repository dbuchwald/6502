        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"

        .export parse_line

TOKEN_BUFFER_LENGTH = 64

        .macro push_line_ptr
        pha
        dec_ptr sp
        lda line_ptr+1
        sta (sp)
        dec_ptr sp
        lda line_ptr
        sta (sp)
        pla
        .endmacro

        .macro pop_line_ptr
        pha
        lda (sp)
        sta line_ptr
        inc_ptr sp
        lda (sp)
        sta line_ptr+1
        inc_ptr sp
        pla
        .endmacro

        ; increments Y while (line_ptr),y is space or tab
        ; A contains first non-white char
        ; Y contains index
        .macro skip_whitespace
        .local @skip_loop
        .local @not_space
        .local @skip_exit
@skip_loop:
        lda (line_ptr),y
        beq @skip_exit
        cmp #(' ')
        bne @not_space
        iny
        bra @skip_loop
@not_space:
        cmp #$09 ; TAB
        bne @skip_exit
        iny
        bra @skip_loop
@skip_exit:
        .endmacro

        .macro move_line_ptr_to_y
        .local @move_not_required
        cpy #$00
        beq @move_not_required
        pha
        clc
        tya
        adc line_ptr
        sta line_ptr
        lda #$00
        adc line_ptr+1
        sta line_ptr+1
        ldy #$00
        pla
@move_not_required:
        .endmacro

        .zeropage
line_ptr:
        .res 2
token_ptr:
        .res 2

        .code

; Function parses line and prints the parsed tree
; Pointer to buffer containing line to parse is in A/X
; return valuce in carry
parse_line:
        sta line_buffer_ptr
        sta line_ptr
        stx line_buffer_ptr+1
        stx line_ptr+1

        strtriml line_buffer_ptr

        ; try to parse line number
        jsr parse_line_number
        ; success, not immediate command
        bcs @not_immediate_command
        ; failure, must be immediate command
        lda #$ff
        sta immediate_command_flag
        bra @parse_command

        ; Y contains number of parsed characters
        ; need to update line_ptr
@not_immediate_command:
        move_line_ptr_to_y

        write_tty_address line_number
        jsr _tty_send_newline

@parse_command:
        jsr parse_command
        bcc @error
        sec 
        rts

@error:
        clc
        rts

parse_line_number:
        ldy #$00
        copy_ptr #token_buffer, token_ptr
        ; start by isolating all the digits in front
@copy_loop:
        lda (line_ptr),y
        cmp #('0')
        bmi @copy_done
        cmp #('9'+1)
        bpl @copy_done
        sta (token_ptr),y
        iny
        cpy #(TOKEN_BUFFER_LENGTH-1)
        bne @copy_loop
@copy_done:
        ; check if we actually copied anything
        cpy #$00
        ; nope
        beq @error
        ; terminate with null char
        lda #$00
        sta (token_ptr),y
        ; try to parse the number (might fail if too big)
        parse_dec_word #token_buffer
        bcc @error
        ; parsed successfully
        sta line_number+1
        stx line_number
        stz immediate_command_flag
        sec
        rts
@error:
        clc
        ldy #$00
        rts

parse_command:
        ; preserve current value of the pointer
        ; on secondary stack
        push_line_ptr
        ; start from the beginning and skip all whitespaces
        ldy #$00
        skip_whitespace
        move_line_ptr_to_y
        ; read command [a-zA-Z]
@copy_loop:
        lda (line_ptr),y
        cmp #('A')
        bmi @not_char
        cmp #('Z'+1)
        bmi @char
        cmp #('a')
        bmi @not_char
        cmp #('z'+1)
        bmi @char
        bra @not_char
@char:
        sta token_buffer,y
        iny
        bra @copy_loop
        ; copying finished
@not_char:
        ; did we actually copy anything?
        cpy #$00
        ; yes, keep working
        bne @compare_commands
        ; nope, error
        jmp @error

@compare_commands:
        ; add null terminator
        lda #$00
        sta token_buffer, y
        ; convert command to uppercase
        strtoupper #token_buffer
        ; start comparison
        strcompare #token_buffer, #cmd_list
        cmp #$00
        bne @not_list
        jsr parse_list
        bcc @error
        jmp @exit
@not_list: 
        strcompare #token_buffer, #cmd_run
        cmp #$00
        bne @not_run
        jsr parse_run
        bcc @error
        jmp @exit
@not_run:
        strcompare #token_buffer, #cmd_print
        cmp #$00
        bne @not_print
        jsr parse_print
        bcc @error
        jmp @exit
@not_print:
        strcompare #token_buffer, #cmd_goto
        cmp #$00
        bne @error
        jsr parse_goto
        bcc @error
        jmp @exit

@error:
        clc
        bra @exit

@exit:
        pop_line_ptr
        rts

parse_list:
        writeln_tty #cmd_list
        sec
        rts

parse_run:
        writeln_tty #cmd_run
        sec
        rts

parse_print:
        writeln_tty #cmd_print
        sec
        rts

parse_goto:
        writeln_tty #cmd_goto
        push_line_ptr
        skip_whitespace
        move_line_ptr_to_y
        jsr parse_line_number
        bcc @error
        write_tty_address line_number
        jsr _tty_send_newline
        sec
        bra @exit
@error:
        clc
        bra @exit
@exit:
        pop_line_ptr
        rts


        .segment "BSS"
line_buffer_ptr:
        .res 2

line_number:
        .res 2

token_buffer:
        .res TOKEN_BUFFER_LENGTH

immediate_command_flag:
        .res 1

        .segment "RODATA"

cmd_list:
        .asciiz "LIST"
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