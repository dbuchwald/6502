; ---------------------------------------------------------------------------------
; Include file for Address Mapping constants
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------

WDC65C02_RAM_ZEROPAGE_OS   equ $0000
WDC65C02_RAM_ZEROPAGE_USER equ $0080
WDC65C02_RAM_STACKPAGE     equ $0100
WDC65C02_RAM_OS_PAGE       equ $0200
WDC65C02_RAM_USER_AREAL    equ $0400
WDC65C02_RAM_USER_AREAH    equ $3fff

WDC65C02_ROM_START         equ $8000