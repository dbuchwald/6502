      .include "via.inc"
      .include "zeropage.inc"
      .include "utils.inc"
      .include "lcd.inc"
      .include "acia.inc"
      .include "blink.inc"

      .export _init_system
      .export _interrupt_handler

; Main system initialization routine
; LCD initialization
; ACIA initialization
; Disable BCD mode
; Enable interrupt handling
_init_system:
      ; Initialize BLINK LED
      jsr _init_blink_led
      ; Short BLINK LED strobe
      jsr _strobe_led
      ; Enable BLINK LED during init operation
      sec
      jsr _blink_led
      ; Initialize LCD
      jsr _lcd_init
      ; Initialize ACIA
      jsr _acia_init
      ; Disable BCD mode
      cld
      ; Enable interrupt processing
      cli
      ; Turn off BLINK LED, init done
      clc
      jsr _blink_led
      ; Done, return from subroutine
      rts

; Main interrupt handling routine
; Uses ACIA and keyboard handling routines
_interrupt_handler:
      ; Test ACIA first
      bit ACIA_STATUS
      bpl check_via1
      jsr _handle_acia_irq
check_via1:
      bit VIA1_IFR
      ;bmi _handle_via1_irq
      bit VIA2_IFR
      rti