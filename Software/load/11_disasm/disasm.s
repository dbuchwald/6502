        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "menu.inc"
        .include "parse.inc"
        .include "macros.inc"

        .export _run_disasm

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

        .import opcodes_matrix

        .code
_run_disasm:
        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2

        run_menu #menu, #prompt
        rts

_disasm_address:
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
        jsr convert_to_hex
        txa
        sta address_print_buffer
        tya
        sta address_print_buffer+1
        lda pc_pointer
        jsr convert_to_hex
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
        case #(ACCUMULATOR), format_accumulator
        case #(ABSOLUTE),    format_absolute
        case #(ABSOLUTE_X),  format_absolute_x
        case #(ABSOLUTE_Y),  format_absolute_y
        case #(IMMEDIATE),   format_immediate
        case #(IMPLIED),     format_implied
        case #(X_INDIRECT),  format_x_indirect
        case #(INDIRECT_Y),  format_indirect_y
        case #(RELATIVE),    format_relative
        case #(ZEROPAGE),    format_zeropage
        case #(ZEROPAGE_X),  format_zeropage_x
        case #(ZEROPAGE_Y),  format_zeropage_y
        case #(ZEROPAGE_R),  format_zeropage_r
        case #(ZEROPAGE_I),  format_zeropage_i
        case #(INDIRECT),    format_indirect
        case #(INDIRECT_X),  format_indirect_x
        rts

        .macro format_byte_operand format, offset
        strcopy format, #operand_print_buffer
        jsr fetch_byte_operand
        ldx #(offset)
        lda operand_buffer
        sta operand_print_buffer,x
        inx
        lda operand_buffer+1
        sta operand_print_buffer,x
        .endmacro

        .macro format_word_operand format, offset
        strcopy format, #operand_print_buffer
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
        strcopy #str_format_accumulator, #operand_print_buffer
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
        strcopy #str_format_implied, #operand_print_buffer
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
        add_offset_relative pc_pointer_original, relative_offset

        lda pc_pointer_original
        jsr convert_to_hex
        txa
        sta operand_buffer+2
        tya
        sta operand_buffer+3

        lda pc_pointer_original+1
        jsr convert_to_hex
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
        jsr convert_to_hex
        txa
        sta operand_buffer
        tya
        sta operand_buffer+1
        rts

fetch_word_operand:
        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        jsr convert_to_hex
        txa
        sta operand_buffer+2
        tya
        sta operand_buffer+3

        inc_ptr pc_pointer
        copy_ptr pc_pointer, ptr1
        lda (ptr1)
        jsr convert_to_hex
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
start_address:
        .res 2
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
        .res 1


        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 disassembler"
msghello2: 
        .asciiz "Enter HELP for information about supported commands"
msgdisasm:
        .asciiz "Displaying code starting at "
parseerr:
        .asciiz "Unable to parse given address"
prompt:
        .asciiz "OS/1 DISASM>"
menu:
        menuitem disasm_cmd, 2, disasm_desc, _disasm_address
        endmenu 

disasm_cmd:
        .asciiz "DISASM"
disasm_desc:
        .asciiz "DISASM xxxx - disassemble code starting at address xxxx"

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