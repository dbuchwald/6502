        .setcpu "65C02"
        .include "tty.inc"
        .include "menu.inc"
        .include "utils.inc"
        .include "string.inc"
        .include "blink.inc"
        .include "parse.inc"

        .code
init:
        run_menu #menu, #test_prompt
        rts

process_get_2:
        copy_ptr ptr1, tokens_pointer
        writeln_tty #get2msg
        lda #$02
        sta tmp1
        jsr list_params
        rts

process_get_4:
        copy_ptr ptr1, tokens_pointer
        writeln_tty #get4msg
        lda #$04
        sta tmp1
        jsr list_params
        rts

process_blink:
        copy_ptr ptr1, tokens_pointer
        writeln_tty #blinkmsg
        lda #$02
        sta tmp1
        jsr list_params

        gettoken tokens_pointer, 1
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
        copy_ptr ptr1, tokens_pointer
        writeln_tty #printmsg
        lda #$02
        sta tmp1
        jsr list_params

        gettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_hex_byte param_pointer
        bcc @error
        jsr _convert_to_hex
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
        copy_ptr ptr1, tokens_pointer
        writeln_tty #addrmsg
        lda #$02
        sta tmp1
        jsr list_params

        gettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_hex_word param_pointer
        bcc @error
        phx
        jsr _convert_to_hex
        txa
        sta addrplace
        tya
        sta addrplace+1
        pla
        jsr _convert_to_hex
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
        menuitem get2, "GET", 2, "GET xxxx - get data at the address", process_get_2
        menuitem get4, "GET", 4, "GET xxxx:yyyy - get data between addresses", process_get_4
        menuitem put, "PUT", 1, "PUT - put data at the address", process_put
        menuitem blink, "BLINK", 2, "BLINK on/off - toggle onboard blink LED", process_blink
        menuitem print, "PRINT", 2, "PRINT xx - parse and print back hex numer", process_print
        menuitem print, "ADDR", 2, "ADDR xxxx - parse and print back hex address", process_addr
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

