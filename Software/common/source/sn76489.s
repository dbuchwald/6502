.include "SN76489_const.inc"
.include "utils.inc"

.import __SN76489L_START__
.import __SN76489R_START__

.export SN76489_LEFT
.export SN76489_RIGHT
.export sn76489_init

SN76489_LEFT  = __SN76489L_START__
SN76489_RIGHT = __SN76489R_START__

;
; Turn Everything Off
;
sn76489_init:
      lda #( SN76489_REG1_T1_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms

      lda #( SN76489_REG3_T2_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms


      lda #( SN76489_REG5_T3_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms

      lda #( SN76489_REG7_NOISE_ATTN | SN76489_ATTEN_OFF) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      lda #1  
      jsr _delay_ms


      rts

      

