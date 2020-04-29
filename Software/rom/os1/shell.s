        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"
        .include "lcd.inc"
        .include "modem.inc"
        .include "blink.inc"
        .include "core.inc"
        .include "menu.inc"
        .include "parse.inc"
        .include "macros.inc"

        .export _run_shell
        .import os1_version
        .import _run_monitor

        .code
_run_shell:
        lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL)
        jsr _tty_init

        ; Display banner
        writeln_tty #msgemptyline
        writeln_tty #bannerh1
        writeln_tty #bannerh2
        writeln_tty #banner1
        writeln_tty #banner2
        writeln_tty #banner3
        writeln_tty #banner4
        writeln_tty #banner5
        writeln_tty #bannerh2
        writeln_tty #bannerh1
        writeln_tty #msgemptyline

        ; Display hello messages
        write_tty #os1_version
        writeln_tty #msghello1
        writeln_tty #msghello2
        writeln_tty #msghello3

        register_system_break #system_break_handler

main_loop:
        run_menu #menu, #os1prompt
        rts

_process_load:
        writeln_tty #msgload
@receive_file:
        jsr _modem_receive
        cmp #(MODEM_RECEIVE_FAILED)
        beq @receive_file
        rts

_process_run:
        writeln_tty #msgrun
        jsr $1000
        rts

_process_blink:
        sta tokens_pointer
        stx tokens_pointer+1

        strgettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer

        parse_onoff param_pointer
        bcc @error
        cmp #$00
        beq @turn_off
        lda #(BLINK_LED_ON)
        jsr _blink_led
        rts
@turn_off:
        lda #(BLINK_LED_OFF)
        jsr _blink_led
        rts
@error:
        writeln_tty #blinkerror
        rts

_process_monitor:
        writeln_tty #msgmonitor
        jsr _run_monitor
        rts

system_break_handler:
        writeln_tty #msgemptyline
        writeln_tty #msgemptyline
        writeln_tty #msgemptyline
        writeln_tty #msgsystembreak
        jsr _strobe_led
        jmp main_loop

        .segment "BSS"
tokens_pointer:
        .res 2
param_pointer:
        .res 2

        .segment "RODATA"
bannerh1:
        .asciiz "+---------------------------+"
bannerh2:
        .asciiz "|                           |"
banner1:
        .asciiz "|   ####   ####     #   #   |"
banner2:
        .asciiz "|  ##  ## ##       #   ##   |"
banner3:
        .asciiz "|  #    #  ###    #   # #   |"
banner4:
        .asciiz "|  ##  ##    ##  #      #   |"
banner5:
        .asciiz "|   ####  ####  #      ###  |"
msghello1: 
        .asciiz " (Alpha+C)"
msghello2: 
        .asciiz "Welcome to OS/1 shell for DB6502 computer"
msghello3:
        .asciiz "Enter HELP to get list of possible commands"
msgload:
        .asciiz "Initiating load operation..."
msgrun:
        .asciiz "Running program..."
msgmonitor:
        .asciiz "Running monitor application..."
os1prompt:
        .asciiz "OS/1>"
msgemptyline:
        .byte $00
blinkerror:
        .asciiz "Incorrect parameters passed"
msgsystembreak:
        .asciiz "System break initiated, returning to shell..."
menu:
        menuitem load_cmd,    1, load_desc,    _process_load
        menuitem run_cmd,     1, run_desc,     _process_run
        menuitem monitor_cmd, 1, monitor_desc, _process_monitor
        menuitem blink_cmd,   2, blink_desc,   _process_blink
        endmenu 

load_cmd:
        .asciiz "LOAD"
load_desc:
        .asciiz "LOAD - load application using XMODEM/CRC protocol"
run_cmd:
        .asciiz "RUN"
run_desc:
        .asciiz "RUN - execute loaded application"
monitor_cmd:
        .asciiz "MONITOR"
monitor_desc:
        .asciiz "MONITOR - run embedded monitor application"
blink_cmd:
        .asciiz "BLINK"
blink_desc:
        .asciiz "BLINK on/off - toggle onboard blink LED"