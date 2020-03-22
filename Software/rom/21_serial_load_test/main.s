      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .include "via.inc"
      .include "blink.inc"
      .include "core.inc"
      .include "acia.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

      .code

init:
      ; Set up stack
      ldx #$ff
      txs
      ; Run setup routine
      jsr _init_system

      stz bytescount
      stz bytescount+1

; wait_for_acia_input:
      jsr _acia_is_data_available
      cmp #00
      beq wait_for_acia_input

      ldx #00
prompt_loop:
      lda prompt,x
      beq main_loop
      jsr _acia_write_byte
      inx
      bra prompt_loop

main_loop:

      ldx #00
      ldy #01
      jsr _lcd_set_position      
      lda acia_tx_rptr
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #03
      ldy #01
      jsr _lcd_set_position      
      lda acia_tx_wptr
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #06
      ldy #01
      jsr _lcd_set_position      
      lda acia_rx_rptr
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #09
      ldy #01
      jsr _lcd_set_position      
      lda acia_rx_wptr
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #00
      ldy #02
      jsr _lcd_set_position      
      lda bytescount+1
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      lda bytescount
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      jsr _acia_is_data_available
      bcc main_loop
      jsr _acia_read_byte
      ldx #08
      ldy #00
      jsr _lcd_set_position      
      jsr _lcd_print_char
      inc bytescount
      bne not_full
      inc bytescount+1
not_full:
      lda #5
      jsr _delay_ms

      jmp main_loop

      .segment "BSS"
bytescount:
      .res 2
lastdata:
      .res 1

      .segment "RODATA"
prompt:
      .byte "OS/1 >>", $0a, $0d, $00