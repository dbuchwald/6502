      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "core.inc"
      .include "serial.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler

CHANNEL = 0

      .code

init:
      ; Set up stack
      ldx #$ff
      txs
      ; Run setup routine
      jsr _system_init

      stz bytescount
      stz bytescount+1

wait_for_serial_input:
      lda #CHANNEL
      jsr _serial_is_data_available
      cmp #(ACIA_NO_DATA_AVAILABLE)
      beq wait_for_serial_input

      ldx #00
prompt_loop:
      lda prompt,x
      beq main_loop
      ldy #CHANNEL
      jsr serial_write_byte
      inx
      bra prompt_loop

main_loop:

      ldx #00
      ldy #01
      jsr lcd_set_position
      ldy #CHANNEL
      lda serial_tx_rptr,y
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #03
      ldy #01
      jsr lcd_set_position      
      ldy #CHANNEL
      lda serial_tx_wptr,y
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #06
      ldy #01
      jsr lcd_set_position      
      ldy #CHANNEL
      lda serial_rx_rptr,y
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #09
      ldy #01
      jsr lcd_set_position      
      ldy #CHANNEL
      lda serial_rx_wptr,y
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      ldx #00
      ldy #02
      jsr lcd_set_position      
      lda bytescount+1
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      lda bytescount
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char

      lda #CHANNEL
      jsr _serial_is_data_available
      cmp #(ACIA_NO_DATA_AVAILABLE)
      beq main_loop
      lda #CHANNEL
      jsr _serial_read_byte
      ldx #08
      ldy #00
      jsr lcd_set_position      
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