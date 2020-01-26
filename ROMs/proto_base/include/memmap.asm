; ---------------------------------------------------------------------------------
; Include file for Memory Mapping constants
; Author: Dawid Buchwald
; Date: 21/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef MEMMAP_CONSTANTS_DEFINED
_MEMMAP_CONSTANTS_DEFINED   equ 1

; Various addresses
USER_RAM_AREA_START    equ WDC65C02_RAM_ZEROPAGE_OS + $00
USER_RAM_AREA_END      equ WDC65C02_RAM_ZEROPAGE_OS + $02
USER_ZP_START          equ WDC65C02_RAM_ZEROPAGE_OS + $04

TEMP_BYTE1             equ WDC65C02_RAM_ZEROPAGE_OS + $10
TEMP_BYTE2             equ WDC65C02_RAM_ZEROPAGE_OS + $11

  endif ; MEMMAP_CONSTANTS_DEFINED