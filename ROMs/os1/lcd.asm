; ---------------------------------------------------------------------------------
; Source file containing LCD control routines
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

; Enables output on VIA1 PORTB
  macro SET_VIA1_PORTB_OUTPUT 
  pha
  lda #%11111111
  sta WDC65C22_VIA1_DDRB
  pla
  endm

; Enables input on VIA1 PORTB
  macro SET_VIA1_PORTB_INPUT
  lda #%00000000
  sta WDC65C22_VIA1_DDRB
  endm

hd44780_lcd_init:
; Set VIA1 PORTA according to assumed HD44780 port mapping
  lda #HD44780_PORT_DDR_MASK
  sta WDC65C22_VIA1_DDRA
; Set VIA1 PORTB to full output (this is where data and commands go in 8-bit mode)
  lda #%11111111
  sta WDC65C22_VIA1_DDRB

; Initialize both port outputs with '0'
  lda #%00000000
  sta WDC65C22_VIA1_PORTA
  sta WDC65C22_VIA1_PORTB

; Initialize counter with 0
  ldx #$00

hd44780_lcd_init_loop:
; Read next byte of init sequence data
  lda hd44780_init_sequence_data,x
; Exit loop if $00 read
  beq hd44780_lcd_init_end
; Write command to LCD controller
  jsr hd44780_write_command
; Increase index
  inx
; Keep looping
  bra hd44780_lcd_init_loop
hd44780_lcd_init_end:
  rts

; Assumes command set in A register, will overwrite it!
hd44780_write_command:
; Set PORTB to output mode
  SET_VIA1_PORTB_OUTPUT
; Sends command from A register to VIA1 PORTB
  sta WDC65C22_VIA1_PORTB
  lda #(HD44780_MODE_COMMAND | HD44780_WRITE_MODE | HD44780_PULSE)
  jsr hd44780_pulse
  rts

; Stores current status in A register
hd44780_read_status:
; Set PORTB to input mode
  SET_VIA1_PORTB_INPUT
  lda #(HD44780_MODE_COMMAND | HD44780_READ_MODE | HD44780_PULSE)
  jsr hd44780_pulse

hd44780_write_data:
; Set PORTB to output mode
  SET_VIA1_PORTB_OUTPUT
; Send data to VIA1 PORTB
  sta WDC65C22_VIA1_PORTB
  lda #(HD44780_MODE_DATA | HD44780_WRITE_MODE | HD44780_PULSE)
  jsr hd44780_pulse
  rts

; Assumes A contains HD44780 control bits, modifies them!
hd44780_pulse:
  sta WDC65C22_VIA1_PORTA
  and #HD44780_PULSE_DISABLE_MASK
  sta WDC65C22_VIA1_PORTA
  rts

hd44780_init_sequence_data:
  byte HD44780_CMD_FUNCTION_SET | HD44780_FS_FONT5x7 | HD44780_FS_TWO_LINE | HD44780_FS_8_BIT
  byte HD44780_CMD_DISPLAY_MODE | HD44780_DM_DISPLAY_ON | HD44780_DM_CURSOR_OFF | HD44780_DM_CURSOR_NOBLINK
  byte HD44780_CMD_ENTRY_MODE | HD44780_EM_SHIFT_CURSOR | HD44780_EM_INCREMENT
  byte HD44780_CMD_CLEAR
  byte $00