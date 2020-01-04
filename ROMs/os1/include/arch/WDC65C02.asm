; ---------------------------------------------------------------------------------
; Include file for WDC65C02 operational constants
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef WDC65C02_CONSTANTS_DEFINED
WDC65C02_CONSTANTS_DEFINED equ 1

WDC65C02_RESET_VECTOR      equ $fffc
WDC65C02_INT_VECTOR        equ $fffe
WDC65C02_NMI_VECTOR        equ $fffa

  endif ; WDC65C02_CONSTANTS_DEFINED