      .setcpu "65C02"
      .include "utils.inc"
      .include "via.inc"
      .include "lcd.inc"
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
      jsr _lcd_print_char
read_data_end:
      pla
      rti
