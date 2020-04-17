        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "menu.inc"
        .include "lcd.inc"

        .code
init:
        jsr _lcd_clear

        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL | TTY_CONFIG_OUTPUT_LCD)
;        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL)
        jsr _tty_init
        ; Display hello messages
        writeln_tty #msghello1

        run_menu #menu, #simpleprompt

        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL)
        jsr _tty_init

        jsr _lcd_clear
        rts        

_display_load_message:
        writeln_tty #msgload
        rts

        .segment "RODATA"
msghello1: 
        .asciiz "OS/1 Mini Shell"
msgload:
        .asciiz "Loading now..."
simpleprompt:
        .asciiz "OS/1 MS>"
menu:
        menuitem load_cmd, 1, load_desc, _display_load_message
        endmenu 
load_cmd:
        .asciiz "LOAD"
load_desc:
        .asciiz "LOAD - load program"