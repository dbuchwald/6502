    .include "SN76489_const.inc"
    .include "SN76489.inc"
    .include "zeropage.inc"

    .export load_midi_tick_count
    .export dec_midi_tick_count
    .export midi_update

; TODO: privitize these. 
    .export midi_first_event
    .export midi_data_end
    .export y_test

    .bss
midi_first_event: 
    .res 2    
midi_data_end:
    .res 2    
y_test:
    .res 4
    

    .code
;------------------------------------------------------------------------------
;
; Play the next Note Event
; Leave next_midi_event pointing to the next event
; and load midi_tick_count with the number of ticks
; until the next event
;
;------------------------------------------------------------------------------
midi_update:
      pha
      phy

      ; y will index bytes until event completed
      jsr load_midi_tick_count

      ;sty y_test

      ; out LS4 Bits of Freq
      lda (next_midi_event), y
      sta SN76489_LEFT
      sta SN76489_RIGHT
      iny

      ; out MS6 Bits of Freq
      lda (next_midi_event), y
      sta SN76489_LEFT
      sta SN76489_RIGHT
      iny

      ; output attenuation
      lda (next_midi_event), y
      sta SN76489_LEFT
      sta SN76489_RIGHT
      iny

;      lda next_midi_event
;     sta y_test  

      ; now update next_midi_event
      tya

;      sta y_test + 1

      clc 
      adc next_midi_event

;      sta y_test + 2

      sta next_midi_event
      bcc @no_carry
      inc next_midi_event + 1
@no_carry:
      cmp midi_data_end
      bne @not_done
  
      lda next_midi_event + 1 
      cmp midi_data_end + 1
      bne @not_done

      ; Go back to the beginning
      lda midi_first_event
      sta next_midi_event
      lda midi_first_event + 1
      sta next_midi_event + 1

@not_done:
      ply
      pla
      rts

       
;------------------------------------------------------------------------------
;
; Load the Tick Count Until the Next Event
; next_midi_byte, x should point to the first byte of a variable length word
; ref: http://forum.6502.org/viewtopic.php?t=5415
;
; Uses y index register - returns with the number of bytes read
; this value can be indexed to next_midi_byte to get the next byte to read
;
;------------------------------------------------------------------------------
load_midi_tick_count:
      pha 
      phx

      stz midi_tick_countdown           ; initialize to zero, will be LSB of result
      stz midi_tick_countdown + 1
      stz midi_tick_countdown + 2
      stz midi_tick_countdown + 3       ; msb
      ldy #0
@next_byte:
      lda (next_midi_event), y          ; get byte of variable-length value
      bpl @last_byte
      and #$7F             ; keep 'value' bits
      tax
      ror midi_tick_countdown + 3
      lda midi_tick_countdown + 2
      ror 
      sta midi_tick_countdown + 3
      lda midi_tick_countdown + 1
      ror 
      sta midi_tick_countdown + 2
      txa
      ora midi_tick_countdown
      ror 
      sta midi_tick_countdown + 1
      lda #0               
      ror                 ; gets back the lsb from above
      sta midi_tick_countdown
      iny
      bra @next_byte
@last_byte:
      ora midi_tick_countdown
      sta midi_tick_countdown

      iny
      plx
      pla
      rts


;------------------------------------------------------------------------------
;
; Decrement Midi Tick Count
; Carry will be set when Tick Count reaches zero 
;
;------------------------------------------------------------------------------
dec_midi_tick_count:
      pha 
      phx

      ldx #0
@check_byte:
      lda midi_tick_countdown,x
      beq @carry1
      dec midi_tick_countdown,x
      clc
      bra @done
@carry1:
      dec midi_tick_countdown,x
      inx
      cpx #4
      bne @check_byte
      sec

@done:  
      plx
      pla
      rts     