      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "tty.inc"

      .include "midi.inc"

      .include "via_const.inc"
      .include "via.inc"
      
      .include "SN76489_const.inc"
      .include "SN76489.inc"
      .include "utils.inc"

      .include "gamepad.inc"

      .include "zeropage.inc"

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000 ; irq_handler

      .code
init:  
      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      writeln_tty #hello_msg

      jsr _strobe_led

      ; lda #VIA_ACR_T1_CONT_NO_PB7
      ; sta VIA1_ACR

      ; lda #(VIA_IER_CLEAR_FLAGS | $7F)
      ; lda #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG)
      ; sta VIA1_IER


      ; How often to check Controllers
      ; lda #$2C
      ; sta VIA1_T1CL
      ; lda #$80 ; was $08
      ; sta VIA1_T1CH
      ; cli

      lda #(BLINK_LED_ON)
program_loop:
      ;eor #BLINK_LED_ON
      ;jsr _blink_led


      ; Do Update
      ldx GAMEPAD1
      cpx last_controller_input
      beq program_loop

      lda #'$'
      jsr _tty_send_character
      txa  
      jsr _tty_write_hex
      jsr _tty_send_newline

      sta last_controller_input



      
      jmp program_loop

irq_handler:
      pha
      lda VIA1_IFR
      bpl @not_via1

      and #VIA_IFR_TIME_OUT_T1
      beq @not_gameport_event

      lda #BLINK_LED_ON
      jsr _blink_led

      ; Do Update
      ldx GAMEPAD1
      cpx last_controller_input
      beq @no_change

      lda #'$'
      jsr _tty_send_character
      txa  
      jsr _tty_write_hex
      jsr _tty_send_newline

      sta last_controller_input

@no_change:
      lda #BLINK_LED_OFF
      jsr _blink_led


@not_gameport_event:
      lda #VIA_IFR_TIME_OUT_T1      ; clear the T1 interrupt
      sta VIA1_IFR

@not_via1:
      pla
      rti


      .BSS
last_controller_input:
      .res 1

      .segment "RODATA"
hello_msg:
      .byte "GamePad Test", $00
