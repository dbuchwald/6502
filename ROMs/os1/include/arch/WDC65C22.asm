; ---------------------------------------------------------------------------------
; Include file for WDC65C22 constants 
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

WDC65C22_VIA1_ADDRESS      equ $9000
WDC65C22_VIA2_ADDRESS      equ $8800

WDC65C22_VIA1_PORTB        equ WDC65C22_VIA1_ADDRESS + $00
WDC65C22_VIA1_PORTA        equ WDC65C22_VIA1_ADDRESS + $01
WDC65C22_VIA1_DDRB         equ WDC65C22_VIA1_ADDRESS + $02
WDC65C22_VIA1_DDRA         equ WDC65C22_VIA1_ADDRESS + $03

WDC65C22_VIA2_PORTB        equ WDC65C22_VIA2_ADDRESS + $00
WDC65C22_VIA2_PORTA        equ WDC65C22_VIA2_ADDRESS + $01
WDC65C22_VIA2_DDRB         equ WDC65C22_VIA2_ADDRESS + $02
WDC65C22_VIA2_DDRA         equ WDC65C22_VIA2_ADDRESS + $03
