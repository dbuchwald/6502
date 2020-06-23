        .include "zeropage.inc"
        .include "utils.inc"
        .include "sys_const.inc"
        .include "sysram_map.inc"
        .include "macros.inc"

        .export _lcd_print
        .export _lcd_print_char
        .export _lcd_clear
        .export lcd_get_position
        .export _lcd_get_position
        .export lcd_set_position
        .export _lcd_set_position
        .export _lcd_backspace
        .export _lcd_newline
        .export _lcd_display_mode
        .export _lcd_scroll_up
        .export _lcd_scroll_down
        .export _lcd_define_char
        .export lcd_define_char

        .export LCD_DM_CURSOR_NOBLINK
        .export LCD_DM_CURSOR_BLINK
        .export LCD_DM_CURSOR_OFF
        .export LCD_DM_CURSOR_ON
        .export LCD_DM_DISPLAY_OFF
        .export LCD_DM_DISPLAY_ON

        .import lcd_read_byte
        .import lcd_write_byte

; LCD Commands list
LCD_CMD_CLEAR           = %00000001
LCD_CMD_HOME            = %00000010
LCD_CMD_ENTRY_MODE      = %00000100
LCD_CMD_DISPLAY_MODE    = %00001000
LCD_CMD_CURSOR_SHIFT    = %00010000
LCD_CMD_FUNCTION_SET    = %00100000
LCD_CMD_CGRAM_SET       = %01000000
LCD_CMD_DDRAM_SET       = %10000000

; Entry mode command parameters
LCD_EM_SHIFT_CURSOR     = %00000000
LCD_EM_SHIFT_DISPLAY    = %00000001
LCD_EM_DECREMENT        = %00000000
LCD_EM_INCREMENT        = %00000010

; Display mode command parameters
LCD_DM_CURSOR_NOBLINK   = %00000000
LCD_DM_CURSOR_BLINK     = %00000001
LCD_DM_CURSOR_OFF       = %00000000
LCD_DM_CURSOR_ON        = %00000010
LCD_DM_DISPLAY_OFF      = %00000000
LCD_DM_DISPLAY_ON       = %00000100

; Function set command parameters
LCD_FS_FONT5x7          = %00000000
LCD_FS_FONT5x10         = %00000100
LCD_FS_ONE_LINE         = %00000000
LCD_FS_TWO_LINE         = %00001000
LCD_FS_4_BIT            = %00000000
LCD_FS_8_BIT            = %00010000

LCD_SCROLL_DELAY_MS     = 150

CHAR_DEFINE_MASK        = %00000111

        .code

; POSITIVE C COMPLIANT
_lcd_print:
        sta ptr1
        stx ptr1+1
        ; store registers A and Y
        phy
        ldy #$00
@lcd_print_loop:
        ; Read next byte of init sequence data
        lda (ptr1),y
        ; Exit loop if $00 read
        beq @lcd_print_end
        ; Set carry for data operation
        sec
        jsr lcd_write_byte
        iny
        ; Wrap the line if needed
        jsr lcd_wrap_line
        ; lda #100
        ; jsr _delay_ms

        ; Next character
        bra @lcd_print_loop
@lcd_print_end:
        ply
        rts

; POSITIVE C COMPLIANT
_lcd_print_char:
        ; store register A
        pha
        ; Set carry for data operation
        sec
        jsr lcd_write_byte
        ; Wrap the line if needed
        jsr lcd_wrap_line

@lcd_print_char_end:
        pla
        rts

; POSITIVE C COMPLIANT
; _lcd_clear - clear screen
; no parameters
; internal variables
; none
_lcd_clear:
        pha
        lda #(LCD_CMD_CLEAR)
        clc
        jsr lcd_write_byte
        pla
        rts 

; C wrapper for lcd_get_position function
; stores result using provided pointers
; X - on stack, Y - using A/X
_lcd_get_position:
        sta ptr1
        stx ptr1+1
        ldy #$01
        lda (sp),y
        sta ptr2+1
        dey
        lda (sp),y
        sta ptr2
        jsr lcd_get_position
        tya
        sta (ptr1)
        txa
        sta (ptr2)
        ; retrieve data from the stack
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - return values in X, Y
; lcd_get_position - returns current cursor location
; in X,Y registers
; Internal variables - none
lcd_get_position:
        pha
        ; read current position from LCD
        clc
        jsr lcd_read_byte
        cmp #(LCD_COLUMNS)
        bcc @first_row
        cmp #$40
        bcc @third_row
        cmp #($40+LCD_COLUMNS)
        bcc @second_row
        bra @fourth_row
