        .setcpu "65C02"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "string.inc"
        .include "macros.inc"
        .include "parse.inc"
        .include "sys_const.inc"
        .include "tokens.inc"

        .export parse_line
        .export get_immediate_flag
        .export get_line_number
        .export get_token_code
        .export get_variable_section_size
        .export get_variable_section_ptr

TOKEN_BUFFER_LENGTH  = 64
STRING_BUFFER_LENGTH = 128

RETURN_BUFFER_LENGTH = 256

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

        .macro parse_fail reason
        strcopy reason, #variable_section
        strlength reason
        sta variable_section_size
        lda #(TOKEN_ERROR)
        sta command_token
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
        cmp #(CHAR_TAB)
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

        .macro if_command token, parse_function, parse_ok, parse_failed
        .local @not_this_command
        .local @parse_failed
        strcompare #token_buffer, token
        cmp #$00
        bne @not_this_command
        jsr parse_function
        bcc @parse_failed
        jmp parse_ok
@parse_failed:
        jmp parse_failed
@not_this_command:
        .endmacro

        .zeropage
line_ptr:
        .res 2
token_ptr:
        .res 2
variable_section_ptr:
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

        copy_ptr #variable_section, variable_section_ptr
        stz variable_section_size

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
        lda line_number
        sta command_line_number
        lda line_number+1
        sta command_line_number+1
        stz immediate_command_flag
        ; write_tty_address line_number
        ; jsr _tty_send_newline

@parse_command:
        jsr parse_command
        bcc @error
        sec 
        bra @exit

@error:
        clc
        bra @exit

@exit:
        lda #<return_val_buffer
        ldx #>return_val_buffer
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
        lda #(CHAR_END_OF_STRING)
        sta (token_ptr),y
        ; try to parse the number (might fail if too big)
        parse_dec_word #token_buffer
        bcc @error
        ; parsed successfully
        sta line_number+1
        stx line_number
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
        lda #(CHAR_END_OF_STRING)
        sta token_buffer, y
        ; convert command to uppercase
        strtoupper #token_buffer
        ; start comparison
        if_command #cmd_list, parse_list, @exit, @error
        if_command #cmd_run, parse_run, @exit, @error
        if_command #cmd_new, parse_new, @exit, @error
        if_command #cmd_print, parse_print, @exit, @error
        if_command #cmd_goto, parse_goto, @exit, @error
        if_command #cmd_exit, parse_exit, @exit, @error
        if_command #cmd_mem, parse_mem, @exit, @error

        parse_fail #error_invalid_command
        bra @error
@error:
        clc
        bra @exit

@exit:
        pop_line_ptr
        rts

parse_list:
        lda #(TOKEN_LIST)
        jmp parse_immediate_command

parse_run:
        lda #(TOKEN_RUN)
        jmp parse_immediate_command

parse_exit:
        lda #(TOKEN_EXIT)
        jmp parse_immediate_command

parse_new:
        lda #(TOKEN_NEW)
        jmp parse_immediate_command

parse_mem:
        lda #(TOKEN_MEM)
        jmp parse_immediate_command

parse_immediate_command:
        sta command_token
        lda immediate_command_flag
        beq @error
        sec
        rts
@error:
        parse_fail #error_immediate_cmd
        clc
        rts

parse_print:
        lda #(TOKEN_PRINT)
        sta command_token
        push_line_ptr
        skip_whitespace
        move_line_ptr_to_y
        jsr parse_string_expression
        bcc @error
        sec
        bra @exit
@error:
        parse_fail #error_invalid_string
        clc
        bra @exit
@exit:
        pop_line_ptr
        rts

parse_goto:
        lda immediate_command_flag
        beq @good_mode
        jmp @error_imm
@good_mode:
        lda #(TOKEN_GOTO)
        sta command_token
        push_line_ptr
        skip_whitespace
        move_line_ptr_to_y
        jsr parse_line_number
        bcc @error_num
        lda line_number
        sta (variable_section_ptr)
        inc_ptr variable_section_ptr
        lda line_number+1
        sta (variable_section_ptr)
        clc
        lda #$02
        adc variable_section_size
        sta variable_section_size
        skip_whitespace
        move_line_ptr_to_y
        sec
        bra @exit
@error_imm:
        parse_fail #error_not_immediate_cmd
        clc
        ; deliberately not jumping to @exit, as there is nothing to pop
        rts
@error_num:
        parse_fail #error_invalid_line_num
        clc
        bra @exit
@exit:
        pop_line_ptr
        rts

parse_string_expression:
        push_line_ptr

        jsr parse_string
        bcc @error
        
        strcopy #string_buffer, variable_section_ptr
        strlength #string_buffer
        ; add one byte for null terminator
        inc A
        clc
        adc variable_section_size
        sta variable_section_size
        sec
        bra @exit
@error:
        clc
        bra @exit
@exit:
        pop_line_ptr
        rts

parse_string:
        push_line_ptr
        ; String starts with " and ends with one
        lda (line_ptr),y
        cmp #(CHAR_DOUBLEQUOTE)
        bne @error
        ; Copy contents to buffer
        inc_ptr line_ptr
        ldy #$00
@copy_loop:
        lda (line_ptr),y
        cmp #(CHAR_DOUBLEQUOTE)
        beq @copy_done
        cmp #(CHAR_END_OF_STRING)
        beq @error
        cmp #(CHAR_BACKSLASH)
        beq @escape_char
        ; Not special character, copy to buffer
@copy_to_buffer:
        sta string_buffer, y
        iny
        bra @copy_loop
@escape_char:
        ; Next char can be \ or "
        inc_ptr line_ptr
        lda (line_ptr),y
        cmp #(CHAR_DOUBLEQUOTE)
        beq @copy_to_buffer
        cmp #(CHAR_BACKSLASH)
        beq @copy_to_buffer
        ; otherwise it's an error
        bra @error
@copy_done:
        ; add null terminator
        lda #(CHAR_END_OF_STRING)
        sta string_buffer, y
        sec
        bra @exit
@error:
        clc
        bra @exit
@exit:
        pop_line_ptr
        rts

get_immediate_flag:
        lda immediate_command_flag
        rts

get_line_number:
        lda command_line_number
        ldx command_line_number+1
        rts

get_token_code:
        lda command_token
        rts

get_variable_section_size:
        lda variable_section_size
        rts

get_variable_section_ptr:
        lda #<variable_section
        ldx #>variable_section
        rts

        .segment "BSS"
line_buffer_ptr:
        .res 2

line_number:
        .res 2

token_buffer:
        .res TOKEN_BUFFER_LENGTH

string_buffer:
        .res STRING_BUFFER_LENGTH

return_val_buffer:
immediate_command_flag:
        .res 1
command_line_number:
        .res 2
command_token:
        .res 1
variable_section_size:
        .res 1
variable_section:
        .res RETURN_BUFFER_LENGTH - (variable_section - return_val_buffer)

        .segment "RODATA"

error_invalid_line_num:
        .asciiz "Invalid line number"
error_invalid_command:
        .asciiz "Invalid command"
error_invalid_string:
        .asciiz "Invalid string"
error_immediate_cmd:
        .asciiz "Only immediate command"
error_not_immediate_cmd:
        .asciiz "Non-immediate command"