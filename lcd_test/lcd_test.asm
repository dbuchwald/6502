PORTB         .equ $6000
PORTA         .equ $6001
DDRB          .equ $6002
DDRA          .equ $6003

COMMAND_MODE  .equ %00000000
DATA_MODE     .equ %00100000
WRITE_MODE    .equ %00000000
READ_MODE     .equ %01000000
PULSE         .equ %10000000

NPULSE        .equ %01111111

ROM_START     .equ $8000
RESET_VECTOR  .equ $fffc

  .org ROM_START
init:
  lda #%11100000           ; PA5, PA6 and PA7 are outputs
  sta DDRA 
  lda #%11111111           ; PORTB is all output
  sta DDRB
  lda #%00000000           ; Initialize port outputs with $00
  sta PORTA
  sta PORTB
  ldx #$00                 ; Initialize counter (register X)
loop_init_seq:
  lda lcd_init_sequence,x  ; Fetch data from address lcd_init_sequence + x
  beq data_display         ; If fetched $00 (end of stream), move to data transmission
  sta PORTB                ; Send data to PORTB
  lda #(COMMAND_MODE | WRITE_MODE | PULSE) ; Set write command mode with active pulse
  sta PORTA
  and #NPULSE              ; Disable pulse bit (E) and send to LCD
  sta PORTA
  inx                      ; Increase counter
  jmp loop_init_seq        ; Keep looping over init sequence

data_display:
  ldx #$00                 ; Initialize counter
loop_data:
  lda data,x               ; Load data bytes from address data + x
  beq end_prog             ; On end of stream move to end of program
  sta PORTB
  lda #(DATA_MODE | WRITE_MODE | PULSE) ; Set write data mode with active pulse
  sta PORTA
  and #NPULSE              ; Disable pulse bit (E) 
  sta PORTA
  inx                      ; Increase counter
  jmp loop_data
end_prog:
  jmp end_prog

lcd_init_sequence:
  byte %00111100
  byte %00001100
  byte %00000110
  byte %00000001
  byte %00000000
 
data:
  byte "Merry Christmas!",$00

  .org RESET_VECTOR
  word init
  word $0000

