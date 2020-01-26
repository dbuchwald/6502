; ---------------------------------------------------------------------------------
; Include file for HD44780 LCD driver constants
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef HD44780_CONSTANTS_DEFINED
HD44780_CONSTANTS_DEFINED   equ 1

; HD44780 Commands list
HD44780_CMD_CLEAR           equ %00000001
HD44780_CMD_HOME            equ %00000010
HD44780_CMD_ENTRY_MODE      equ %00000100
HD44780_CMD_DISPLAY_MODE    equ %00001000
HD44780_CMD_CURSOR_SHIFT    equ %00010000
HD44780_CMD_FUNCTION_SET    equ %00100000
HD44780_CMD_CGRAM_SET       equ %01000000
HD44780_CMD_DDRAM_SET       equ %10000000

; Entry mode command parameters
HD44780_EM_SHIFT_CURSOR     equ %00000000
HD44780_EM_SHIFT_DISPLAY    equ %00000001
HD44780_EM_DECREMENT        equ %00000000
HD44780_EM_INCREMENT        equ %00000010

; Display mode command parameters
HD44780_DM_CURSOR_NOBLINK   equ %00000000
HD44780_DM_CURSOR_BLINK     equ %00000001
HD44780_DM_CURSOR_OFF       equ %00000000
HD44780_DM_CURSOR_ON        equ %00000010
HD44780_DM_DISPLAY_OFF      equ %00000000
HD44780_DM_DISPLAY_ON       equ %00000100

; Function set command parameters
HD44780_FS_FONT5x7          equ %00000000
HD44780_FS_FONT5x10         equ %00000100
HD44780_FS_ONE_LINE         equ %00000000
HD44780_FS_TWO_LINE         equ %00001000
HD44780_FS_4_BIT            equ %00000000
HD44780_FS_8_BIT            equ %00010000

  endif ; HD44780_CONSTANTS_DEFINED