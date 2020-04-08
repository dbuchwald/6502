        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "menu.inc"
        .include "parse.inc"

        .export _run_monitor

        .import opcodes_matrix

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

ACCUMULATOR = $01
ABSOLUTE    = $02
ABSOLUTE_X  = $03
ABSOLUTE_Y  = $04
IMMEDIATE   = $05
IMPLIED     = $06
X_INDIRECT  = $07
INDIRECT_Y  = $08
RELATIVE    = $09
ZEROPAGE    = $0a
ZEROPAGE_X  = $0b
ZEROPAGE_Y  = $0c
ZEROPAGE_R  = $0d
ZEROPAGE_I  = $0e
INDIRECT    = $0f
INDIRECT_X  = $10

OPERAND_BUFFER_SIZE = 10

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
        write_tty #colon

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

_disasm_address:
        copy_ptr ptr1, tokens_pointer
        gettoken tokens_pointer, 1
        copy_ptr ptr1, start_address_pointer

        parse_hex_word start_address_pointer
        bcc @error

        ; LSB 
        stx start_address
        ; MSB 
        sta start_address+1

        stz instruction_counter

        jmp _disasm_code
@error:
        writeln_tty #parseerr
        rts

_disasm_code:
        write_tty #msgdisasm
        writeln_tty start_address_pointer

        copy_ptr start_address, pc_pointer

@instruction_loop:
        ; get opcode at the address
        lda pc_pointer+1
        jsr _convert_to_hex
        txa
        sta address_print_buffer
        tya
        sta address_print_buffer+1
        lda pc_pointer
        jsr _convert_to_hex
        txa
        sta address_print_buffer+2
        tya
        sta address_print_buffer+3
        lda #(':')
        sta address_print_buffer+4
        lda #(' ')
        sta address_print_buffer+5
        stz address_print_buffer+6

        write_tty #address_print_buffer

        write_tty #str_space

        copy_ptr pc_pointer, ptr1

        lda (ptr1)
        sta current_opcode

        jsr fetch_opcode_descriptor

        write_tty opcode_entry

        jsr format_operand

        write_tty #str_space
        write_tty #operand_print_buffer

        jsr _tty_send_newline

        inc_ptr pc_pointer

        inc instruction_counter
        lda instruction_counter
        cmp #$20
        beq @exit
        jmp @instruction_loop
@exit:
        rts

fetch_opcode_descriptor:
        ; calculate offset
        stz opcode_offset
        stz opcode_offset+1

        lda current_opcode
        ; multiply by 3 START
        sta opcode_offset
        asl opcode_offset
        bcc @no_inc
        inc opcode_offset+1
@no_inc:
        clc
        lda opcode_offset
        adc current_opcode
        sta opcode_offset
        bcc @no_inc2
        inc opcode_offset+1
@no_inc2:
        ; multiply by 3 END

        ; calculate pointer to entry
        copy_ptr #opcodes_matrix, opcode_pointer

        add_offset opcode_pointer, opcode_offset

        ; fetch data from the pointer
        copy_ptr opcode_pointer, ptr1

        ; opcode_entry points to mnemonic string
        ; addressing_mode contains information about addressing mode
        ldy #$00
        lda (ptr1),y
        sta opcode_entry
        iny
        lda (ptr1),y
        sta opcode_entry+1
        iny
        lda (ptr1),y
        sta addressing_mode

        rts

format_operand:
        ldx #$00
        lda #(' ')
@clean_loop:
        sta operand_print_buffer,x
        inx
        cpx #(OPERAND_BUFFER_SIZE-1)
        bne @clean_loop
        stz operand_print_buffer,x

        switch addressing_mode
        case ACCUMULATOR, format_accumulator
        case ABSOLUTE,    format_absolute
        case ABSOLUTE_X,  format_absolute_x
        case ABSOLUTE_Y,  format_absolute_y
        case IMMEDIATE,   format_immediate
        case IMPLIED,     format_implied
        case X_INDIRECT,  format_x_indirect
        case INDIRECT_Y,  format_indirect_y
        case RELATIVE,    format_relative
        case ZEROPAGE,    format_zeropage
        case ZEROPAGE_X,  format_zeropage_x
        case ZEROPAGE_Y,  format_zeropage_y
        case ZEROPAGE_R,  format_zeropage_r
        case ZEROPAGE_I,  format_zeropage_i
        case INDIRECT,    format_indirect
        case INDIRECT_X,  format_indirect_x
        rts

        .macro format_byte_operand format, offset
        strcpy format, #operand_print_buffer
        jsr fetch_byte_operand
        ldx #(offset)
        lda operand_buffer
        sta operand_print_buffer,x
        inx
        lda operand_buffer+1
        sta operand_print_buffer,x
        .endmacro

        .macro format_word_operand format, offset
        strcpy format, #operand_print_buffer
        jsr fetch_word_operand
        ldx #(offset)
        lda operand_buffer
        sta operand_print_buffer,x
        inx
        lda operand_buffer+1
        sta operand_print_buffer,x
        inx
        lda operand_buffer+2
        sta operand_print_buffer,x
        inx
        lda operand_buffer+3
        sta operand_print_buffer,x
        .endmacro

