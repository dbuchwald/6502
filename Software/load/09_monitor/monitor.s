      .setcpu "65C02"
      .include "tty.inc"
      .include "string.inc"
      .include "utils.inc"
      .include "menu.inc"
      .include "parse.inc"

        .code
init:
        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2
        writeln_tty #msghello3

        run_menu #menu, #prompt
        rts

_get_address:
        copy_ptr ptr1, tokens_pointer
        gettoken tokens_pointer, 1
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
        copy_ptr ptr1, tokens_pointer
        ; check if colon provided
        gettoken tokens_pointer, 2
        copy_ptr ptr1, operator_pointer
        strcmp #colon, operator_pointer
        cmp #$00
        beq @good_op
        jmp get_error
@good_op:
        ; get start address
        gettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcc get_error
        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        ; get end address
        gettoken tokens_pointer, 3
        copy_ptr ptr1, end_address_pointer

        parse_hex_word end_address_pointer
        bcc get_error
        ; LSB 
        stx end_address
        ; MSB 
        sta end_address+1
        jmp _print_memory_range
get_error:
        writeln_tty #parseerr
        rts

_print_memory_range:
        lda start_address+1
        jsr _convert_to_hex
        txa
        sta msgget_start
        tya
        sta msgget_start+1
        lda start_address
        jsr _convert_to_hex
        txa
        sta msgget_start+2
        tya
        sta msgget_start+3

        lda end_address+1
        jsr _convert_to_hex
        txa
        sta msgget_end
        tya
        sta msgget_end+1
        lda end_address
        jsr _convert_to_hex
        txa
        sta msgget_end+2
        tya
        sta msgget_end+3

        writeln_tty #msgget
        rts

_put_value:
        copy_ptr ptr1, tokens_pointer
        ; check if colon provided
        gettoken tokens_pointer, 2
        copy_ptr ptr1, operator_pointer
        strcmp #assign, operator_pointer
        cmp #$00
        beq @good_op
        jmp put_error

@good_op:
        ; get address
        gettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcs @good_address
        jmp put_error
@good_address:
        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        ; get value
        gettoken tokens_pointer, 3
        copy_ptr ptr1, value_pointer

        parse_hex_byte value_pointer
        bcc put_error
        sta value

        lda value
        jsr _convert_to_hex
        txa
        sta msgput_value
        tya
        sta msgput_value+1

        lda start_address+1
        jsr _convert_to_hex
        txa
        sta msgput_address
        tya
        sta msgput_address+1
        lda start_address
        jsr _convert_to_hex
        txa
        sta msgput_address+2
        tya
        sta msgput_address+3

        writeln_tty #msgput
        rts

put_error:
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
menu:
        menuitem get2, "GET", 2, "GET xxxx - get data at the address xxxx", _get_address
        menuitem get4, "GET", 4, "GET xxxx:yyyy - get data between addresses xxxx and yyyy", _get_range
        menuitem put, "PUT", 4, "PUT xxxx=yy - put value yy at address xxxx", _put_value
        endmenu 