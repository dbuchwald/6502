        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "menu.inc"
        .include "parse.inc"
        .include "macros.inc"

        .export _run_monitor

        .macro hex_to_buffer
        jsr convert_to_hex
        txa
        ldx tmp1
        sta dump_line,x
        inx
        tya
        sta dump_line,x
        inx
        stx tmp1
        .endmacro

        .code
_run_monitor:
        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2
        writeln_tty #msghello3

        run_menu #menu, #prompt
        rts

_get_address:
        sta tokens_pointer
        stx tokens_pointer+1
        strgettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcc @error

        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1
        ; add 15 bytes
        clc
        lda start_address
        adc #$0f
        sta end_address
        lda #$00
        adc start_address+1
        sta end_address+1
        jmp _print_memory_range
@error:
        writeln_tty #parseerr
        rts

_get_range:
        sta tokens_pointer
        stx tokens_pointer+1
        ; check if colon provided
        strgettoken tokens_pointer, 2
        copy_ptr ptr1, operator_pointer
        strcompare #colon, operator_pointer
        cmp #$00
        beq @good_op
        jmp @error
@good_op:
        ; get start address
        strgettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcc @error
        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        ; get end address
        strgettoken tokens_pointer, 3
        copy_ptr ptr1, end_address_pointer

        parse_hex_word end_address_pointer
        bcc @error
        ; LSB 
        stx end_address
        ; MSB 
        sta end_address+1
        cmp_ptr end_address, start_address
        bcc @error
        jmp _print_memory_range
@error:
        writeln_tty #parseerr
        rts

_print_memory_range:
        lda start_address+1
        jsr convert_to_hex
        txa
        sta msgget_start
        tya
        sta msgget_start+1
        lda start_address
        jsr convert_to_hex
        txa
        sta msgget_start+2
        tya
        sta msgget_start+3

        lda end_address+1
        jsr convert_to_hex
        txa
        sta msgget_end
        tya
        sta msgget_end+1
        lda end_address
        jsr convert_to_hex
        txa
        sta msgget_end+2
        tya
        sta msgget_end+3

        writeln_tty #msgget
        ; Actual memory dump
        copy_ptr start_address, ptr3
@line_loop:
        ldx #$00
@template_loop:
        lda dump_template,x
        sta dump_line,x
        inx
        cmp #$00
        bne @template_loop

        lda #04
        sta tmp1
        lda ptr3+1
        hex_to_buffer
        lda ptr3
        hex_to_buffer
        inc tmp1
        inc tmp1
        stz tmp2
@byte_loop:
        lda (ptr3)
        hex_to_buffer
        inc tmp1
        inc tmp2

        cmp_ptr end_address,ptr3
        beq @exit

        inc_ptr ptr3
@next_item:
        lda tmp2
        and #%00000111
        bne @byte_loop

        inc tmp1

        lda tmp2
        and #%00001111
        bne @byte_loop

        writeln_tty #dump_line
        jmp @line_loop
@exit:
        writeln_tty #dump_line
        rts

_put_value:
        sta tokens_pointer
        stx tokens_pointer+1
        ; check if colon provided
        strgettoken tokens_pointer, 2
        copy_ptr ptr1, operator_pointer
        strcompare #assign, operator_pointer
        cmp #$00
        beq @good_op
        jmp @error

@good_op:
        ; get address
        strgettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcs @good_address
        jmp @error
@good_address:
        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        ; get value
        strgettoken tokens_pointer, 3
        copy_ptr ptr1, value_pointer

        parse_hex_byte value_pointer
        bcc @error
        sta value

        lda value
        jsr convert_to_hex
        txa
        sta msgput_value
        tya
        sta msgput_value+1

        lda start_address+1
        jsr convert_to_hex
        txa
        sta msgput_address
        tya
        sta msgput_address+1
        lda start_address
        jsr convert_to_hex
        txa
        sta msgput_address+2
        tya
        sta msgput_address+3

        writeln_tty #msgput

        copy_ptr start_address, ptr1
        lda value
        sta (ptr1)

        rts

@error:
        writeln_tty #parseerr
        rts

        .segment "BSS"
tokens_pointer:
        .res 2
start_address_pointer:
        .res 2
operator_pointer:
        .res 2
end_address_pointer:
        .res 2
value_pointer:
        .res 2
start_address:
        .res 2
end_address:
        .res 2
value:
        .res 1
dump_line:
        .res 64

        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 monitor application"
msghello2: 
        .asciiz "Try entering simple commands followed by ENTER"
msghello3:
        .asciiz "Currently supported commands are: HELP, GET, PUT and EXIT"
msgget:
        .byte   "Displaying contents of memory area "
msgget_start:
        .byte   "xxxx:"
msgget_end:
        .asciiz "yyyy"
msgput:
        .byte   "Storing value "
msgput_value:
        .byte   "yy at address "
msgput_address:
        .asciiz "xxxx"
parseerr:
        .asciiz "Unable to parse given address"
prompt:
        .asciiz "OS/1 Monitor>"
colon:
        .asciiz ":"
assign:
        .asciiz "="
dump_template:
        .asciiz "0000xxxx                                                    "
menu:
        menuitem get_cmd, 2, get_2_desc, _get_address
        menuitem get_cmd, 4, get_4_desc, _get_range
        menuitem put_cmd, 4, put_desc, _put_value
        endmenu 
get_cmd:
        .asciiz "GET"
get_2_desc:
        .asciiz "GET xxxx - get data at the address xxxx"
get_4_desc:
        .asciiz "GET xxxx:yyyy - get data between addresses xxxx and yyyy"
put_cmd:
        .asciiz "PUT"
put_desc:
        .asciiz "PUT xxxx=yy - put value yy at address xxxx"