@first_row:
        ldy #$00
        tax
        bra @exit
@second_row:
        ldy #$01
        sec
        sbc #$40
        tax
        bra @exit
@third_row:
        ldy #$02
        sec
        sbc #(LCD_COLUMNS)
        tax
        bra @exit
@fourth_row:
        ldy #$03
        sec
        sbc #($40+LCD_COLUMNS)
        tax
@exit:
        pla
        rts

; C wrapper for lcd_set_position operation
; Y is passed in A, X on stack
_lcd_set_position:
        tay
        lda (sp)
        tax
        jsr lcd_set_position
        inc_ptr sp
        rts 

; NEGATIVE C COMPLIANT - input values in X, Y
; lcd_set_position - moves cursor to position on a screen
; Assumes position in X,Y registers
; Internal variables - none
; Return value - none
lcd_set_position:
        pha
        txa
        clc
        adc lcd_mapping_coordinates,y
        clc
        ora #(LCD_CMD_DDRAM_SET)
        clc
        jsr lcd_write_byte
        pla
        rts

; POSITIVE C COMPLIANT
; _lcd_backspace - back up one char
; no params, no results
_lcd_backspace:
        pha
        phx
        phy
        ; get current position
        jsr lcd_get_position
        ; Check if X equals 0 (backward line wrap required then)
        cpx #$00
        bne @same_line
        ; Check if corner (y equals 0) and do nothing then
        cpy #$00
        beq @exit
        ; Otherwise, set to last char of previous column
        dey
        ldx #(LCD_COLUMNS-1)
        bra @clear
@same_line:
        dex
@clear:
        jsr lcd_set_position
        lda #(' ')
        jsr _lcd_print_char
        jsr lcd_set_position
@exit:
        ply
        plx
        pla
        rts

; POSITIVE C COMPLIANT
; _lcd_newline - advance to beginning of next line
_lcd_newline:
        phx
        phy
        ; get current position
        jsr lcd_get_position
        ; set X to 0
        ldx #$00
        ; compare Y against 3 - if last row, we need to scroll up
        cpy #$03
        bcc @next_line
        jsr _lcd_scroll_up
        bra @set_new_position
@next_line:
        iny
@set_new_position:
        jsr lcd_set_position
        ply
        plx
        rts

; POSITIVE C COMPLIANT
; _lcd_display_mode - set the display mode
; Assumes mode passed in A register
; Internal variables - none
_lcd_display_mode:
        pha
        ora #(LCD_CMD_DISPLAY_MODE)
        clc
        jsr lcd_write_byte
        pla
        rts

; POSITIVE C COMPLIANT
; _lcd_scroll_up - scroll LCD contents up
; No input/output params
; Internal variables - only local
_lcd_scroll_up:
        phy
        phx
        jsr lcd_get_position
        phx
        phy
        ; start with source line 1
        ldy #01
@line_loop_up:
        ; copy line contents to buffer
        jsr lcd_copy_line_to_buffer
        ; set target position (-1 line)
        dey
        ; paste contents from buffer
        jsr lcd_paste_line_from_buffer
        ; move to next line
        ; we need to add 2 because of the decrease before paste
        iny
        iny
        ; repeat until last line copied
        cpy #(LCD_ROWS)
        bne @line_loop_up
        ; clear last row
        dey
        jsr lcd_clear_line
        ply
        cpy #$00
        beq @first_row
        dey
@first_row:
        plx
        jsr lcd_set_position
        plx
        ply
        rts

; POSITIVE C COMPLIANT
; _lcd_scroll_down - scroll LCD contents down
; No input/output params
; Internal variables - only local
_lcd_scroll_down:
        phy
        phx
        jsr lcd_get_position
        phx
        phy
        ; start with source line (last - 1)
        ldy #(LCD_ROWS-2)
@line_loop_down:
        ; copy line contents to buffer
        jsr lcd_copy_line_to_buffer
        ; set target position (+1 line)
        iny
        ; paste contents from buffer
        jsr lcd_paste_line_from_buffer
        ; move to next line
        ; we need to dec 2 because of the increase before paste
        dey
        dey
        ; repeat until last line copied
        bpl @line_loop_down
        ; clear first row
        iny
        jsr lcd_clear_line
        ply
        cpy #(LCD_ROWS-1)
        beq @last_row
        iny
