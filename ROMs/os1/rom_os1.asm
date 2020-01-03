; ---------------------------------------------------------------------------------
; Main ROM file, containing all the directives needed for data alignment for EEPROM
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------
  include "arch/WDC65C02.asm"
  include "arch/WDC65C22.asm"
  include "arch/addrmap.asm"
  include "arch/portmap.asm"
  include "arch/lcd/HD44780.asm"
  include "build/AT28C256.asm"

; To align with EEPROM, we need to fill first 0x2000 bytes with 0x00, as ROM is
; addressable with current address decoder as from 0xa000
  org AT28C256_LOW_ADDRESS

  org WDC65C02_ROM_START

; This is where OS init will start
os_init_routine:
  jsr hd44780_lcd_init
  stp

; This is where maskable interrupts will be handled
os_int_handler:
  rti

; Default non-maskable interrupt handler
os_nmi_handler:
  rti

; Include source for LCD operation
  include "lcd.asm"

  org WDC65C02_NMI_VECTOR
  word os_nmi_handler
  org WDC65C02_RESET_VECTOR
  word os_init_routine
  org WDC65C02_INT_VECTOR
  word os_int_handler