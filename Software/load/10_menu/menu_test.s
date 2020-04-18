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
        run_menu #menu, #test_prompt
        rts

process_get_2:
        sta tokens_pointer
        stx tokens_pointer+1
        writeln_tty #get2msg
        lda #$02
        sta tmp1
        jsr list_params
        rts

process_get_4:
        sta tokens_pointer
        stx tokens_pointer+1
        writeln_tty #get4msg
        lda #$04
        sta tmp1
        jsr list_params
        rts

process_blink:
        sta tokens_pointer
        stx tokens_pointer+1
        writeln_tty #blinkmsg
        lda #$02
        sta tmp1
        jsr list_params

        strgettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_onoff param_pointer
        bcc blink_error
        cmp #$00
        beq turn_off
        lda #(BLINK_LED_ON)
        jsr _blink_led
        rts
turn_off:
        lda #(BLINK_LED_OFF)
        jsr _blink_led
        rts
blink_error:
        writeln_tty #blinkerror
        rts


process_print:
        sta tokens_pointer
        stx tokens_pointer+1
        writeln_tty #printmsg
        lda #$02
        sta tmp1
        jsr list_params

        strgettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_hex_byte param_pointer
        bcc @error
        jsr convert_to_hex
        txa
        sta printplace
        tya
        sta printplace+1
        
        writeln_tty #printparsed

        rts
@error:
        writeln_tty #blinkerror
        rts

process_addr:
        sta tokens_pointer
        stx tokens_pointer+1
        writeln_tty #addrmsg
        lda #$02
        sta tmp1
        jsr list_params

        strgettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_hex_word param_pointer
        bcc @error
        phx
        jsr convert_to_hex
        txa
        sta addrplace
        tya
        sta addrplace+1
        pla
        jsr convert_to_hex
        txa
        sta addrplace+2
        tya
        sta addrplace+3
        
        writeln_tty #addrparsed

        rts
@error:
        writeln_tty #blinkerror
        rts


process_put:
        writeln_tty #putmsg
        rts

list_params:
        copy_ptr tokens_pointer, ptr2
list_loop:
        write_tty #paramval
        writeln_tty ptr2
next_token_loop:
        inc ptr2
        bne check_for_end
        inc ptr2+1
check_for_end:
        lda (ptr2)
        beq end_found
        bra next_token_loop
end_found:
        inc ptr2
        bne repeat_loop
        inc ptr2+1
repeat_loop:
        dec tmp1
        bne list_loop
        rts


        
        .segment "BSS"
tokens_pointer:
        .res 2
param_pointer:
        .res 2

        .segment "RODATA"

menu:

        menuitem get_cmd, 2, get_2_desc, process_get_2
        menuitem get_cmd, 4, get_4_desc, process_get_4
        menuitem put_cmd, 4, put_desc, process_put
        menuitem blink_cmd, 2, blink_desc, process_blink
        menuitem print_cmd, 2, print_desc, process_print
        menuitem addr_cmd, 2, addr_desc, process_addr
        endmenu 

test_prompt:
        .asciiz "OS/1 Test Menu>"
get2msg:
        .asciiz "Invoked GET with two parameters"
get4msg:
        .asciiz "Invoked GET with four parameters"
putmsg:
        .asciiz "Invoked PUT"
blinkmsg:
        .asciiz "Invoked BLINK"
blinkerror:
        .asciiz "Incorrect parameters passed!"
printmsg:
        .asciiz "Invoked PRINT"
addrmsg:
        .asciiz "Invoked ADDR"
printparsed:
        .byte "Received $"
printplace:
        .asciiz "xx "
addrparsed:
        .byte "Received 0x"
addrplace:
        .asciiz "xxxx "
paramval:
        .asciiz "  Parameter: "
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
blink_cmd:
        .asciiz "BLINK"
blink_desc:
        .asciiz "BLINK on/off - toggle onboard blink LED"
print_cmd:
        .asciiz "PRINT"
print_desc:
        .asciiz "PRINT xx - parse and print back hex numer"
addr_cmd:
        .asciiz "ADDR"
addr_desc:
        .asciiz "ADDR xxxx - parse and print back hex address"