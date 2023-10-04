      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "blink.inc"


      VDP_VRAM = $8080
      VDP_REG  = $8081

      .segment "VECTORS"
      
      VDP_WRITE_VRAM_BIT = $40
      VDP_REGISTER_BITS = $80

      .word   $0000
      .word   init
      .word   $0000

      .code

init:  
 
;      jsr _lcd_init
;      write_lcd #hello_msg

      lda #04
      sta VDP_REG

      lda #1
      jsr _delay_ms

      lda #87
      sta VDP_REG

      lda #1
      jsr _delay_ms


      lda #04
      sta VDP_REG

      lda #1
      jsr _delay_ms

      lda #87
      sta VDP_REG

      lda #1
      jsr _delay_ms


      lda #$A9
      sta VDP_REG

      lda #1
      jsr _delay_ms

      lda #$87
      sta VDP_REG

      lda #1
      jsr _delay_ms



     jsr _blink_init

    ldx #0

end_loop:
;      lda #01
;      jsr _delay_sec
    jsr _strobe_led

      txa
      sta VDP_REG
  
  ;    lda #1
  ;    jsr _delay_ms

      lda #$87
      sta VDP_REG

      lda #1
      jsr _delay_sec

      inx
      bra end_loop

      .segment "RODATA"

hello_msg:
      .byte "Testing VDP Output! (screen color)", $00

