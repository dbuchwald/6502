      .setcpu "65C02"
      .include "via.inc"
      .include "via_const.inc"

COMMAND_MODE  = %00000000
DATA_MODE     = %00100000
WRITE_MODE    = %00000000
READ_MODE     = %01000000
PULSE         = %10000000

NPULSE        = %01111111

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   handle_irq

      .code

init:
      lda #%11100000           ; PA5, PA6 and PA7 are outputs
      sta VIA2_DDRA
      lda #%11111111           ; PORTB is all output
      sta VIA2_DDRB
      lda #%00000000           ; Initialize port outputs with $00
      sta VIA2_PORTA
      sta VIA2_PORTB
      ldx #$00                 ; Initialize counter (register X)

init_timer:
      lda #(VIA_ACR_T1_CONT_NO_PB7 | VIA_ACR_T2_TIMED | VIA_ACR_SR_DISABLED | VIA_ACR_PB_LATCH_DISABLE | VIA_ACR_PA_LATCH_DISABLE) ; T1 continuous, disable PB7
      sta VIA2_ACR
      lda #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG) ; Enable T1 interrupt
      sta VIA2_IER
      lda #50                  ; Every 50 clocks
      sta VIA2_T1CL
      lda #0
      sta VIA2_T1CH            ; Enable timer
      cli

loop_init_seq:
      lda lcd_init_sequence,x  ; Fetch data from address lcd_init_sequence + x
      beq data_display         ; If fetched $00 (end of stream), move to data transmission
      sta VIA2_PORTB                ; Send data to PORTB
      lda #(COMMAND_MODE | WRITE_MODE | PULSE) ; Set write command mode with active pulse
      sta VIA2_PORTA
      and #NPULSE              ; Disable pulse bit (E) and send to LCD
      sta VIA2_PORTA
      inx                      ; Increase counter
      jmp loop_init_seq        ; Keep looping over init sequence

data_display:
      ldx #$00                 ; Initialize counter
loop_data:
      lda data,x               ; Load data bytes from address data + x
      beq end_prog             ; On end of stream move to end of program
      sta VIA2_PORTB
      lda #(DATA_MODE | WRITE_MODE | PULSE) ; Set write data mode with active pulse
      sta VIA2_PORTA
      and #NPULSE              ; Disable pulse bit (E)
      sta VIA2_PORTA
      inx                      ; Increase counter
      jmp loop_data
end_prog:
      jmp end_prog

handle_irq:
      pha
      lda VIA2_PORTA
      eor #%00000001
      sta VIA2_PORTA
      lda VIA2_T1CL
      pla
      rti

lcd_init_sequence:
      .byte %00111100
      .byte %00001100
      .byte %00000110
      .byte %00000001
      .byte %00000000

data:
      .byte "Merry Christmas!",$00
