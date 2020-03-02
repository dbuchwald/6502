      .include "via.inc"
      .include "zeropage.inc"
      .include "utils.inc"
      .export _lcd_init
      .export _lcd_print
      .export _lcd_print_char
      .export _lcd_clear

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
      ; VIA1 PORTB - toggle output on 7 last bits
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB
      ; clear output for 7 last bits
      lda VIA1_PORTB
      and #%00000001
      sta VIA1_PORTB
      ; initialize index
      ldx #$00
      ; first, send 4-bits to initialize 4-bit mode
      lda #50
      jsr _delay_ms
      ; Preserve blink mode
      lda VIA1_PORTB
      ora #(LCD_CMD_FUNCTION_SET | LCD_FS_4_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      eor #LCD_ENABLE_FLAG
      sta VIA1_PORTB
@lcd_init_loop:
      ; Delay before commands
      lda lcd_init_sequence_data,x
      jsr _delay_ms
      inx
      ; Read next byte of init sequence data
      lda lcd_init_sequence_data,x
      ; Exit loop if $00 read
      beq @lcd_init_end
      ; Store current value, we will need it for another 4bits
      ; pha
      ; ; Most significant bits first
      ; ; Apply mask
      ; and #%11110000
      ; ; Set write command flags
      ; ora #(LCD_COMMAND_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      ; ; Follow the same process with least significant bits
      ; pla
      ; and #%00001111
      ; rol
      ; rol
      ; rol
      ; rol
      ; ; Set write command flags
      ; ora #(LCD_COMMAND_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      clc ; Clear carry for command operation
      jsr lcd_write_byte
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
      ; VIA1 PORTB - toggle output on 7 last bits
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB
      ; clear output for 7 last bits
      lda VIA1_PORTB
      and #%00000001
      sta VIA1_PORTB
      ; initialize index
      ldy #$00
@lcd_print_loop:
      ; Read next byte of init sequence data
      lda (lcd_out_ptr),y
      ; Exit loop if $00 read
      beq @lcd_print_end
      ; ; Store current value, we will need it for another 4bits
      ; pha
      ; ; Most significant bits first
      ; ; Apply mask
      ; and #%11110000
      ; ; Set write data flags
      ; ora #(LCD_DATA_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      ; ; Follow the same process with least significant bits
      ; pla
      ; and #%00001111
      ; clc
      ; rol
      ; rol
      ; rol
      ; rol
      ; ; Set write data flags
      ; ora #(LCD_DATA_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      sec
      jsr lcd_write_byte
      iny

      ;lda #01
      ;jsr _delay_ms

      ; lda VIA1_DDRB
      ; and #%00001111
      ; sta VIA1_DDRB
@lcd_print_busy_flag_poll:
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      ; sta VIA1_PORTB
      ; ; Read and construct result
      ; nop
      ; lda VIA1_PORTB
      ; and #%11110000
      ; sta tmp1
      ; ; eor #LCD_ENABLE_FLAG
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE)
      ; sta VIA1_PORTB
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      ; sta VIA1_PORTB
      ; ; Read and construct result
      ; lda VIA1_PORTB
      ; sta tmp2
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      ; lda tmp2
      ; and #%11110000
      ; clc
      ; ror
      ; ror
      ; ror
      ; ror
      ; ora tmp1
      ; sta tmp1
      jsr lcd_read_status
      bmi @lcd_print_busy_flag_poll
      ; VIA1 PORTB - toggle output on 7 last bits
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB

      bra @lcd_print_loop
@lcd_print_end:
      ply
      pla
      rts

_lcd_print_char:
      ; store register A
      pha
      sta tmp1
      ; VIA1 PORTB - toggle output on 7 last bits
      lda VIA1_DDRB
      ora #%11111110
      sta VIA1_DDRB
      ; clear output for 7 last bits
      lda VIA1_PORTB
      and #%00000001
      sta VIA1_PORTB
      ; Most significant bits first
      ; Apply mask
      lda tmp1
      ; and #%11110000
      ; ; Set write data flags
      ; ora #(LCD_DATA_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      ; ; Follow the same process with least significant bits
      ; lda tmp1
      ; and #%00001111
      ; clc
      ; rol
      ; rol
      ; rol
      ; rol
      ; ; Set write data flags
      ; ora #(LCD_DATA_MODE | LCD_WRITE_MODE | LCD_ENABLE_FLAG)
      ; ; Send first 4 bits
      ; sta VIA1_PORTB
      ; ; Toggle pulse
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB

      ; ;lda #01
      ; ;jsr _delay_ms
      sec
      jsr lcd_write_byte

      ; lda VIA1_DDRB
      ; and #%00001110
      ; sta VIA1_DDRB
