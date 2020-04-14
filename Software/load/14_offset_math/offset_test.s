        .setcpu "65C02"
        .include "tty.inc"
        .include "menu.inc"
        .include "utils.inc"
        .include "string.inc"
        .include "blink.inc"
        .include "parse.inc"

        .code
init:
        writeln_tty #hellomsg

        copy_ptr #testcases, tc_ptr
tc_loop:
        copy_ptr tc_ptr, ptr1
        lda (ptr1)
        sta base_ptr
        inc_ptr ptr1
        lda (ptr1)
        sta base_ptr+1
        inc_ptr ptr1
        lda (ptr1)
        beq exit
        sta offset
        inc_ptr ptr1
        copy_ptr ptr1, tc_ptr

        write_tty #testmsg1
        lda offset
        write_tty_hex
        write_tty #testmsg2
        write_tty_address base_ptr
        write_tty #testmsg3

        add_offset base_ptr, offset

        write_tty_address base_ptr
        jsr _tty_send_newline
        jmp tc_loop
exit:
        rts

        .segment "BSS"
tc_ptr:
        .res 2
base_ptr:
        .res 2
offset:
        .res 1

        .segment "RODATA"
hellomsg:
        .asciiz "Welcome to offset math testing module!"
testmsg1:
        .asciiz "Testing offset 0x"
testmsg2:
        .asciiz " added to address: 0x"
testmsg3:
        .asciiz " results in 0x"

        .macro testcase address, offset
        .word address
        .byte offset
        .endmacro

testcases:
        testcase $a000, $05
        testcase $a000, $fa
        testcase $a0ff, $05
        testcase $a0ff, $fa
        testcase $1068, $f7
        testcase $1068, $ff
        testcase $1065, $fa
        testcase $8000, $80
        testcase $8087, $80
        testcase $0000, $00
        .byte $ff


