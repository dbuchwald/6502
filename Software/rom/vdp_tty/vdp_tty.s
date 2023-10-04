    .setcpu "65C02"

    .include "lcd.inc"
    .include "blink.inc"
    .include "vdp_text_mode.inc"
    .include "vdp_const.inc"
    .include "vdp_macro.inc"
    ; .include "vdp_game_config.inc"      
    ; .include "vdp_game.inc"
    .include "vdp.inc"
    .include "tty.inc"
    .include "gamepad.inc"

    .include "zeropage.inc"

    .segment "VECTORS"
    .word   $0000
    .word   init
    .word   loop

    .code

init:  
    jsr _lcd_init
    .ifdef TEXT_MODE
    jsr vdp_text_init
    .else
    jsr vdp_init_graphics1_mode
    .endif
    jsr _blink_init

;    jsr vdp_hide_sprites


    ; lda #((VDP_COLOR_MASK_HIGH_NIBBLE & VDP_COLOR_GRAY) | VDP_COLOR_MASK_LOW_NIBBLE & VDP_COLOR_DARK_BLUE)
    ; jsr vdp_fill_color

    ; lda #VDP_COLOR_DARK_BLUE
    ; jsr vdp_set_border_color


    lda #( TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
    jsr _tty_init
    writeln_tty #hello_msg

loop:
    jsr _strobe_led
    bra loop

hello_msg:
    .asciiz "1234567890123456789012345678901234567890"