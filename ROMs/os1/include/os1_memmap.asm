; ---------------------------------------------------------------------------------
; Include file for OS/1 Memory Mapping constants
; Author: Dawid Buchwald
; Date: 21/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef OS1_MEMMAP_CONSTANTS_DEFINED
OS1_MEMMAP_CONSTANTS_DEFINED   equ 1

; Various addresses
OS1_USER_RAM_AREA_START    equ WDC65C02_RAM_ZEROPAGE_OS + $00
OS1_USER_RAM_AREA_END      equ WDC65C02_RAM_ZEROPAGE_OS + $02
OS1_USER_ZP_START          equ WDC65C02_RAM_ZEROPAGE_OS + $04

  endif ; OS1_MEMMAP_CONSTANTS_DEFINED