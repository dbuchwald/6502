; ---------------------------------------------------------------------------------
; Include file for Address Mapping constants
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef ADDRMAP_CONSTANTS_DEFINED
ADDRMAP_CONSTANTS_DEFINED   equ 1

WDC65C02_RAM_ZEROPAGE_OS   equ $0000
WDC65C02_RAM_ZEROPAGE_USER equ $0080
WDC65C02_RAM_STACKPAGE     equ $0100
WDC65C02_RAM_OS_PAGE       equ $0200
WDC65C02_RAM_USER_AREAL    equ $0400

  ifdef WDC65C02_ADDRESS_BASIC

WDC65C02_RAM_USER_AREAH    equ $3fff
WDC65C02_ROM_START         equ $8000

  endif ; WDC65C02_ADDRESS_BASIC
  ifdef WDC65C02_ADDRESS_BASIC_V2

WDC65C02_RAM_USER_AREAH    equ $7fff
WDC65C02_ROM_START         equ $c000

  endif ; WDC65C02_ADDRESS_BASIC_V2
  ifdef WDC65C02_ADDRESS_EXTENDED

WDC65C02_RAM_USER_AREAH    equ $7fff
WDC65C02_ROM_START         equ $a000

  endif ; WDC65C02_ADDRESS_EXTENDED

  ifndef WDC65C02_ROM_START

    fail "Set addressing mode using one of the symbols: WDC65C02_ADDRESS_BASIC, WDC65C02_ADDRESS_BASIC_V2, WDC65C02_ADDRESS_EXTENDED"

  endif ; WDC65C02_ROM_START

  endif ; ADDRMAP_CONSTANTS_DEFINED