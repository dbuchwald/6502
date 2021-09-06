      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "tty.inc"

      .include "midi.inc"

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

      .BSS
temptemp:  .res 2      

      .code
init:  
      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init
      ;write_vdp #hello_msg
      ;write_lcd #hello_msg


      lda #( TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      writeln_tty #hello_msg

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


      lda #100
      sta midi_tick_countdown
      lda #0
      sta midi_tick_countdown +1
      sta midi_tick_countdown +2
      sta midi_tick_countdown +3

      sta temptemp
      sta temptemp+1

; midi init..
      lda #<midi_data
      sta next_midi_event
      sta midi_first_event

      lda #>midi_data
      sta midi_first_event + 1
      sta next_midi_event + 1
     
      lda #<midi_data_end1
      sta midi_data_end
      lda #>midi_data_end1
      sta midi_data_end + 1 

;---------------------
;       lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline

; ;      jsr Load_Midi_Tick_Count
;       jsr midi_update

;       write_tty_address midi_tick_countdown+2
;       write_tty_address midi_tick_countdown
;       jsr _tty_send_newline

;       lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline

;       ;      jsr Load_Midi_Tick_Count
;       jsr midi_update

;       write_tty_address midi_tick_countdown+2
;       write_tty_address midi_tick_countdown
;       jsr _tty_send_newline

;       lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline

;       ;      jsr Load_Midi_Tick_Count
;       jsr midi_update

;       write_tty_address midi_tick_countdown+2
;       write_tty_address midi_tick_countdown
;       jsr _tty_send_newline

;       lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline

;       ;      jsr Load_Midi_Tick_Count
;       jsr midi_update

;       write_tty_address midi_tick_countdown+2
;       write_tty_address midi_tick_countdown
;       jsr _tty_send_newline

;       lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline

;       ;      jsr Load_Midi_Tick_Count
;       jsr midi_update

;       write_tty_address midi_tick_countdown+2
;       write_tty_address midi_tick_countdown
;       jsr _tty_send_newline

;             lda #'$'
;       jsr _tty_send_character
;       write_tty_address next_midi_event
;       jsr _tty_send_newline
   
;-----------------------      

      ; Hard Code - for now, the PHI2/Midi Tick
      ; e.g. $A2C = 2604 us/tick
      ; 
      lda #$2C
      sta VIA2_T1CL
      lda #$08 ; was $08
      sta VIA2_T1CH
      cli

      lda #(BLINK_LED_ON)
program_loop:
      eor #BLINK_LED_ON
      jsr _blink_led
      jmp program_loop

irq_handler:
      pha
      lda VIA2_IFR
      bpl @not_via2

      and #VIA_IFR_TIME_OUT_T1
      beq @not_midi_tick

      jsr dec_midi_tick_count
      bcc @not_midi_event

@do_midi_update:
      jsr midi_update

      cmp midi_tick_countdown +3
      bne @midi_update_done

      cmp midi_tick_countdown +2
      bne @midi_update_done

      cmp midi_tick_countdown +1
      bne @midi_update_done

      cmp midi_tick_countdown
      beq @do_midi_update

@midi_update_done:
      ; lda #'$'
      ; jsr _tty_send_character
      ; write_tty_address midi_tick_countdown+2
      ; write_tty_address midi_tick_countdown
      
      ; lda #':'
      ; jsr _tty_send_character
      ; lda y_test
      ; jsr _tty_write_hex
      
      ; lda #'+'
      ; jsr _tty_send_character
      ; lda y_test + 1
      ; jsr _tty_write_hex      
      
      ; lda #'='
      ; jsr _tty_send_character
      ; lda y_test + 2
      ; jsr _tty_write_hex

      ; lda #'+'
      ; jsr _tty_send_character
      ; write_tty_address next_midi_event
      ; jsr _tty_send_newline

@not_midi_event:
      lda #VIA_IFR_TIME_OUT_T1      ; clear the T1 interrupt
      sta VIA2_IFR
@not_midi_tick:
@not_via2:
      pla
      rti


      .segment "RODATA"

midi_data:

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

   .byte $00
midi_data_end1 = *

; midi_data:
;    .byte  $00  ;  wallTime = 0, Time=0us, 0 ticks
;    .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $01  ;  wallTime = 0, Time=0us, 0 ticks
;    .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $03)

;    .byte  $00  ;  wallTime = 187, Time=486948us, 187 ticks
;    .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $12  ;  wallTime = 187, Time=486948us, 187 ticks
;    .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF


;    .byte  $00   ;  wallTime = 188, Time=2604us, 1 ticks
;    .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $03   ;  wallTime = 188, Time=2604us, 1 ticks
;    .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $00   ;  wallTime = 376, Time=489552us, 188 ticks
;    .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $14   ;  wallTime = 376, Time=489552us, 188 ticks
;    .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF


;     .byte  $81, $05  ;  wallTime = 188, Time=2604us, 1 ticks
;     .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $03)

;     .byte  $16    ;  wallTime = 376, Time=489552us, 188 ticks
;     .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF
   
;     .byte  $81, $07  ;  wallTime = 188, Time=2604us, 1 ticks
;     .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $03)

;     .byte  $18    ;  wallTime = 376, Time=489552us, 188 ticks
;     .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

; midi_data_end1 = *

hello_msg:
      .byte "Midi Test", $00
