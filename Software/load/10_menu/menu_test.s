        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "acia.inc"
        .include "menu.inc"
        .include "debug.inc"

        .code
init:
        lda #<menu
        sta menu_item
        lda #>menu
        sta menu_item+1

main_loop:
        ; writeln_tty_address menu_item

        is_last_menu_item menu_item
        bcc display_item
        jmp done_listing
display_item:
        get_menu_item menu_item, menu_item_cmd, menu_item_argc, menu_item_desc

        ; writeln_tty_address menu_item_cmd
        ; writeln_tty_address menu_item_argc
        ; writeln_tty_address menu_item_desc
        
        writeln_tty msgh
        write_tty msgc
        writeln_tty_p menu_item_cmd
        write_tty msga
        ; writeln_tty msgh
        lda menu_item_argc
        write_tty_hex 
        writeln_tty empty

        write_tty msgd
        writeln_tty_p menu_item_desc

        get_next_menu_item menu_item
        jmp main_loop
done_listing:
        rts

        .segment "BSS"
menu_item:
        .res 2
menu_item_cmd:
        .res 2
menu_item_argc:
        .res 1
menu_item_desc:
        .res 2

        .segment "RODATA"
msgh:   .asciiz "Menu item found"
msgc:   .asciiz "  command: "
msga:   .asciiz "  argc: "
msgd:   .asciiz "  description: "

empty:  .asciiz "" 

menu:
        menuitem help, "HELP", 1, "HELP - display this message", _display_help_message
        menuitem get2, "GET", 2, "GET - get data at the address", _display_exit_message
        menuitem get4, "GET", 4, "GET - get data between addresses", _display_exit_message
        menuitem exit, "EXIT", 1, "EXIT - exit monitor", _display_exit_message
        endmenu 
