      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"

      .include "via_const.inc"
      .include "via.inc"
      
      .include "SN76489_const.inc"
      .include "SN76489.inc"
      .include "utils.inc"

      .include "zeropage.inc"

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   irq_handler


      .code
init:  
      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init
      write_vdp #hello_msg
      write_lcd #hello_msg
      jsr _strobe_led

      jsr sn76489_init


      ; Beep to Show Life.
      jsr sn76489_high_beep
      jsr sn76489_low_beep
      jsr sn76489_high_beep
      jsr sn76489_low_beep
      
      ;lda #(VIA_ACR_T2_CONT_NO_PB7)
      lda #VIA_ACR_T1_CONT_SQUARE_PB7
      sta VIA2_ACR

      lda #(VIA_IER_CLEAR_FLAGS | $7F)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG)
      sta VIA2_IER

      lda #0
      sta midi_tick_countdown

      lda #<midi_data
      sta next_midi_event
      lda #>midi_data
      sta next_midi_event+1

      ; Hard Code - for now, the PHI2/Midi Tick
      lda #$2C
      sta VIA2_T1CL
      lda #$0A
      sta VIA2_T1CH
      cli

program_loop:
      jmp program_loop

irq_handler:
      pha
      lda VIA2_IFR
      bpl @not_via2

      and #VIA_IFR_TIME_OUT_T1
      beq @not_midi_tick

      jsr dec_midi_track_count
      bcc @not_midi_event

      jsr midi_update

@not_midi_event:
      lda #VIA_IFR_TIME_OUT_T1      ; clear the T1 nterrupt
      sta VIA2_IFR
@not_midi_tick:
@not_via2:
      pla
      rti

midi_update:
      pha
      phy

      lda #(BLINK_LED_ON)
      jsr _blink_led

      ; lda #<temp_midi_data
      ; sta next_midi_event
      ; lda #>temp_midi_data
      ; sta next_midi_event+1

      ; y will index bytes until event completed
      jsr Load_Midi_Tick_Count

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

      ; now update next_midi_event
      tya
      adc next_midi_event
      sta next_midi_event
      bcc @no_carry
      inc next_midi_event+1
@no_carry:
      cmp #<midi_data_end
      bne @not_done

      lda next_midi_event + 1 
      cmp #>midi_data_end
      bne @not_done

      ; Go back to the beginning
      lda #<midi_data
      sta next_midi_event
      lda #>midi_data
      sta next_midi_event+1

@not_done:
      lda #(BLINK_LED_OFF)
      jsr _blink_led

      ply
      pla
      rts

;
; Load the Tick Count Until the Next Event
; next_midi_byte, x should point to the first byte of a variable length word
; ref: http://forum.6502.org/viewtopic.php?t=5415
;
; Uses y index register - returns with the number of 
;
Load_Midi_Tick_Count:
      pha 
      ;phy

      stz midi_tick_countdown           ; initialize to zero, will be LSB of result
      stz midi_tick_countdown + 1
      stz midi_tick_countdown + 2
      stz midi_tick_countdown + 3       ; msb
      ldy #0
@next_byte:
      lda (next_midi_event), y          ; get byte of variable-length value
      bpl @last_byte
      and #$7F             ; keep 'value' bits
      tay
      ror midi_tick_countdown + 3
      lda midi_tick_countdown + 2
      ror A
      STA midi_tick_countdown + 3
      lda midi_tick_countdown + 1
      ror A
      sta midi_tick_countdown + 2
      tya
      ora midi_tick_countdown
      ror A
      sta midi_tick_countdown + 1
      lda #0               
      ror A                ; gets back the lsb from above
      sta midi_tick_countdown
      iny
      bra @next_byte
@last_byte:
      ora midi_tick_countdown
      sta midi_tick_countdown

      iny
      ;ply
      pla
      rts


;
; Decrement Midi Tick Count
; Carry will be set when Tick Count reaches zero 
;
dec_midi_track_count:
      pha 
      phx

      clc
      ldx #0
@check_byte:
      lda midi_tick_countdown,x
      beq @carry1
      dec midi_tick_countdown,x
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





 
      .segment "RODATA"
hello_msg:
      .byte "Midi Test", $00

midi_data:

   .byte  $00   ;  wallTime = 0, Time=0us, 0 ticks
   .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3b   ;  wallTime = 187, Time=486948us, 187 ticks
   .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $01   ;  wallTime = 188, Time=2604us, 1 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3c   ;  wallTime = 376, Time=489552us, 188 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $06   ;  wallTime = 382, Time=15624us, 6 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3a   ;  wallTime = 568, Time=484344us, 186 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $06   ;  wallTime = 574, Time=15624us, 6 ticks
   .byte  SN76489_T1_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3d   ;  wallTime = 763, Time=492156us, 189 ticks
   .byte  SN76489_T1_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $03   ;  wallTime = 766, Time=7812us, 3 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3b   ;  wallTime = 953, Time=486948us, 187 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $03   ;  wallTime = 956, Time=7812us, 3 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3d   ;  wallTime = 1145, Time=492156us, 189 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 1145, Time=0us, 0 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $3f   ;  wallTime = 1336, Time=497364us, 191 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $01   ;  wallTime = 1337, Time=2604us, 1 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $03)

   .byte  $81, $42   ;  wallTime = 1531, Time=505176us, 194 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF
midi_data_end = *