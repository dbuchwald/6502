      .include "via.inc"
      .include "zeropage.inc"
      .include "utils.inc"
      .export _lcd_init
      .export _lcd_print

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

      .code

_lcd_init:
      ; store registers A and X
      pha
      phx
      ; VIA1 PORTB - all output
      lda #%11111111
      sta VIA1_DDRB
      ; clear output (all zeros)
      stz VIA1_PORTB
      ; initialize index
      ldx #$00
lcd_init_loop:
      ; Read next byte of init sequence data
      lda lcd_init_sequence_data,x
      ; Exit loop if $00 read
      beq lcd_init_end
      ; Store current value, we will need it for another 4bits
      pha
      ; Most significant bits first
      ; Apply mask
      and #%11110000
      ; Set write command flags
      ora #%00001000
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #%00001000
      sta VIA1_PORTB
      ; Follow the same process with least significant bits
      pla
      and #%00001111
      rol
      rol
      rol
      rol
      ; Set write command flags
      ora #%00001000
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #%00001000
      sta VIA1_PORTB
      inx
      lda lcd_init_sequence_data,x
      jsr _delay_ms
      inx
      bra lcd_init_loop
lcd_init_end:
      plx
      pla
      rts

_lcd_print:
      ; store registers A and Y
      pha
      phy
      ; VIA1 PORTB - all output
      lda #%11111111
      sta VIA1_DDRB
      ; clear output (all zeros)
      stz VIA1_PORTB
      ; initialize index
      ldy #$00
lcd_print_loop:
      ; Read next byte of init sequence data
      lda (lcd_out_ptr),y
      ; Exit loop if $00 read
      beq lcd_print_end
      ; Store current value, we will need it for another 4bits
      pha
      ; Most significant bits first
      ; Apply mask
      and #%11110000
      ; Set write data flags
      ora #%00001010
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #%00001000
      sta VIA1_PORTB
      ; Follow the same process with least significant bits
      pla
      and #%00001111
      rol
      rol
      rol
      rol
      ; Set write data flags
      ora #%00001010
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #%00001000
      sta VIA1_PORTB
      iny
      lda #01
      jsr _delay_ms
      bra lcd_print_loop
lcd_print_end:
      ply
      pla
      rts

      .SEGMENT "RODATA"

lcd_init_sequence_data:
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_FONT5x7 | LCD_FS_TWO_LINE | LCD_FS_4_BIT
      .byte 50
      .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
      .byte 5
      .byte LCD_CMD_ENTRY_MODE | LCD_EM_SHIFT_CURSOR | LCD_EM_INCREMENT
      .byte 5
      .byte LCD_CMD_CLEAR
      .byte 5
      .byte $00
