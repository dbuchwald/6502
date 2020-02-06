      .setcpu "65C02"
      .include "via.inc"
      .import __RAM_START__

COMMAND_MODE  = %00000000
DATA_MODE     = %00100000
WRITE_MODE    = %00000000
READ_MODE     = %01000000
PULSE         = %10000000

NPULSE        = %01111111
WRITE_INDEX   = __RAM_START__
MEM_BUFFER    = __RAM_START__+1

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   read_data

      .code

init:
      lda #%11100000           ; PA5, PA6 and PA7 are outputs
      sta VIA1_DDRA
      lda #%11111111           ; PORTB is all output
      sta VIA1_DDRB
      lda #%00000000           ; Initialize port outputs with $00
      sta VIA1_PORTA
      sta VIA1_PORTB

handshake_init:
      stz VIA2_DDRA            ; VIA2 PORTA is all input
                               ; define read handshake on VIA2 CA1/CA2
      lda #(VIA_PCR_CA1_INTERRUPT_NEGATIVE | VIA_PCR_CA2_OUTPUT_HANDSHAKE | VIA_PCR_CB1_INTERRUPT_NEGATIVE | VIA_PCR_CB2_OUTPUT_HIGH)
      sta VIA2_PCR
                               ; enable interrupt from VIA2 on CA1 (Data ready)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_CA1_FLAG)
      sta VIA2_IER
      cli                      ; enable interrupt processing

lcd_init:
      ldx #$00                 ; Initialize counter (register X)
loop_init_seq:
      lda lcd_init_sequence,x  ; Fetch data from address lcd_init_sequence + x
      beq program_loop         ; If fetched $00 (end of stream), move to main loop
      sta VIA1_PORTB                ; Send data to PORTB
      lda #(COMMAND_MODE | WRITE_MODE | PULSE) ; Set write command mode with active pulse
      sta VIA1_PORTA
      and #NPULSE              ; Disable pulse bit (E) and send to LCD
      sta VIA1_PORTA
      inx                      ; Increase counter
      jmp loop_init_seq        ; Keep looping over init sequence

      ldx #00                  ; set display index to 0
      stz WRITE_INDEX          ; set buffer index to 0
      ldy #00                  ; set internal buffer pointer to 0

program_loop:
      cpx WRITE_INDEX
      beq program_loop
      inx
      lda MEM_BUFFER,x         ; Load data bytes from address data + x
      sta VIA1_PORTB
      lda #(DATA_MODE | WRITE_MODE | PULSE) ; Set write data mode with active pulse
      sta VIA1_PORTA
      and #NPULSE              ; Disable pulse bit (E)
      sta VIA1_PORTA
      jmp program_loop

read_data:
      lda VIA2_PORTA           ; should trigger data taken signal
      sta MEM_BUFFER,y
      iny
      sty WRITE_INDEX
      rti

lcd_init_sequence:
      .byte %00111100
      .byte %00001100
      .byte %00000110
      .byte %00000001
      .byte %00000000

