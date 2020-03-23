      .include "zeropage.inc"
      .import _lcd_init
      .import _lcd_print
      .import _lcd_print_char
      .import _lcd_clear
      .import _lcd_set_position
      .import _lcd_display_mode
      .import _lcd_scroll_up
      .import _lcd_scroll_down

; Display mode command parameters
LCD_DM_CURSOR_NOBLINK   = %00000000
LCD_DM_CURSOR_BLINK     = %00000001
LCD_DM_CURSOR_OFF       = %00000000
LCD_DM_CURSOR_ON        = %00000010
LCD_DM_DISPLAY_OFF      = %00000000
LCD_DM_DISPLAY_ON       = %00000100  

      .macro write_lcd string_address
      pha
      lda #<string_address
      sta lcd_out_ptr
      lda #>string_address
      sta lcd_out_ptr+1
      jsr _lcd_print
      pla
      .endmacro