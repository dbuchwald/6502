; ---------------------------------------------------------------------------------
; Include file for Port Mapping constants
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

; It is assumed that HD44780 control lines are connected to pins 6, 7 & 8 of VIA port
HD44780_PORT_DDR_MASK       equ %11100000
HD44780_MODE_COMMAND        equ %00000000
HD44780_MODE_DATA           equ %00100000
HD44780_WRITE_MODE          equ %00000000
HD44780_READ_MODE           equ %01000000
HD44780_PULSE               equ %10000000
HD44780_PULSE_DISABLE_MASK  equ %01111111