@lcd_print_char_busy_flag_poll:
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      ; sta VIA1_PORTB
      ; ; Read and construct result
      ; nop
      ; lda VIA1_PORTB
      ; and #%11110000
      ; sta tmp1
      ; ; eor #LCD_ENABLE_FLAG
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE)
      ; sta VIA1_PORTB
      ; lda #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      ; sta VIA1_PORTB
      ; ; Read and construct result
      ; lda VIA1_PORTB
      ; sta tmp2
      ; eor #LCD_ENABLE_FLAG
      ; sta VIA1_PORTB
      ; lda tmp2
      ; and #%11110000
      ; clc
      ; ror
      ; ror
      ; ror
      ; ror
      ; ora tmp1
      ; sta tmp1
      jsr lcd_read_status
      bmi @lcd_print_char_busy_flag_poll

@lcd_print_char_end:
      pla
      rts

; _lcd_clear - clear screen
; no parameters
; internal variables
; none
_lcd_clear:
      lda #(LCD_CMD_CLEAR)
      clc
      jsr lcd_write_byte

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
      ; Process actual data
      lda tmp2
      ; Most significant bits first
      ; Apply mask
      and #%11110000
      ; Set enable flag
      ora #(LCD_ENABLE_FLAG)
      ; Fetch current status from tmp1
      ora tmp1
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #LCD_ENABLE_FLAG
      sta VIA1_PORTB
      ; Follow the same process with least significant bits
      lda tmp2
      and #%00001111
      asl
      asl
      asl
      asl
      ; Set write command flags
      ora #(LCD_ENABLE_FLAG)
      ; Get current status
      ora tmp1
      ; Send first 4 bits
      sta VIA1_PORTB
      ; Toggle pulse
      eor #LCD_ENABLE_FLAG
      sta VIA1_PORTB
      rts

; lcd_read_status - read one byte of status from LCD
; parameters
;   none
; return value - register A
; temporary variables
; tmp1, tmp2
lcd_read_status:
      ; Preserve direction of last four bits of DDRB
      ; but toggle LCD data lines to input
      lda VIA1_DDRB
      and #%00001111
      sta VIA1_DDRB
      ; Preserve status of blink led
      lda VIA1_PORTB
      and #%00000001
      ora #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Give it a while
      nop
      nop
      nop
      nop
      ; Read result
      lda VIA1_PORTB
      and #%11110000
      ; Store result from LCD data lines
      sta tmp1
      ; Toggle enable
      lda VIA1_PORTB
      eor #LCD_ENABLE_FLAG
      sta VIA1_PORTB
      ; Get next four bits
      and #%00000001
      ora #(LCD_COMMAND_MODE | LCD_READ_MODE | LCD_ENABLE_FLAG)
      sta VIA1_PORTB
      ; Give it a while
      nop
      nop
      nop
      nop
      ; Read and construct result
      lda VIA1_PORTB
      sta tmp2
      ; Toggle enable flag
      eor #LCD_ENABLE_FLAG
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

      .SEGMENT "RODATA"

lcd_init_sequence_data:
      .byte 50
      .byte LCD_CMD_FUNCTION_SET | LCD_FS_FONT5x7 | LCD_FS_TWO_LINE | LCD_FS_4_BIT
      .byte 50
      .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
      .byte 5
      .byte LCD_CMD_ENTRY_MODE | LCD_EM_SHIFT_CURSOR | LCD_EM_INCREMENT
      .byte 5
      .byte LCD_CMD_CLEAR
      .byte 5
      .byte $00
lcd_mapping_coordinates:
      .byte 00
      .byte 40
      .byte 20
      .byte 60