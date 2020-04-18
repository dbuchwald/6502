        .setcpu "65C02"
        .include "tty.inc"
        .include "menu.inc"
        .include "utils.inc"
        .include "string.inc"
        .include "blink.inc"
        .include "parse.inc"
        .include "macros.inc"

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
        beq tc_exit
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
tc_exit:
        copy_ptr #ptrtestcases, tc_ptr
ptr_loop:
        copy_ptr tc_ptr, ptr1
        lda (ptr1)
        sta base_ptr
        sta base_ptr2
        inc_ptr ptr1
        lda (ptr1)
        sta base_ptr+1
        sta base_ptr2+1
        inc_ptr ptr1
        lda (ptr1)
        bne ptr_cont
        jmp ptr_exit
ptr_cont:
        sta offset
        inc_ptr ptr1

        copy_ptr ptr1, tc_ptr

        write_tty #incptrmsg
        lda offset
        write_tty_hex
        write_tty #ptrmsg1
        write_tty_address base_ptr
        lda offset
        cmp #$01
        beq inc_no_param
        inc_ptr base_ptr, offset
        bra inc_done
inc_no_param:
        inc_ptr base_ptr
inc_done:
        write_tty #ptrmsg2
        write_tty_address base_ptr
        jsr _tty_send_newline

        write_tty #decptrmsg
        lda offset
        write_tty_hex
        write_tty #ptrmsg1
        write_tty_address base_ptr2
        lda offset
        cmp #$01
        beq dec_no_param
        dec_ptr base_ptr2, offset
        bra dec_done
dec_no_param:
        dec_ptr base_ptr2
dec_done:
        write_tty #ptrmsg2
        write_tty_address base_ptr2
        jsr _tty_send_newline
        jmp ptr_loop
ptr_exit:
        rts

        .segment "BSS"
tc_ptr:
        .res 2
base_ptr:
        .res 2
base_ptr2:
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

incptrmsg:
        .asciiz "Adding "
decptrmsg:
        .asciiz "Subtracting "
ptrmsg1:
        .asciiz " to address 0x"
ptrmsg2:
        .asciiz " results in address 0x"

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

ptrtestcases:
        testcase $a000, $05
        testcase $a0ff, $05
        testcase $a000, $01
        testcase $a0ff, $01
        testcase $a0fd, $15
        testcase $a080, $85
        testcase $a0fd, $01
        testcase $a080, $01
        testcase $0000, $00
        .byte $ff


