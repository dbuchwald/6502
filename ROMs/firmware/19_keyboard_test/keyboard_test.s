      .setcpu "65C02"
      .include "utils.inc"
      .include "via.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .import __RAM_START__

WRITE_INDEX   = __RAM_START__
MEM_BUFFER    = __RAM_START__+1

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   read_data

      .code

init:
      ldx #$ff
      txs

handshake_init:
      stz VIA1_DDRA            ; VIA2 PORTA is all input
      stz VIA1_PORTA
                               ; define read handshake on VIA2 CA1/CA2
      lda #(VIA_PCR_CA1_INTERRUPT_NEGATIVE | VIA_PCR_CA2_OUTPUT_PULSE | VIA_PCR_CB1_INTERRUPT_NEGATIVE | VIA_PCR_CB2_OUTPUT_HIGH)
      sta VIA1_PCR
                               ; enable interrupt from VIA2 on CA1 (Data ready)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_CA1_FLAG)
      sta VIA1_IER

      ldx #00                  ; set display index to 0
      stz WRITE_INDEX          ; set buffer index to 0
      ldy #00                  ; set internal buffer pointer to 0

      jsr _lcd_init

      lda #$ff
      jsr _delay_ms
      lda VIA1_IFR
      lda VIA1_PORTA

      cli                      ; enable interrupt processing

      lda #('?')
      jsr _lcd_print_char
      lda #(' ')
      jsr _lcd_print_char

program_loop:
      jmp program_loop
      ; cpx WRITE_INDEX
      ; beq program_loop
      ; inx
      ; lda MEM_BUFFER,x         ; Load data bytes from address data + x
      ; jsr _lcd_print_char

read_data:
      pha
      lda VIA1_PORTA           ; should trigger data taken signal
      ; sta MEM_BUFFER,y
      ; iny
      ; sty WRITE_INDEX
      cmp #$ff
      beq keyboard_connected
      cmp #$fe
      beq keyboard_disconnected
      jsr _lcd_clear
      write_lcd key_msg
      jsr _lcd_print_char
      write_lcd key_part_two
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char
      write_lcd key_part_three
      bra read_data_end

keyboard_connected:
      jsr _lcd_clear
      write_lcd conn_msg
      bra read_data_end

keyboard_disconnected:
      jsr _lcd_clear
      write_lcd disconn_msg
      bra read_data_end

read_data_end:
      pla
      rti

      .segment "RODATA"
key_msg:
      .byte "Key pressed: ",$00
key_part_two:
      .byte " ($",$00
key_part_three:
      .byte ")",$00
conn_msg:
      .byte "Keyboard connected", $00
disconn_msg:
      .byte "Keyboard disconnected", $00