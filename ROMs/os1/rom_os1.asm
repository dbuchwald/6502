; ---------------------------------------------------------------------------------
; Main ROM file, containing all the directives needed for data alignment for EEPROM
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------
  include "arch/WDC65C02.asm"
  include "arch/addrmap.asm"  
  include "build/AT28C256.asm"
  include "os1_memmap.asm"

; To align with EEPROM, we need to fill the gap between ROM low address and addressing mode
; ROM start with 0x00
  org AT28C256_LOW_ADDRESS

  org WDC65C02_ROM_START

; This is where OS init will start
os_init_routine:
; Include source for OS/1 Init routines
  include "include/os1_init_routines.asm"
; Init LCD
  jsr hd44780_lcd_init
; Display hello message
  ldx #$00
os1_hello_message_loop:
  lda os1_hello_message_data,x
  beq os1_hello_message_loop_end
  jsr hd44780_write_data
  jsr hd44780_wait_for_bf_clear
  inx
  bra os1_hello_message_loop
os1_hello_message_loop_end:
  
; Initialize ACIA
  jsr serial_port_init

; Initialize index
  ldx #$00
; Write hello to serial interface
os1_serial_hello_loop:
  lda os1_serial_hello_message_data,x
  beq os1_serial_hello_loop_end
  jsr serial_port_write_data
  inx 
  bra os1_serial_hello_loop
os1_serial_hello_loop_end:
; read one character
  jsr serial_port_read_data
; print the char to the screen
  jsr hd44780_write_data
  jsr hd44780_wait_for_bf_clear
; rinse and repeat
  bra os1_serial_hello_loop_end

; This is where maskable interrupts will be handled
os_int_handler:
  rti

; Default non-maskable interrupt handler
os_nmi_handler:
  rti

; Include source for OS/1 Utilities
  include "include/os1_utilities.asm"

; Include source for LCD operation
  include "lcd.asm"

; Include source for serial operation
  include "serial.asm"

os1_hello_message_data:
  string "OS/1 version 0.01"

os1_serial_hello_message_data:
  byte "OS/1 Serial Port ready>", $0d, $0a, $00

os1_git_commit_data:
  include "include/version/version.asm"

  org WDC65C02_NMI_VECTOR
  word os_nmi_handler
  org WDC65C02_RESET_VECTOR
  word os_init_routine
  org WDC65C02_INT_VECTOR
  word os_int_handler