.include "SN76489_const.inc"
.include "utils.inc"

.import __SN76489L_START__
.import __SN76489R_START__

.export SN76489_LEFT
.export SN76489_RIGHT
.export sn76489_init
.export sn76489_low_beep
.export sn76489_high_beep

SN76489_LEFT  = __SN76489L_START__
SN76489_RIGHT = __SN76489R_START__

;
; Turn Everything Off
;
sn76489_init:
      pha

      lda #( SN76489_T1_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms

      lda #( SN76489_T2_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms


      lda #( SN76489_T3_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms

      lda #( SN76489_NOISE_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms

      jsr sn76489_low_beep      

      lda #1  
      jsr _delay_ms

      pla
      rts

sn76489_low_beep:
      pha

      lda #(SN76489_T1_FREQ | NOTE_G3_L4 )
      sta SN76489_LEFT
      sta SN76489_RIGHT
            
      lda #( SN76489_FREQ_H6 | NOTE_G3_H6)
      sta SN76489_LEFT
      sta SN76489_RIGHT
      
      lda #(SN76489_T1_ATTN | SN76489_ATTEN_8DB)
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #200
      jsr _delay_ms

      lda #(SN76489_T1_ATTN | SN76489_ATTEN_OFF)
      sta SN76489_LEFT
      sta SN76489_RIGHT

      pla
      rts      

      
sn76489_high_beep:
      pha

      lda #(SN76489_T2_FREQ | NOTE_G5_L4 )
      sta SN76489_LEFT
      sta SN76489_RIGHT
            
      lda #( SN76489_FREQ_H6 | NOTE_G5_H6)
      sta SN76489_LEFT
      sta SN76489_RIGHT
      
      lda #(SN76489_T2_ATTN | SN76489_ATTEN_8DB)
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #200
      jsr _delay_ms

      lda #(SN76489_T2_ATTN | SN76489_ATTEN_OFF)
      sta SN76489_LEFT
      sta SN76489_RIGHT

      pla
      rts      

