      .include "via.inc"
      .include "zeropage.inc"
      .include "utils.inc"
      .export _lcd_init
      .export _lcd_print
      .export _lcd_print_char
      .export _lcd_clear
      .export _lcd_set_position

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

; Control bits for the LCD
LCD_COMMAND_MODE        = %00000000
LCD_DATA_MODE           = %00000010
LCD_WRITE_MODE          = %00000000
LCD_READ_MODE           = %00000100
LCD_ENABLE_FLAG         = %00001000

      .code

_lcd_init:
      ; store registers A and X
      pha
      phx
      ; Initialize DDRB
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB
      ; Initialization by instruction
      ldx #$00
@lcd_force_reset_loop:
      lda lcd_force_reset_sequence,x
      jsr _delay_ms
      inx
      ; Read next byte of force reset sequence data
      lda lcd_force_reset_sequence,x
      ; Exit loop if $00 read
      beq @lcd_force_reset_end

      lda VIA1_PORTB
      and #%00000001
      ora lcd_force_reset_sequence, x
      sta VIA1_PORTB
      ora #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      eor #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB

      inx 
      bra @lcd_force_reset_loop

@lcd_force_reset_end:
      ; initialize index
      ldx #$00

@lcd_init_loop:
      ; Perform actual init operation
      lda lcd_init_sequence_data,x
      beq @lcd_init_end
      ; Clear carry for command operation
      clc 
      jsr lcd_write_byte
      ; Wait for busy flag clear
      jsr lcd_wait_bf_clear

      inx
      bra @lcd_init_loop
@lcd_init_end:
      plx
      pla
      rts

_lcd_print:
      ; store registers A and Y
      pha
      phy
      ldy #$00
@lcd_print_loop:
      ; Read next byte of init sequence data
      lda (lcd_out_ptr),y
      ; Exit loop if $00 read
      beq @lcd_print_end
      ; Set carry for data operation
      sec
      jsr lcd_write_byte
      iny

      ; Wait for BF clear
      jsr lcd_wait_bf_clear
      ; Wrap the line if needed
      jsr lcd_wrap_line

      ; Next character
      bra @lcd_print_loop
@lcd_print_end:
      ply
      pla
      rts

_lcd_print_char:
      ; store register A
      pha
      ; Set carry for data operation
      sec
      jsr lcd_write_byte

      ; Wait for BF clear
      jsr lcd_wait_bf_clear
      ; Wrap the line if needed
      jsr lcd_wrap_line

@lcd_print_char_end:
      pla
      rts

; _lcd_clear - clear screen
; no parameters
; internal variables
; none
_lcd_clear:
      pha
      lda #(LCD_CMD_CLEAR)
      clc
      jsr lcd_write_byte
      jsr lcd_wait_bf_clear
      pla
      rts 

; _lcd_set_position - moves cursor to position on a screen
; Assumes position in X,Y registers
; Internal variables - none
; Return value - none
_lcd_set_position:
      pha
      txa
      clc
      adc lcd_mapping_coordinates,y
      clc
      ora #(LCD_CMD_DDRAM_SET)
      clc
      jsr lcd_write_byte
      jsr lcd_wait_bf_clear
      pla
      rts

; lcd_write_byte - send one byte to LCD
; byte in A
; carry clear - command
; carry set - data
; internal variables
; tmp1 - buffer for mode and blink flag
; tmp2 - buffer for data
lcd_write_byte:
      sta tmp2
      bcs @lcd_write_data
      ; Set flags
      lda #(LCD_WRITE_MODE | LCD_COMMAND_MODE)
      sta tmp1
      bra @lcd_write_mode_set
@lcd_write_data:
      ; Set flags
      lda #(LCD_WRITE_MODE | LCD_DATA_MODE)
      sta tmp1
