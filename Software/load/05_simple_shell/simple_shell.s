        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "menu.inc"

        .code
init:
        ; Display hello messages
        writeln_tty #msghello1
        writeln_tty #msghello2
        writeln_tty #msghello3
        run_menu #menu, #simpleprompt
        rts        

_display_load_message:
        writeln_tty #msgload
        rts

        .segment "RODATA"
msghello1: 
        .asciiz "Welcome to OS/1 simple shell"
msghello2: 
        .asciiz "Try entering simple commands followed by ENTER"
msghello3:
        .asciiz "Currently supported commands are: HELP, LOAD and EXIT"
msgload:
        .asciiz "Pretending to load program now"
simpleprompt:
        .asciiz "OS/1 Simple Shell>"
menu:
        menuitem load, "LOAD", 1, "LOAD - pretend to load program", _display_load_message
        endmenu 
