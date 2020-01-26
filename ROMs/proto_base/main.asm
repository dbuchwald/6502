; ---------------------------------------------------------------------------------
; Main ROM file, containing all the directives needed for data alignment for EEPROM
; Author: Dawid Buchwald
; Date: 03/01/2020
; ---------------------------------------------------------------------------------
  include "arch/WDC65C02.asm"
  include "arch/addrmap.asm"  
  include "build/AT28C256.asm"

; To align with EEPROM, we need to fill the gap between ROM low address and addressing mode
; ROM start with 0x00
  org AT28C256_LOW_ADDRESS

  org WDC65C02_ROM_START

init_routine:
; Init LCD
  lda #100
  jsr ms_delay
  jsr hd44780_lcd_init
; Display hello message
  ldx #$00
hello_message_loop:
  lda hello_message_data,x
  beq hello_message_loop_end
  jsr hd44780_write_data
  jsr hd44780_wait_for_bf_clear
  inx
  bra hello_message_loop
hello_message_loop_end:

; wait two seconds and clear screen
  lda #$02
  jsr sec_delay
  lda #%11111111
  sta WDC65C22_VIA1_DDRB
  lda #HD44780_CMD_CLEAR
  sta WDC65C22_VIA1_PORTB
  lda #(HD44780_MODE_COMMAND | HD44780_WRITE_MODE | HD44780_PULSE)
  sta WDC65C22_VIA1_PORTA
  and #HD44780_PULSE_DISABLE_MASK
  sta WDC65C22_VIA1_PORTA
  lda #50
  jsr ms_delay

; Initialize ACIA
  jsr serial_port_init

; Initialize index
  ldx #$00
; Write hello to serial interface
serial_hello_loop:
  lda serial_hello_message_data,x
  beq serial_hello_loop_end
  jsr serial_port_write_data
  inx 
  bra serial_hello_loop
serial_hello_loop_end:
; read one character
  jsr serial_port_read_data
; print the char to the screen
  jsr hd44780_write_data
  jsr hd44780_wait_for_bf_clear
; rinse and repeat
  ldx #$00
  bra serial_hello_loop

; This is where maskable interrupts will be handled
int_handler:
  rti

; Default non-maskable interrupt handler
nmi_handler:
  rti

; Include source for OS/1 Utilities
  include "include/utilities.asm"

; Include source for LCD operation
  include "lcd.asm"

; Include source for serial operation
  include "serial.asm"

hello_message_data:
  string "Hello!"

serial_hello_message_data:
  byte "Port ready", $0d, $0a, $00

  org WDC65C02_NMI_VECTOR
  word nmi_handler
  org WDC65C02_RESET_VECTOR
  word init_routine
  org WDC65C02_INT_VECTOR
  word int_handler