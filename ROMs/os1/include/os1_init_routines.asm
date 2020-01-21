; ---------------------------------------------------------------------------------
; Include file for OS/1 Init routines
; Author: Dawid Buchwald
; Date: 21/01/2020
; ---------------------------------------------------------------------------------

; Prevent issue with double include
  ifndef OS1_INIT_ROUTINES_DEFINED
OS1_INIT_ROUTINES_DEFINED   equ 1

  lda #<WDC65C02_RAM_USER_AREAL
  sta OS1_USER_RAM_AREA_START
  lda #>WDC65C02_RAM_USER_AREAL
  sta OS1_USER_RAM_AREA_START + $01

  lda #<WDC65C02_RAM_USER_AREAH
  sta OS1_USER_RAM_AREA_END
  lda #>WDC65C02_RAM_USER_AREAH
  sta OS1_USER_RAM_AREA_END + $01

  lda #WDC65C02_RAM_ZEROPAGE_USER
  sta OS1_USER_ZP_START
  stz OS1_USER_ZP_START + 1

  endif ; OS1_INIT_ROUTINES_DEFINED