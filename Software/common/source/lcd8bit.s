        .include "zeropage.inc"
        .include "utils.inc"
        .include "via.inc"

        .export _lcd_init
        .export lcd_read_byte
        .export lcd_write_byte

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
LCD_DATA_MODE           = %00100000
LCD_WRITE_MODE          = %00000000
LCD_READ_MODE           = %01000000
LCD_ENABLE_FLAG         = %10000000

; Default setting compatible with PCB Rev. 001
LCD_DATA_PORT           = VIA2_PORTB
LCD_CONTROL_PORT        = VIA2_PORTA
LCD_DATA_DDR            = VIA2_DDRB
LCD_CONTROL_DDR         = VIA2_DDRA

LCD_DATA_DDR_WRITE_MASK = %11111111
LCD_DATA_DDR_READ_MASK  = %00000000

LCD_CTRL_DDR_WRITE_MASK = %11100000

LCD_CTRL_PRESERVE_MASK  = %00011111

        .code

; POSITIVE C COMPLIANT
_lcd_init:
        ; store registers A and X
        pha
        phx
        ; Initialize DATA DDR
        lda LCD_DATA_DDR
        ora #(LCD_DATA_DDR_WRITE_MASK)
        sta LCD_DATA_DDR
        ; Initialize CONTROL DDR
        lda LCD_CONTROL_DDR
        ora #(LCD_CTRL_DDR_WRITE_MASK)
        sta LCD_CONTROL_DDR
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

        lda LCD_CONTROL_PORT
        and #(LCD_CTRL_PRESERVE_MASK)
        ora #(LCD_COMMAND_MODE | LCD_WRITE_MODE)
        sta LCD_CONTROL_PORT
        lda lcd_force_reset_sequence, x
        sta LCD_DATA_PORT
        lda LCD_CONTROL_PORT
        ora #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        eor #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT

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
        inx
        bra @lcd_init_loop
@lcd_init_end:
        plx
        pla
        rts

; INTERNAL
; lcd_write_byte - send one byte to LCD
; byte in A
; carry clear - command
; carry set - data
; internal variables
; lcd_temp_char1 - buffer for mode and blink flag
; lcd_temp_char2 - buffer for data
lcd_write_byte:
        pha
        php
        jsr lcd_wait_bf_clear
        plp
        pla
        sta lcd_temp_char2
        bcs @lcd_write_data
        ; Set flags
        lda #(LCD_WRITE_MODE | LCD_COMMAND_MODE)
        sta lcd_temp_char1
        bra @lcd_write_mode_set
@lcd_write_data:
        ; Set flags
        lda #(LCD_WRITE_MODE | LCD_DATA_MODE)
        sta lcd_temp_char1
@lcd_write_mode_set:
        ; Get current value of blink led
        lda LCD_CONTROL_PORT
        and #(LCD_CTRL_PRESERVE_MASK)
        ; Concatenate with current buffer and store it there
        ora lcd_temp_char1
        sta LCD_CONTROL_PORT
        ; Set port direction (output)
        lda LCD_DATA_DDR
        ora #(LCD_DATA_DDR_WRITE_MASK)
        sta LCD_DATA_DDR
        ; Process actual data
        lda lcd_temp_char2
        sta LCD_DATA_PORT
        ; Ping
        lda LCD_CONTROL_PORT
        ; Set enable flag
        ora #(LCD_ENABLE_FLAG)
        ; send command
        sta LCD_CONTROL_PORT
        ; Toggle pulse
        eor #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        rts

; INTERNAL
; lcd_read_byte - read one byte from LCD
; result in A
; carry clear - command
; carry set - data
; internal variables
; lcd_temp_char1 - buffer for data MSB
; lcd_temp_char2 - buffer for data LSB
; lcd_temp_char3 - buffer for operation mode
lcd_read_byte:
        php
        jsr lcd_wait_bf_clear
        plp
        bcs @lcd_read_data
        ; Set flags
        lda #(LCD_READ_MODE | LCD_COMMAND_MODE)
        sta lcd_temp_char3
        bra @lcd_read_mode_set
@lcd_read_data:
        ; Set flags
        lda #(LCD_READ_MODE | LCD_DATA_MODE)
        sta lcd_temp_char3
@lcd_read_mode_set:
        ; Change DDR to input
        lda LCD_DATA_DDR
        and #(LCD_DATA_DDR_READ_MASK)
        sta LCD_DATA_DDR
        ; Preserve status of remaining via pins
        lda LCD_CONTROL_PORT
        and #(LCD_CTRL_PRESERVE_MASK)
        ora lcd_temp_char3
        sta LCD_CONTROL_PORT
        ; Give it a while
        ora #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        ; Read result
        lda LCD_DATA_PORT
        sta lcd_temp_char1
        ; Toggle enable
        lda LCD_CONTROL_PORT
        eor #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        lda lcd_temp_char1
        rts

lcd_wait_bf_clear:
        ; Set flags
        lda #(LCD_READ_MODE | LCD_COMMAND_MODE)
        ; Change DDR to input
        lda LCD_DATA_DDR
        and #(LCD_DATA_DDR_READ_MASK)
        sta LCD_DATA_DDR
@wait_loop:
        ; Preserve status of remaining via pins
        lda LCD_CONTROL_PORT
        and #(LCD_CTRL_PRESERVE_MASK)
        ora #(LCD_READ_MODE | LCD_COMMAND_MODE)
        sta LCD_CONTROL_PORT
        ora #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        ; Read result
        lda LCD_DATA_PORT
        sta lcd_temp_char1
        ; Toggle enable
        lda LCD_CONTROL_PORT
        eor #(LCD_ENABLE_FLAG)
        sta LCD_CONTROL_PORT
        lda lcd_temp_char1
        bmi @wait_loop
        rts

        .SEGMENT "RODATA"

lcd_force_reset_sequence:
        .byte 20
        .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
        .byte 5
        .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
        .byte 1
        .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
        .byte 1
        .byte LCD_CMD_FUNCTION_SET | LCD_FS_8_BIT | LCD_COMMAND_MODE | LCD_WRITE_MODE
        .byte 1
        .byte $00

lcd_init_sequence_data:
        .byte LCD_CMD_FUNCTION_SET | LCD_FS_FONT5x7 | LCD_FS_TWO_LINE | LCD_FS_8_BIT
        .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_OFF | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
        .byte LCD_CMD_CLEAR
        .byte LCD_CMD_ENTRY_MODE | LCD_EM_SHIFT_CURSOR | LCD_EM_INCREMENT
        .byte LCD_CMD_DISPLAY_MODE | LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_OFF | LCD_DM_CURSOR_NOBLINK
        .byte $00
