        .setcpu "65C02"
        .include "tty.inc"
        .include "menu.inc"
        .include "utils.inc"
        .include "string.inc"
        .include "blink.inc"

        .macro gettoken token_buffer_pointer, number
        .local token_loop
        .local char_loop
        .local exit
        lda #(number)
        sta tmp1
        copy_ptr token_buffer_pointer, ptr1
        ldy #$00
token_loop:
        lda tmp1
        beq exit
char_loop:
        inc_ptr ptr1
        lda (ptr1),y
        bne char_loop
        inc_ptr ptr1
        dec tmp1
        bra token_loop
exit:
        .endmacro

        .code
init:
        run_menu menu, test_prompt
        rts

process_get_2:
        copy_ptr ptr1, tokens_pointer
        writeln_tty get2msg
        lda #$02
        sta tmp1
        jsr list_params
        rts

process_get_4:
        copy_ptr ptr1, tokens_pointer
        writeln_tty get4msg
        lda #$04
        sta tmp1
        jsr list_params
        rts

process_blink:
        copy_ptr ptr1, tokens_pointer
        writeln_tty get4msg
        lda #$02
        sta tmp1
        jsr list_params

        gettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer
        strtoupperp param_pointer
        strcmpp blinkon_ptr, param_pointer
        cmp #$00
        bne not_on
        sec
        jsr _blink_led
        rts
not_on:
        strcmpp blinkoff_ptr, param_pointer
        cmp #$00
        bne error
        clc
        jsr _blink_led
        rts
error:
        writeln_tty blinkerror
        rts


process_put:
        writeln_tty putmsg
        rts

list_params:
        copy_ptr tokens_pointer, ptr2
        ldy #$00
list_loop:
        write_tty paramval
        writeln_tty_p ptr2
next_token_loop:
        inc ptr2
        bne check_for_end
        inc ptr2+1
check_for_end:
        lda (ptr2),y
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
paramval:
        .asciiz "  Parameter: "
blinkon:
        .asciiz "ON"
blinkoff:
        .asciiz "OFF"
blinkon_ptr:
        .word blinkon
blinkoff_ptr:
        .word blinkoff