@lcd_write_mode_set:
      ; Get current value of blink led
      lda VIA1_PORTB
      and #%00000001
      ; Concatenate with current buffer and store it there
      ora tmp1
      sta tmp1
      ; Set port direction (output)
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB
      ; Process actual data
      lda tmp2
      ; Most significant bits first
      ; Apply mask
      and #%11110000
      ; Fetch current status from tmp1
      ora tmp1
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Set enable flag
      ora #(LCD_ENABLE_FLAG)
      ; send command
      sta VIA1_PORTB
      ; Toggle pulse
      eor #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Follow the same process with least significant bits
      lda tmp2
      and #%00001111
      asl
      asl
      asl
      asl
      ; Get current status
      ora tmp1
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Set write command flags
      ora #(LCD_ENABLE_FLAG)
      ; Send command
      sta VIA1_PORTB
      ; Toggle pulse
      eor #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      rts

; lcd_read_byte - read one byte from LCD
; result in A
; carry clear - command
; carry set - data
; internal variables
; tmp1 - buffer for data MSB
; tmp2 - buffer for data LSB
; tmp3 - buffer for operation mode
lcd_read_byte:
      bcs @lcd_read_data
      ; Set flags
      lda #(LCD_READ_MODE | LCD_COMMAND_MODE)
      sta tmp3
      bra @lcd_read_mode_set
@lcd_read_data:
      ; Set flags
      lda #(LCD_READ_MODE | LCD_DATA_MODE)
      sta tmp3
@lcd_read_mode_set:
      ; Preserve direction of last four bits of DDRB
      ; but toggle LCD data lines to input
      lda VIA1_DDRB
      and #%00000001
      ora #%00001110
      sta VIA1_DDRB
      ; Preserve status of blink led
      lda VIA1_PORTB
      and #%00000001
      ora tmp3
      sta VIA1_PORTB
      ; Give it a while
      ora #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Read result
      lda VIA1_PORTB
      and #%11110000
      ; Store result from LCD data lines
      sta tmp1
      ; Toggle enable
      lda VIA1_PORTB
      eor #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Get next four bits
      and #%00000001
      ora tmp3
      sta VIA1_PORTB
      ; Give it a while
      ora #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Read and construct result
      lda VIA1_PORTB
      sta tmp2
      ; Toggle enable flag
      eor #(LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Combine results
      lda tmp2
      and #%11110000
      lsr
      lsr
      lsr
      lsr
      ora tmp1
      rts

; lcd_wait_bf_clear - wait for busy flag clear from LCD, return status
; parameters
;   none
; return value - register A
lcd_wait_bf_clear:
      clc
      jsr lcd_read_byte
      ; Repeat read if BF is still set
      bmi lcd_wait_bf_clear
      rts

; Checks if line break occured after last data write
; Assumes result of last write in A
lcd_wrap_line:
      pha
      phx
      ldx #$00
@lcd_wrap_loop:
      cmp lcd_wordwrap_sources,x
      beq @lcd_wrap_found
      inx
      cpx #$04
      beq @lcd_wrap_not_found
      bra @lcd_wrap_loop
@lcd_wrap_found:
      lda lcd_wordwrap_targets,x
      ora #(LCD_CMD_DDRAM_SET)
      clc
      jsr lcd_write_byte
      jsr lcd_wait_bf_clear
@lcd_wrap_not_found:
      plx
      pla
      rts      

      .SEGMENT "RODATA"

lcd_force_reset_sequence:
      .byte 100
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
      .byte 5
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
      .byte 1
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
      .byte 1
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_4_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
      .byte 1
      .byte $00

lcd_init_sequence_data:
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_FONT5x7 | LCD_FS_TWO_LINE | LCD_FS_4_BIT
      .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_OFF | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
      .byte LCD_CMD_CLEAR
      .byte LCD_CMD_ENTRY_MODE | LCD_EM_SHIFT_CURSOR | LCD_EM_INCREMENT
      .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
      .byte $00

lcd_mapping_coordinates:
      .byte 00
      .byte 40
      .byte 20
      .byte 60

lcd_wordwrap_sources:
      .byte 20
      .byte 60
      .byte 40
      .byte 80

lcd_wordwrap_targets:
      .byte 40
      .byte 20
      .byte 60
      .byte 00