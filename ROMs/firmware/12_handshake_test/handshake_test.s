      .setcpu "65C02"
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
      jsr _lcd_init

handshake_init:
      stz VIA2_DDRA            ; VIA2 PORTA is all input
                               ; define read handshake on VIA2 CA1/CA2
      lda #(VIA_PCR_CA1_INTERRUPT_NEGATIVE | VIA_PCR_CA2_OUTPUT_PULSE | VIA_PCR_CB1_INTERRUPT_NEGATIVE | VIA_PCR_CB2_OUTPUT_HIGH)
      sta VIA2_PCR
                               ; enable interrupt from VIA2 on CA1 (Data ready)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_CA1_FLAG)
      sta VIA2_IER
      cli                      ; enable interrupt processing

      ldx #00                  ; set display index to 0
      stz WRITE_INDEX          ; set buffer index to 0
      ldy #00                  ; set internal buffer pointer to 0

program_loop:
      cpx WRITE_INDEX
      beq program_loop
      inx
      lda MEM_BUFFER,x         ; Load data bytes from address data + x
      jsr _lcd_print_char
      jmp program_loop

read_data:
      pha
      lda VIA2_PORTA           ; should trigger data taken signal
      sta MEM_BUFFER,y
      iny
      sty WRITE_INDEX
read_data_end:
      pla
      rti