@last_row:
        plx
        jsr lcd_set_position
        plx
        ply
        rts

; C wrapper for lcd_define_char operation
; charcode on stack
; mapping table in A/X
_lcd_define_char:
        sta ptr1
        stx ptr1+1
        lda (sp)
        jsr lcd_define_char
        inc_ptr sp
        rts

; NEGATIVE C COMPLIANT
; lcd_define_char
; A contains charcode ($00-$07)
; ptr1 contains address of the first byte in char map
lcd_define_char:
        ; ensure proper input value
        and #(CHAR_DEFINE_MASK)
        ; move charcode to bits 3-5
        asl
        asl
        asl
        ; add flag to CGRAM command
        ora #(LCD_CMD_CGRAM_SET)
        ; command operation (set CGRAM address)
        clc
        jsr lcd_write_byte
        ldy #$00
@send_chardef_line_loop:
        ; load byte from character definition table
        lda (ptr1),y
        ; send data to CGRAM
        sec
        jsr lcd_write_byte
        iny
        cpy #$08
        bne @send_chardef_line_loop
        rts

; INTERNAL
; Checks if line break occured after last data write
; Assumes result of last write in A
lcd_wrap_line:
        pha
        phx
        ; read current position
        clc
        jsr lcd_read_byte
        ; iterate over table and compare
        ldx #$00
@lcd_wrap_loop:
        ; read margin values and compare against current position
        cmp lcd_wordwrap_sources,x
        beq @lcd_wrap_found
        ; try next one
        inx
        cpx #(LCD_ROWS)
        beq @lcd_wrap_not_found
        ; repeat
        bra @lcd_wrap_loop
@lcd_wrap_found:
        ; if found, check if this is last row (means we got to the end of the screen)
        cpx #(LCD_ROWS-1)
        bne @lcd_wrap_screen_not_full
        ; it is last row - scroll the screen up
        lda #(LCD_SCROLL_DELAY_MS)
        jsr _delay_ms
        jsr _lcd_scroll_up
        ; X contains line number, move cursor to the beginning of this line
        lda lcd_mapping_coordinates,x
        bra @lcd_wrap_send_new_position
@lcd_wrap_screen_not_full:
        ; use targets mapping to find byte to move to
        lda lcd_wordwrap_targets,x
@lcd_wrap_send_new_position:
        ; send cursor position operation
        ora #(LCD_CMD_DDRAM_SET)
        clc
        jsr lcd_write_byte
@lcd_wrap_not_found:
        plx
        pla
        rts

; INTERNAL
; lcd_copy_line_to_buffer - copies single LCD line to buffer
; Assumes line number in Y
lcd_copy_line_to_buffer:
        pha
        phx
        ; set position to start of the line
        ldx #00
        jsr lcd_set_position
        ; read byte from LCD DDRAM
@char_read_loop:
        sec
        jsr lcd_read_byte
        ; store in temporary memory area
        sta lcd_line_buffer,x
        inx 
        ; repeat for all columns
        cpx #(LCD_COLUMNS)
        bne @char_read_loop
        plx
        pla
        rts

; INTERNAL
; lcd_paste_line_from_buffer - pastes buffer contents to LCD
; Assumes line number in Y
lcd_paste_line_from_buffer:
        pha
        phx
        ldx #$00
        jsr lcd_set_position
@char_write_loop:
        lda lcd_line_buffer,x
        sec
        jsr lcd_write_byte
        inx
        ; repeat for all columns
        cpx #(LCD_COLUMNS)
        bne @char_write_loop
        plx
        pla
        rts

; INTERNAL
; lcd_clear_line - fills given line with spaces
; Assumes line number in Y
lcd_clear_line:
        pha
        phx
        ldx #00
        jsr lcd_set_position
@erase_loop:
        lda #(' ')
        sec
        jsr lcd_write_byte
        inx
        ; repeat for all columns 
        cpx #(LCD_COLUMNS)
        bne @erase_loop
        plx
        pla
        rts

        .SEGMENT "RODATA"

lcd_mapping_coordinates:
        .byte 00
        .byte $40
        .byte LCD_COLUMNS
        .byte $40 + LCD_COLUMNS

lcd_wordwrap_sources:
        .byte LCD_COLUMNS
        .byte $40 + LCD_COLUMNS
        .byte $40
        .byte 00

lcd_wordwrap_targets:
        .byte $40
        .byte LCD_COLUMNS
        .byte $40 + LCD_COLUMNS
        .byte 00