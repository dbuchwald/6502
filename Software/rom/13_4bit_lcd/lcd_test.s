      .setcpu "65C02"
      .include "lcd.inc"
      .include "blink.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
    
      jsr _blink_init
      
      lda #BLINK_LED_ON
      jsr _blink_led

      jsr _lcd_init

      lda #BLINK_LED_OFF
      jsr _blink_led

;     write_lcd #hello_msg

;     write_lcd #hello_msg

;     write_lcd #hello_msg            

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #('H')
      jsr _lcd_print_char
      lda #BLINK_LED_OFF
      jsr _blink_led

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #('i')
      jsr _lcd_print_char
      lda #BLINK_LED_OFF
      jsr _blink_led

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #('!')
      jsr _lcd_print_char
      lda #BLINK_LED_OFF
      jsr _blink_led

end_loop:
      jsr _strobe_led
      bra end_loop

      .segment "RODATA"

hello_msg:
      .byte "Hi! ", $00
chars_msg:
      .byte " Chars!",$00