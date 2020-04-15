        .include "zeropage.inc"
        .import _lcd_init
        .import _lcd_print
        .import _lcd_print_char
        .import _lcd_clear
        .import _lcd_get_position
        .import lcd_get_position
        .import _lcd_set_position
        .import lcd_set_position
        .import _lcd_backspace
        .import _lcd_newline
        .import _lcd_display_mode
        .import _lcd_scroll_up
        .import _lcd_scroll_down
        .import _lcd_define_char
        .import lcd_define_char

; Display mode command parameters
LCD_DM_CURSOR_NOBLINK   = %00000000
LCD_DM_CURSOR_BLINK     = %00000001
LCD_DM_CURSOR_OFF       = %00000000
LCD_DM_CURSOR_ON        = %00000010
LCD_DM_DISPLAY_OFF      = %00000000
LCD_DM_DISPLAY_ON       = %00000100  

        .macro write_lcd string
        pha
        phx
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            ldx #>(.right (.tcount ({string})-1, {string}))
        .else
            ; assume absolute or zero page
            lda string
            ldx 1+(string)
        .endif
        jsr _lcd_print
        plx
        pla
        .endmacro

        .macro lcd_define_char code, char_map
        pha
        .if (.match (.left (1, {char_map}), #))
            ; immediate mode
            lda #<(.right (.tcount ({char_map})-1, {char_map}))
            sta ptr1
            lda #>(.right (.tcount ({char_map})-1, {char_map}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda string
            sta ptr1
            lda 1+(string)
            sta ptr1+1
        .endif
        lda #(code)
        jsr lcd_define_char
        pla
        .endmacro