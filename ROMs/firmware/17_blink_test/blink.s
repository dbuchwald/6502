      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .include "via.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      lda #$01
      sta VIA1_DDRB
      lda #$01
      sta VIA1_PORTB
      jsr _lcd_init
      lda #<blink_msg
      sta lcd_out_ptr
      lda #>blink_msg
      sta lcd_out_ptr+1
      jsr _lcd_print
      lda #$01
      jsr _delay_sec
      lda VIA1_DDRB
      ora #%00000001
      sta VIA1_DDRB
      lda #$ff
      sta VIA2_DDRA
      sta VIA2_DDRB
blink_loop:
      lda VIA1_PORTB
      ora #%00000001
      sta VIA1_PORTB
      lda #$ff
      sta VIA2_PORTA
      lda #$00
      sta VIA2_PORTB
      lda #$01
      jsr _delay_sec
      lda VIA1_PORTB
      and #%11111110
      sta VIA1_PORTB
      lda #$00
      sta VIA2_PORTA
      lda #$ff
      sta VIA2_PORTB
      lda #$01
      jsr _delay_sec
      bra blink_loop

      .segment "RODATA"

blink_msg:
      .byte "Blink test", $00
