      .setcpu "65C02"
      .include "tty.inc"
      .include "string.inc"
      .include "utils.inc"
      .include "acia.inc"

LINE_BUFFER_SIZE = 32
TOKENIZE_BUFFER_SIZE = 64

        .code
init:
        ; Display hello messages
        writeln_tty msghello1
        writeln_tty msghello2
        writeln_tty msghello3

main_loop:
        ; Start with prompt
        write_tty prompt

        ; Read line 
        tty_read_line line_buffer, LINE_BUFFER_SIZE

        ; ; Trim the line
        ; strtriml line_buffer
        ; strtrimr line_buffer

        ; If empty - display prompt again
        strlen line_buffer
        cmp #$00
        beq main_loop

        ; Convert to upper case for comparison
        ; strtoupper line_buffer

@compare_cmd_help:
        strcmp line_buffer, cmd_help
        cmp #$00
        bne @compare_cmd_exit
        jsr _display_help_message
        jmp main_loop

@compare_cmd_exit:
        strcmp line_buffer, cmd_exit
        cmp #$00
        bne @tokenize
        jsr _display_exit_message
        rts

@tokenize:
        strtokenize line_buffer, tokenize_buffer, TOKENIZE_BUFFER_SIZE

        tax 
        ; ldy #$00
        lda #<tokenize_buffer
        sta ptr4
        lda #>tokenize_buffer
        sta ptr4+1
@token_loop:
        write_tty token_found
        lda ptr4
        sta ptr1
        lda ptr4+1
        sta ptr1+1
        jsr _tty_write
        writeln_tty token_newline
        dec tmp2
        beq @done_listing_tokens
        ldy #$00
@next_token_loop:
        lda (ptr4),y
        beq @end_of_token
        inc ptr4
        bne @next_token_loop
        inc ptr4+1
        bra @next_token_loop
@end_of_token:
        inc ptr4
        bne @token_loop
        inc ptr4+1
        bra @token_loop
@done_listing_tokens:

@invalid_command:
        writeln_tty msgerror
        writeln_tty msghello3
        jmp main_loop

_display_help_message:
        writeln_tty msghelp1
        writeln_tty msghelp2
        writeln_tty msghelp3
        writeln_tty msghelp4
        writeln_tty msghelp5
        writeln_tty msghelp6
        rts

_display_exit_message:
        writeln_tty msgbye
        rts

        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE

tokenize_buffer:
        .res TOKENIZE_BUFFER_SIZE

        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 monitor application"
msghello2: 
        .asciiz "Try entering simple commands followed by ENTER"
msghello3:
        .asciiz "Currently supported commands are: HELP, EX[AMINE], BLINK and EXIT"
prompt:
        .asciiz "OS/1 Monitor>"
msghelp1:
        .asciiz "HELP - display this message"
msghelp2:
        .asciiz "EX[AMINE] XXXX[:XXXX] - display memory contents"
msghelp3:
        .asciiz "  EX 3f01 - will display 16 bytes starting from $3f01"
msghelp4:
        .asciiz "  EXAMINE a000:a542 - will display all the memory contents between $a000 and $a542"
msghelp5:
        .asciiz "BLINK ON|OFF - turn on/off onboard LED"
msghelp6:
        .asciiz "EXIT - exit the monitor"
msgerror:
        .asciiz "Command not recognized, please try again"
msgbye:
        .asciiz "Thank you for using OS/1 monitor application"
cmd_help:
        .asciiz "HELP"
cmd_ex:
        .asciiz "EX"
cmd_examine:
        .asciiz "EXAMINE"
cmd_blink:
        .asciiz "BLINK"
cmd_exit:
        .asciiz "EXIT"

cmd_blink_on:
        .asciiz "ON"
cmd_blink_off:
        .asciiz "OFF"

token_found:
        .asciiz "Token found: <"
token_newline:
        .asciiz ">"

        .macro menuitem id, cmd, argc, desc, function
        .local start_item
        .local cmd_pos
        .local argc_pos
        .local desc_pos
        .local next_item
start_item:
        .byte cmd_pos - start_item
        .byte argc_pos - start_item
        .byte desc_pos - start_item
        .byte next_item - start_item
cmd_pos:
        .asciiz cmd
argc_pos:
        .byte argc
desc_pos:
        .asciiz desc
next_item:
        .endmacro

        .macro endmenu
        .byte $00
        .endmacro

        .asciiz "here"
menu:
        menuitem help, "HELP", 1, "HELP - display this message", _display_help_message
        menuitem get2, "GET", 2, "GET - get data at the address", _display_exit_message
        menuitem get4, "GET", 4, "GET - get data between addresses", _display_exit_message
        menuitem exit, "EXIT", 1, "EXIT - exit monitor", _display_exit_message
        endmenu 