format_accumulator:
        strcpy #str_format_accumulator, #operand_print_buffer
        rts
format_absolute:
        format_word_operand #str_format_absolute, 1
        rts
format_absolute_x:
        format_word_operand #str_format_absolute_x, 1
        rts
format_absolute_y:
        format_word_operand #str_format_absolute_y, 1
        rts
format_immediate:
        format_byte_operand #str_format_immediate, 2
        rts
format_implied:
        strcpy #str_format_implied, #operand_print_buffer
        rts
format_x_indirect:
        format_byte_operand #str_format_x_indirect, 2
        rts
format_indirect_y:
        format_byte_operand #str_format_indirect_y, 2
        rts
format_relative:
        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        sta relative_offset
        stz relative_offset+1
        copy_ptr pc_pointer, pc_pointer_original
        inc_ptr pc_pointer_original
        add_offset pc_pointer_original, relative_offset

        lda pc_pointer_original
        jsr _convert_to_hex
        txa
        sta operand_buffer+2
        tya
        sta operand_buffer+3

        lda pc_pointer_original+1
        jsr _convert_to_hex
        txa
        sta operand_buffer
        tya 
        sta operand_buffer+1

        lda #('$')
        sta operand_print_buffer
        ldx #$00
@copy_loop:
        lda operand_buffer,x
        inx
        sta operand_print_buffer,x
        cpx #$05
        bne @copy_loop
        stz operand_print_buffer,x
        
        rts
format_zeropage:
        format_byte_operand #str_format_zeropage, 1
        rts
format_zeropage_x:
        format_byte_operand #str_format_zeropage_x, 1
        rts
format_zeropage_y:
        format_byte_operand #str_format_zeropage_y, 1
        rts
format_zeropage_r:
        format_byte_operand #str_format_zeropage_r, 1
        rts
format_zeropage_i:
        format_byte_operand #str_format_zeropage_i, 2
        rts
format_indirect:
        format_word_operand #str_format_indirect, 2
        rts
format_indirect_x:
        format_word_operand #str_format_indirect_x, 2
        rts

fetch_byte_operand:
        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        jsr _convert_to_hex
        txa
        sta operand_buffer
        tya
        sta operand_buffer+1
        rts

fetch_word_operand:
        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        jsr _convert_to_hex
        txa
        sta operand_buffer+2
        tya
        sta operand_buffer+3

        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        jsr _convert_to_hex
        txa
        sta operand_buffer
        tya 
        sta operand_buffer+1
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
instruction_counter:
        .res 1
pc_pointer:
        .res 2
pc_pointer_original:
        .res 2
current_opcode:
        .res 1
address_print_buffer:
        .res 7
operand_print_buffer:
        .res OPERAND_BUFFER_SIZE
operand_buffer:
        .res 4
opcode_offset:
        .res 2
opcode_pointer:
        .res 2
opcode_entry:
        .res 2
addressing_mode:
        .res 1
relative_offset:
        .res 2

        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 monitor application"
msghello2: 
        .asciiz "Enter HELP to see available commands"
msgget:
        .asciiz "Displaying contents of memory area "
msgput:
        .asciiz "Storing value "
msgput_at_address:
        .asciiz " at address "
msgdisasm:
        .asciiz "Displaying code starting at "
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
        menuitem disasm, "DISASM", 2, "DISASM xxxx - disassemble code starting at address xxxx", _disasm_address
        endmenu 

str_space:
        .asciiz "  "

str_format_accumulator:
        .asciiz "A"
str_format_absolute:
        .asciiz "$xxxx"
str_format_absolute_x:
        .asciiz "$xxxx,X"
str_format_absolute_y:
        .asciiz "$xxxx,Y"
str_format_immediate:
        .asciiz "#$xx"
str_format_implied:
        .asciiz ""
str_format_x_indirect:
        .asciiz "($xx,X)"
str_format_indirect_y:
        .asciiz "($xx),Y"
str_format_zeropage:
        .asciiz "$xx"
str_format_zeropage_x:
        .asciiz "$xx,X"
str_format_zeropage_y:
        .asciiz "$xx,Y"
str_format_zeropage_r:
        .asciiz "$xx,$xxxx"
str_format_zeropage_i:
        .asciiz "($xx)"
str_format_indirect:
        .asciiz "($xxxx)"
str_format_indirect_x:
        .asciiz "($xxxx,X)"