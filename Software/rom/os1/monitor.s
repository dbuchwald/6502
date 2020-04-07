        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "menu.inc"
        .include "parse.inc"

        .export _run_monitor

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

DUMP_BUFFER_SIZE = 64

        .code
_run_monitor:
        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2

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
        jmp @error
@good_op:
        ; get start address
        gettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcc @error
        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        ; get end address
        gettoken tokens_pointer, 3
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

        write_tty #msgget

        lda start_address+1
        jsr _convert_to_hex
        txa
        sta address_buffer
        tya
        sta address_buffer+1
        lda start_address
        jsr _convert_to_hex
        txa
        sta address_buffer+2
        tya
        sta address_buffer+3
        stz address_buffer+4

        write_tty #address_buffer
        write_tty #msgget_sep

        lda end_address+1
        jsr _convert_to_hex
        txa
        sta address_buffer
        tya
        sta address_buffer+1
        lda end_address
        jsr _convert_to_hex
        txa
        sta address_buffer+2
        tya
        sta address_buffer+3
        stz address_buffer+4

        writeln_tty #address_buffer

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

        lda #00
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

        strtrimr #dump_line
        writeln_tty #dump_line
        jmp @line_loop
@exit:
        strtrimr #dump_line
        writeln_tty #dump_line
        rts

_put_value:
        copy_ptr ptr1, tokens_pointer
        ; check if colon provided
        gettoken tokens_pointer, 2
        copy_ptr ptr1, operator_pointer
        strcmp #assign, operator_pointer
        cmp #$00
        beq @good_op
        jmp @error

@good_op:
        ; get address
        gettoken tokens_pointer, 1
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
        gettoken tokens_pointer, 3
        copy_ptr ptr1, value_pointer

        parse_hex_byte value_pointer
        bcc @error
        sta value

        write_tty #msgput

        lda value
        jsr _convert_to_hex
        txa
        sta value_buffer
        tya
        sta value_buffer+1
        stz value_buffer+2

        write_tty #value_buffer

        write_tty #msgput_at_address

        lda start_address+1
        jsr _convert_to_hex
        txa
        sta address_buffer
        tya
        sta address_buffer+1
        lda start_address
        jsr _convert_to_hex
        txa
        sta address_buffer+2
        tya
        sta address_buffer+3
        stz address_buffer+4

        writeln_tty #address_buffer

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
        .res DUMP_BUFFER_SIZE
address_buffer:
        .res 5
value_buffer:
        .res 3

        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 monitor application"
msghello2: 
        .asciiz "Enter HELP to see available commands"
msgget:
        .asciiz "Displaying contents of memory area "
msgget_sep:
        .asciiz ":"
msgput:
        .asciiz "Storing value "
msgput_at_address:
        .asciiz " at address "
parseerr:
        .asciiz "Unable to parse given address"
prompt:
        .asciiz "OS/1 Monitor>"
colon:
        .asciiz ":"
assign:
        .asciiz "="
dump_template:
        .asciiz "xxxx                                                    "
menu:
        menuitem get2, "GET", 2, "GET xxxx - get data at the address xxxx", _get_address
        menuitem get4, "GET", 4, "GET xxxx:yyyy - get data between addresses xxxx and yyyy", _get_range
        menuitem put, "PUT", 4, "PUT xxxx=yy - put value yy at address xxxx", _put_value
        endmenu 
