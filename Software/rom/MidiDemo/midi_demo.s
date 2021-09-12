      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
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

      .code
init:  
      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init

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
@not_midi_event:
      lda #VIA_IFR_TIME_OUT_T1      ; clear the T1 interrupt
      sta VIA2_IFR
@not_midi_tick:
@not_via2:
      pla
      rti


      .segment "RODATA"

midi_data:

;   .byte  $ec, $60   ;  wallTime = 13920, Time=14490720us, 13920 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 13920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 14380, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 14380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 14400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 14400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 15820, Time=1478220us, 1420 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 15820, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 15840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS5_L4, NOTE_GS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 15840, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 16060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS5_L4, NOTE_GS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 16080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS5_L4, NOTE_FS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 16300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS5_L4, NOTE_FS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 16300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 16320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 16320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 16540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 16560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 16780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 16780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 16800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 16800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 17020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 17040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 17260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 17260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 17280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 17280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 17500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 17500, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 17520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 17520, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 17740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 17740, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 17760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 17760, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 17980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 17980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 18000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 18000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 18220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 18220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 18240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 18240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 18460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 18480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 18700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 18700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 18720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 18720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 18940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 18960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 19180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 19180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 19200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 19200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 19420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 19420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 19440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 19440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 19660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 19660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 19680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 19680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 19900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 19900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 19920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 19920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 20140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 20140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 20160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 20160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 20380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 20400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 20620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 20620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 20640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 20640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 20860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 20880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 21100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 21100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 21120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 21220, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 21340, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 21460, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 21580, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 21580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 21600, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 22060, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 22060, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 22320, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 22540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 22540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 22560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 22560, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 22780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 22800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 23020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 23020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 23040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 23040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 23260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 23280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 23500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 23520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 23740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 23760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 23980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 23980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 24000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 24220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 24240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 24460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 24480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 24480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 24700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 24720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 24940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 24940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 24960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 24960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 25180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 25200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 25420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 25440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 25660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 25680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 25900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 25900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 25920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 26140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 26160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 26380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 26400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 26400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 26620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 26640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 26860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 26860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 26880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 26880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 27100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 27120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 27340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 27360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 27580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 27600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 27820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 27820, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 27840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 28060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 28080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 28300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 28320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 28320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 28540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 28560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 28780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 28780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 28800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 28800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 29260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 29280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 29740, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 29740, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 29760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 30700, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 30720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 31660, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 31660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 32160, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 33100, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 33120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 33340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 33360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 33580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 33580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 33600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 34060, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 34080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 34080, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 34540, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 34540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 34560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 34560, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 35500, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 35500, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 36000, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 36000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 36460, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 36460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 36480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 36480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 36940, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 36940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 36960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 37420, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 37440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 37540, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 37560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 37660, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 37680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 37900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 37920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 37920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 38380, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 38380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 38400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 38400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 38860, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 38860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 38880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 39340, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 39360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 39460, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 39480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 39580, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 39600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 39820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 39840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 39840, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 40300, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 40300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 40320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 40320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 41260, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 41260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 41260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 41760, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 41760, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 42220, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 42220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 42240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 42240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 43180, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 43180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 43180, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 43680, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 43680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 43680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 44140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 44140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 44140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 44160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 44160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 44160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $9d, $6c   ;  wallTime = 47980, Time=3976620us, 3820 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 47980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 48000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 48220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 48220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 48240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 48460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 48460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 48480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 48700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 48940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 48940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 50860, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 50860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 50880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 50880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 51820, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 51820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 51840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 51840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 52780, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 52780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 52800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 52800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 53740, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 53740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 53760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 53760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 53980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 54000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 54220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 54220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 54240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 54240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 54460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 54460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 54480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 54480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 54700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 54700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 54720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 54720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 54940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 54960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 55180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 55200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 55420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 55440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 55660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 55680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 55900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 55920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 56140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 56140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 56160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 56160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 56380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 56380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 56400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 56400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 56620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 56620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 56640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 56640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 56860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 56880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 57100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 57120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 57340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 57360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 57580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 57600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 58060, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 58060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 58080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 58540, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 58560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 60460, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 60460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 60480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 60480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 62380, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 62380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 62400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 62400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 64300, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 64300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 64320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 64320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 65260, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 65260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 65280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 65280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 67180, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 67180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 67200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 67200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 69100, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 69100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 69100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 69120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 69120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 69120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 71020, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 71020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 71040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 71040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 72940, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 72940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 72940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 72960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 72960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 72960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 74860, Time=1977900us, 1900 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 74860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 74860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 74880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 74880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 74880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 75820, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 75820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 75840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 75840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 76780, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 76780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 76780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 76800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 76800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 76800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $92, $4c   ;  wallTime = 79180, Time=2477580us, 2380 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 79180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 79200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 79200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 79660, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 79660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 79660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 79680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 79680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 80140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 80140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 80140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 80160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 80160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 80160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 80620, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 80620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 80620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 80640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 80640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 80640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 82780, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 82780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 82800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 82800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 83020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 83040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 83040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 83260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 83280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 83280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 83500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83500, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 83520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 83520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 83740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 83760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 83760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C3_L4, NOTE_C3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 83980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 83980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C3_L4, NOTE_C3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 84000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 84000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 84220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 84220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 84240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 84240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 84460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 84460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 84480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 84480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 84700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 84720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C6_L4, NOTE_C6_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 84940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C6_L4, NOTE_C6_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 84960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS5_L4, NOTE_AS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 84960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 85180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS5_L4, NOTE_AS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 85200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 85420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 85420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 85440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS5_L4, NOTE_AS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 85440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 85660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS5_L4, NOTE_AS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 85680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 85900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 85920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 86140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 86160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 86380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 86380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 86400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 86400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 86620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 86640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 86860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 86860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 86880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 86880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 87340, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 87340, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 87840, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 87840, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 88300, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 88300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 88300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 88320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 88320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 88320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 88780, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 88780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 88800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 88800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 89260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 89260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 89520, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 89520, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 89740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 89740, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 89760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 89760, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 89980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 89980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 90000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 90000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 90220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 90220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 90220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 90240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 90240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 90240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 90700, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 90700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 90720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 90720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 91180, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 91180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 91200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 91200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 91660, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 91660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 91680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 91680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 92140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 92140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 92140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 92160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 92160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 92620, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 92620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 92640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 92860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 93100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 93100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 93120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 94060, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 94060, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 94060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 94080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 94080, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 94080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 94540, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 94540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 94560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 94560, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 95020, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 95020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 95020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 95040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 95040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 95040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 96220, Time=1228380us, 1180 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 96220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 96240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 96240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 96460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 96460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 96480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 96480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 96700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 96700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 96720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 96720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 96940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 96940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 96960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 96960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 97180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 97180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 97200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 97200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 97420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 97420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 97440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 97440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 97660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 97660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 97680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 97680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 97900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 97900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 97920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 97920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 98140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 98160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 98380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 98380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 98400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 98400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 98620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 98640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 98860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 98860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 98860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 98880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 98880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 100060, Time=1228380us, 1180 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 100080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 100300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 100300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 100320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 100320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 100540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 100560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 100780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 100780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 100800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 100800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 101980, Time=1228380us, 1180 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 102000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 102220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 102220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 102240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 102240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 102460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 102480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 102700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 102700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 102720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 102720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 103900, Time=1228380us, 1180 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 103920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 104140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 104140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 104160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 104160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 104380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 104400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 104620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 104620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 104620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 104640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 104640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 104640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 104860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 104880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 105100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 105100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 105120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 105120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 105340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 105360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 105580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 105580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 105580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 105600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 105600, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 105600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 105820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 105840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 106060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 106060, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 106080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 106080, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 106300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 106320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 106540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 106540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 106540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 106560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 106560, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 106560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 106780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 106800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 107020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 107020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 107040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 107040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 107260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 107280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 107500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 107500, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 107500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 107520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 107520, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 107520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 107980, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 107980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 107980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 108000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 108000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 108000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 108460, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 108460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 108460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 108480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 108480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 108480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 108940, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 108940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 108940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 108960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 108960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 108960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 109420, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 109420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 109420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 109440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 109440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 109440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 109660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 109660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 109680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 109680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 109900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 109900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 109900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 109920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 109920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 109920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 110140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 110140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 110160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 110160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 110380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 110380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 110380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 110400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 110400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 110620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 110620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 110640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 110640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 110860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 110860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 110880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 110880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 111100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 111100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 111120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 111120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 111340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 111340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 111360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 111360, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 111360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 111580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 111600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 111820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 111840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 112060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 112080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 112300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 112300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 112320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 112540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 112560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 112780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 112800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 113020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 113040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 113260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 113260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 113280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 113280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 113740, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 113760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 114220, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 114480, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 114700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 114720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 114940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 114960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 115180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 115180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 115200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 115200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 115660, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 115680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 116140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 116160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 116620, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 116640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 117100, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 117100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 117120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 117120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 117580, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 117600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 118060, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 118080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 118540, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 118560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 119020, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 119020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 119040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 119040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 119260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 119280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 119500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 119520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 119740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 119760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 119980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 120000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 120220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 120240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 120460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 120480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 121180, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 121200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 121420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 121440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 122140, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 122160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 122380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 122400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 122620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 122640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 122860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 122860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 122880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 122880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 123100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 123120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 123340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 123360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 123580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 123600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 123820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 123840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 124060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 124080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 124300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 124320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 125020, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 125040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 125260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 125260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 125280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 125280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 125500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 125520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 125740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 125740, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 125760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 125760, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 125980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 126000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 126220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 126220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 126240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 126240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 126460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 126480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 126700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 126700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 126720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 126720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 128860, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 128880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 129100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 129120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 129340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 129360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 129580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 129600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 129820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 129840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 130060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 130080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 130300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 130320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 130540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 130560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 132700, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 132720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 132940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 132940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 132960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 133180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 133200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 133420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 133440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 133660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 133680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 133900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 133920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 134140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 134160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 134380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 134400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 136540, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 136560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 136780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 136780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 136800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 137020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 137040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 137260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 137280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 137500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 137520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 137740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 137760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 137980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 138000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 138220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 138240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 138240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 138460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 138480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 138700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 138720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 138720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 138940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 138960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 139180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 139180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 139200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 139200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 139420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 139440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 139660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 139680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 139900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 139920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 140140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 140140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 140160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 140160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 140620, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 140620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $92, $74   ;  wallTime = 143040, Time=2519220us, 2420 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 143040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 144460, Time=1478220us, 1420 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 144460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 144480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 144480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 144940, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 144940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 145440, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 145440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 145900, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 145900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 145900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 145920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 145920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 145920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 146140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 146140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 146160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 146380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 146380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 146400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 146620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 146860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 146860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 147100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 147120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 147120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 147340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 147340, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 147360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 147360, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 147580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 147580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 147600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 147600, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 147820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 147820, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 147820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 147840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 147840, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 147840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 148300, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 148300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 148320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 148320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 148780, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 148780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 148780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 148800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 148800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 148800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 149260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 149260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 149280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 149280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 149980, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 149980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 150000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 150000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 150220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 150220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 150240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 150240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 150460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 150460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 150480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 150480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 150700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 150700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 150720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 150720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 150940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 150940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 150960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 150960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 151180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 151180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 151200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 151200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 151420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 151420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 151440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 151440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 151660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 151660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 151680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 151680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 152620, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 152620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 152620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 152640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 152640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 152640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 153100, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 153100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 153120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 153120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 153580, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 153580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 153600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 153600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $92, $4c   ;  wallTime = 155980, Time=2477580us, 2380 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 155980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 155980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 156000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 156000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 156460, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 156460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 156480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 156480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 156940, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 156940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 156960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 156960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 157420, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 157420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 157440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 157440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $92, $4c   ;  wallTime = 159820, Time=2477580us, 2380 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 159820, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 159820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 159840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 159840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 160300, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 160300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 160320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 160320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 160780, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 160780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 160800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 160800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 161260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 161260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 161520, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 161740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 161740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 161760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 161760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 161980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 162000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 162220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 162220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 162240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 162240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 162460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 162480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 162700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 162700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 162720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 162720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 162940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 162960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 163180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 163180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 163180, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 163200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 163200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 163200, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 163420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 163440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 163660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 163660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 163680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 163680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 163900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 163920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 164140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 164140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 164160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 164160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 164380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 164400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 164620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 164620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 164640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 164640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 164860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 164880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 165100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 165100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 165100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 165120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 165120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 165120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 165340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 165360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 165580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 165580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 165600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 165600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 165820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 165820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 165840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 165840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 166060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 166060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 166080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 166080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 166300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 166320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 166540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 166540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 166560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 166560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 166780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 166800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 167020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 167020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 167040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 167040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 167260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 167260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 167280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 167280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 167500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 167500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 167520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 167520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 167740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 167740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 167760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 167760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 167980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 167980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 168000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 168000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 168220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 168220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 168240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 168240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 168460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 168460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 168480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 168480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 168700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 168700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 168720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 168720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 168940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 168940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 168960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 168960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 169420, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 169420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 169420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 169440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 169440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 169440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 169900, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 169900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 169900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 169920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 169920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 169920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 171340, Time=1478220us, 1420 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 171340, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 171340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 171360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 171360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 171580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 171580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 171600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 171600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 171820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 171820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 171840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 171840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 172060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 172060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 172080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 172080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 172300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 172300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 172320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 172320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 172540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 172560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 172780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 172800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 173020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 173040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 173260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 173260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 173280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 173280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 173500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 173520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 173740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 173740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 173760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 173760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 173980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 174000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 174000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 174220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 174220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 174240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 174240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 174460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 174460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 174480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 174480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 174700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 174700, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 174720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 174720, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 174940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 174960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 175180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 175180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 175180, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 175200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 175200, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 175420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 175440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 175660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 175660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 175680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 175680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 175900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 175920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 175920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 176140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 176160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 176160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 176160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 176380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 176400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 176400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 176620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 176640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 176640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 176640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 176740, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 176760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 176860, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 176860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 176880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 176880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 176980, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 177000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 177100, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 177100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 177100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 177120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 177120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 177120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 177580, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 177580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 177580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 177840, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 177840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 178060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 178060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 178080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 178080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 178300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 178300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 178320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 178320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 178540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 178540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 178560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 178560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 178780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 178800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 179020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A5_L4, NOTE_A5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 179020, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 179020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 179040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 179040, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 179260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 179280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 179500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 179520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 179740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 179760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 179980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 179980, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 180000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 180000, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 180220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 180220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 180240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 180240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 180460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 180460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 180480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 180480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 180700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 180720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 180940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 180940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 180960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 180960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 180960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 181180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 181200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 181420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 181420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 181420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 181440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 181440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 181440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 181660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 181680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 181900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 181900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 181920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 181920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 182140, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 182160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 182380, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 182380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 182380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 182400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 182400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 182400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 182620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 182640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 182860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 182860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 182860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 182880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 183100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 183120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 183340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 183360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 183580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 183600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 183820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 183840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 183840, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 183840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 184060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 184080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 184300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 184300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 184300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 184320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 184320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 184320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 184540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 184560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 184780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 184780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 184780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 184800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 184800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 185020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 185040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 185260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 185260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 185280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 185280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 185500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 185520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 185740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 185740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 185760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 185760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 185980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 186000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 186220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 186220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 186240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 186240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 188380, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 188400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 188620, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 188640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 188640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 188860, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 188880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 189100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 189100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 189120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 189120, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 189340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 189360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 189580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 189600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 189820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 189840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 190060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 190060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 190080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 190080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 190540, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 190540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $92, $74   ;  wallTime = 192960, Time=2519220us, 2420 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 192960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 194380, Time=1478220us, 1420 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 194380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 194400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 194400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 194860, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 194860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 194880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 194880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 195340, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 195340, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 195360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 195360, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 195820, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 195820, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 195820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 196080, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 196080, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 196300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 196300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 196320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 196320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 196540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 196540, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 196560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 196780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 196800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 197260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 197260, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 197280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 197280, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 197740, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 197740, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 197740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 197760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 197760, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 197760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 198220, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 198220, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 198240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 198240, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 199180, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_G5_L4, NOTE_G5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 199180, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 199200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 199200, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 199420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 199420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 199440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 199440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 199660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 199660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 199660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 199680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 199680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 199680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 200140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 200140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 200160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 200160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 200620, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 200620, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 200640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 200640, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 201100, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 201100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $df, $64   ;  wallTime = 213360, Time=12762660us, 12260 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 213580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 213580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 213580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 213600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 213600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 213820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 213840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 214060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 214060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 214080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 214080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 214300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 214320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 214540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 214540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 214560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 214560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 214780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 214800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 215020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 215020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 215040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 215040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 215260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 215280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 215500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 215520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 215740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 215760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 215980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 215980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 216000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 216000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 216220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 216240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 216460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 216460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 216480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 216480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 216700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 216720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 216940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 216940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 216960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 216960, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 217420, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 217420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 217420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 217440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 217440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 217900, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 217900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 217920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 217920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 218380, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 218380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 218400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 218400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 218860, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 218860, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 218880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 218880, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 219100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 219120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 219340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 219360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 219580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 219600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 219820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 219840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 220060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 220080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 220300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 220320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 220540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 220560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 220780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 220800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 221260, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 221260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 221280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 221280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 222220, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 222220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 222240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 222240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 222940, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 222960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 223180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 223180, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 223200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 224140, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 224160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 224860, Time=728700us, 700 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 224880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 225100, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 225100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 225120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 225340, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 225360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 225580, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 225600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 225820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 225840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 226060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 226080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 226300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 226320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 226540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 226560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 226560, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 226780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 226800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 227020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 227040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 227040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 227260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 227280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 227500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 227500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 227520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 227520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 227740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 227760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 227980, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 228000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 228220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 228240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 228460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 228460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 228480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 228480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 229420, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 229420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 229920, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 229920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 230380, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 230380, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 230380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 230400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 230400, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 230400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 231580, Time=1228380us, 1180 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 231580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 231600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 231600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 231820, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 231820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 231840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 231840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 232060, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 232060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 232080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 232080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 232300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 232300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 232300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 232320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 232320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 232320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $9d, $6c   ;  wallTime = 236140, Time=3976620us, 3820 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 236140, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 236140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 236160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 236160, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 236160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 237100, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 237100, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 237100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 237600, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 237600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 238060, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 238060, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 238060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 238080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 238080, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 238080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 239020, Time=978540us, 940 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 239020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 239520, Time=520500us, 500 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 239520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 239980, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 239980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_DS3_L4, NOTE_DS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 240000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 240000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 240220, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 240240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 240460, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 240460, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 240480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 240480, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 240700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 240720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 240940, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 240940, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 240940, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 240960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 240960, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 241180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 241200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 241420, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 241420, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 241440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 241440, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 241440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 241660, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 241680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 241900, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 241900, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 241900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 241920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 241920, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 241920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 244060, Time=2227740us, 2140 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 244080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 244300, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 244300, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 244300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 244320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 244320, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 244320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 244540, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 244560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 244780, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 244780, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 244780, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 244800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 244800, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 244800, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 245020, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 245040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 245260, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 245260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 245280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 245280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 245500, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 245520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 245740, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 245740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 245760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 245760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 247180, Time=1478220us, 1420 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 247200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 247660, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 247660, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 247660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 247680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 247680, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 247680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 248140, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248260, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248380, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248500, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248620, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248740, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248860, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 248880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 248980, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 249000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $64   ;  wallTime = 249100, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 249120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 249580, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 249580, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 249580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 249600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $00   ;  wallTime = 249600, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 249600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $ac, $6c   ;  wallTime = 255340, Time=5975340us, 5740 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 255340, Time=0us, 0 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 255340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $60   ;  wallTime = 480, Time=4029658036us, 480 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 940, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 2380, Time=1478220us, 1420 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 2400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 2620, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 2640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 2860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 2880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 3100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 3120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 3340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 3360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 3580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 3600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 3820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 3840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 4060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 4300, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 4540, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 4780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 5020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 5260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 5500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 5740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 5980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 6220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 6460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 6700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 6940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 7180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 7420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 7660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 7780, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 7900, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8020, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8140, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 8380, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 8880, Time=520500us, 500 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 9100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 9340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 9580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 9820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 10060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 10300, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 10540, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 10780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 11020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 11260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 11500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 11740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 11980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 12000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 12220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 12240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 12460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 12480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 12700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 12720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 12940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 12960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 13180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 13200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 13420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 13440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 13660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 13680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 13900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 14140, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 14160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 14620, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 14640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 14860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 14880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 15100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 15120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 15340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 15360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 21820, Time=6724860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 21840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 22080, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $74   ;  wallTime = 30240, Time=8494560us, 500 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 31180, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 31200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 31420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 31440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 31680, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 32620, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 32640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 35020, Time=2477580us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 35040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 35260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 35280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 35520, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 35980, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $4c   ;  wallTime = 42700, Time=6995520us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 42700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 42720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 42720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $82, $04   ;  wallTime = 43440, Time=749520us, 260 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 43440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 43660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 43660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 43900, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 43900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 43920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 43920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 44380, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 44380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 44400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 44400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 44620, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 44620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 44640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 44640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 44860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 44860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 44880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 44880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 45100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 45100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 45120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 45120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 45340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 45340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 45360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 45360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 45580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 45580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 45600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 45600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 45820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 45820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 45840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 45840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 46060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 46060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 46080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 46080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 46540, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 46540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $e1, $54   ;  wallTime = 59040, Time=13012500us, 12500 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 59500, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 59520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 59740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 59760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 59980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 60000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 60220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 60240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 60700, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 60720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 60940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 60960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 61180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 61200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 61420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 61440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 61660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 61680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 61900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 61920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 62140, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 62160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 62620, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 62640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 62860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 62880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 63100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 63120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 63340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 63360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 63580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 63600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 63820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 63840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 64060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 64080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 64540, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 64560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 64780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 64800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 65020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 65040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 65500, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 65520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 65740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 65760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 65760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 65980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 66000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 66220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 66220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 66240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 66240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 66460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 66480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 66700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 66720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 66940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 66960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 67660, Time=728700us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 67660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 67680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 67680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 68140, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 68140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 68640, Time=520500us, 500 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 68640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 69580, Time=978540us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 69580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 69600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 69600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 70060, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 70060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 70080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 70080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 70540, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 70540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 70560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 70560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 71500, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 71500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 71520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 71520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 71740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 71740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 71760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 71760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 71980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 71980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 72000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 72000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 72460, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 72460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 72480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 72480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 73420, Time=978540us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 73420, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 73440, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 73660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 73660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 73900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 74380, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 74380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 74400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 74400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 75340, Time=978540us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 75340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 75360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 75360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 76300, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 76300, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 76320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 76320, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 77260, Time=978540us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 77260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 77280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 77280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 77740, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 77740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 77760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 77760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 78220, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 78220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 78240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 78240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 78460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 78460, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 78480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 78480, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 78700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 78700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 78720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 78720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 78940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 78960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 79420, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 79440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 79900, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 79920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 79920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 80380, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 80380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 80400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 80400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 81100, Time=728700us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 81100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 81120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 81120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 81580, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 81580, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 81600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 81600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 82060, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 82060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 82080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 82080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 82540, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 82540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 82560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 82560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 87100, Time=4726140us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 87120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 87360, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 87580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 87600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 87820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 88060, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 88080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 88540, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 88560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 89020, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 89040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 89280, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 89500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 90460, Time=999360us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 90480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 90940, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 90960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 91420, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 91440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 91900, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 91920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 92260, Time=353940us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 92380, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 92500, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 92520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $82, $04   ;  wallTime = 93360, Time=874440us, 260 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 93580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 93600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 93820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 93840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 94300, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 94320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 94780, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 94800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 95260, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 95280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 95500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 95520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 95740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 95760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 95980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 95980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 96000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 96000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $82, $04   ;  wallTime = 99120, Time=3247920us, 260 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 99340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 99340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 99360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 99360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 99580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 99600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 99820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 99820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 99840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 99840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 101020, Time=1228380us, 1180 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 101040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 101260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 101260, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 101280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 101280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 101500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 101520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 101740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 101740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 101760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 101760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $89, $1c   ;  wallTime = 102940, Time=1228380us, 1180 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 102960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 103180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 103180, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 103200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 103200, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 103420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 103440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 103660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 103660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 103680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 103680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 120940, Time=17967660us, 1900 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 120960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 121900, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 121920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 126940, Time=5225820us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 126960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 127180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 127200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 127420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 127440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 127660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 127680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 127900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 127920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 128140, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 128160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 128380, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 128400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 128620, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 128640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 130780, Time=2227740us, 2140 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 130800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 131020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 131040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 131260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 131280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 131500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 131520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 131740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 131760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 131980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 132000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 132220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 132240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 132460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 132480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $8d, $24   ;  wallTime = 134640, Time=2248560us, 1700 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 134860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 134880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 135100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 135120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 135340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 135360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 135580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 135600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 135820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 135840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 136060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 136080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 136300, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 136320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 140640, Time=4497120us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 140860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 140880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 141100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 141120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 141340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 141360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 141580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 141600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 141820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 141840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 142060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 142060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 142080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 142080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 142300, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 142320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 142540, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 142560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 142780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 142800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 143020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 143260, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 143280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 143500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 143520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 143740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 143760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 143980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 143980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 144000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 144000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 144220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 144240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 144700, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 144720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 144960, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 145180, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 145200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 145420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 145660, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 145680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 146020, Time=353940us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 146260, Time=229020us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 146280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 148060, Time=1852980us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 148080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 148540, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 148560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 149020, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 149040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 149500, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 149520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 149740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 149740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 149760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 149760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 152140, Time=2477580us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 152140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 152160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 152160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 154060, Time=1977900us, 1420 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 154060, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 154080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 154080, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 154540, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 154540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 154560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 154560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 155020, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 155020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 155040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 155040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 155500, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 155500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 155520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 155520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $8f, $14   ;  wallTime = 157920, Time=2498400us, 1940 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 157920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 158380, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 158380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 158400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 158400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 158860, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 158860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 158880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 158880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 159340, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 159340, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 159360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 159360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $8b, $34   ;  wallTime = 161280, Time=1998720us, 1460 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 161280, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 169660, Time=8723580us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 169660, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 169680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 169680, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 170380, Time=728700us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_F5_L4, NOTE_F5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 170380, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 170400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 170400, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 170620, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 170620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 170640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 170640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 170860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 170860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 170880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 170880, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 177340, Time=6724860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 177360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 177600, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 177600, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 190560, Time=13491360us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 190780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 190800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 191020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B4_L4, NOTE_B4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 191040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 191260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 191280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 191500, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 191520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 191740, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 191760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 191980, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 191980, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 192000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 192000, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 192220, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 192240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 192460, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 192480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 192700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 192720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 192940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 193180, Time=249840us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 193200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 193420, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 193440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 193660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 193680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 193900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 193900, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 193920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 193920, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 194140, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 194160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 194620, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 194640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 195100, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 195120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 195580, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 195600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 195840, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 195840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 195940, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 195960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 196060, Time=104100us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 196180, Time=124920us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 196200, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $74   ;  wallTime = 197040, Time=874440us, 500 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 197500, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 197520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 197980, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 198000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 198460, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 198480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 198700, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 198700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 198720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 198720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 198940, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 198960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 199900, Time=978540us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 199920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 200380, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 200400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 200860, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 200880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $14   ;  wallTime = 201120, Time=249840us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 201340, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 201360, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 201580, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 201600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 202540, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 202540, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 202560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 202560, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 203020, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 203020, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 203040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 203040, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 203500, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 203500, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 203520, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 203520, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 203980, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 204000, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 204460, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 204480, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 204940, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 204960, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 205420, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 205440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 207580, Time=2227740us, 2140 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 207600, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 207820, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 207840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 208060, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 208080, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 208300, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 208320, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 208540, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 208560, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 208780, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 208800, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 209020, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 209040, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 209260, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 209280, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 211420, Time=2227740us, 2140 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 211440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 211660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 211680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 211900, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 211920, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 212140, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 212140, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 212160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 212160, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 212380, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 212400, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 212620, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 212620, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 212640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 212640, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 212860, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 212880, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 213100, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 213100, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 213120, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 213120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $9c, $24   ;  wallTime = 217200, Time=4247280us, 3620 ticks
   .byte  SN76489_T2_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 217660, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 217680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 218140, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 218160, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 218620, Time=478860us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 218640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $96, $2c   ;  wallTime = 221740, Time=3227100us, 2860 ticks
   .byte  SN76489_T2_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 221740, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 221760, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 221760, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 222700, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 222700, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 222720, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 222720, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $85, $3c   ;  wallTime = 223420, Time=728700us, 700 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 223440, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 223660, Time=229020us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 223680, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 224620, Time=978540us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 224640, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $8e, $6c   ;  wallTime = 234220, Time=9972780us, 1900 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 234220, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234240, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 234240, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 237120, Time=2998080us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 237120, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $87, $2c   ;  wallTime = 242860, Time=5975340us, 940 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 242860, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 243360, Time=520500us, 500 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 243360, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 243820, Time=478860us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $00   ;  wallTime = 243820, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 243840, Time=20820us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $00   ;  wallTime = 243840, Time=0us, 0 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $82, $be, $60   ;  wallTime = 40800, Time=4083602656us, 40800 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 41280, Time=499680us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 42940, Time=1728060us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS4_L4, NOTE_GS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 42960, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 43200, Time=249840us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 43420, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 46300, Time=2998080us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 46320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 46560, Time=249840us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 46780, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 46800, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 47020, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 47040, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 47260, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 47280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 47500, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 47520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 47740, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 47760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 48100, Time=353940us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 48340, Time=229020us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 48360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $82, $04   ;  wallTime = 49200, Time=874440us, 260 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 49420, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 49440, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 49660, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 49680, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 49900, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 49920, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 50140, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 50160, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 50380, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 50400, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 50620, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 50640, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 51100, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 51120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 51340, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 51360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 51580, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 51600, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 52060, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 52080, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 52300, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 52320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 52540, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 52560, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 53020, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 53040, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 53260, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 53280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 53500, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 53520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 67900, Time=14969580us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 67920, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 68160, Time=249840us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 68380, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 68400, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 68620, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 68860, Time=249840us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 68880, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 69340, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 69360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 69820, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 69840, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 70300, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 70320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 70780, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 70800, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 71260, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 71280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 72220, Time=978540us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 72240, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 72700, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 72720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 73060, Time=353940us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73080, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 73180, Time=104100us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 73300, Time=104100us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 73320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $74   ;  wallTime = 74160, Time=874440us, 500 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 74620, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 74640, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 75100, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 75120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 75580, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 75600, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 76060, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 76080, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 76540, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 76560, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 77020, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 77040, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 77500, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 77520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 77980, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 78000, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 80860, Time=2977260us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 80880, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 81340, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 81360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 81820, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 81840, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 82300, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 82320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 107740, Time=26462220us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 107760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 108220, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 108240, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 108700, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 108720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 109180, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 109200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 153820, Time=46449420us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 153840, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 154300, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 154320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 154780, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 154800, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 155260, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 155280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 155740, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 155760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 156220, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 156240, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 156700, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 156720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 157180, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 157200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 157660, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 157680, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 157900, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 158140, Time=249840us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 158160, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 158620, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 158640, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 159100, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 159120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 159580, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 159600, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 160060, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 160080, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 160540, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 160560, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 161020, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 161040, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 169180, Time=8473740us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 169200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 170140, Time=978540us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 170160, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 171100, Time=978540us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 171120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 177820, Time=6974700us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 186460, Time=8994240us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 186480, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 186700, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 186720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 186940, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 186960, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 187180, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 187200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 187420, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 187440, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 187660, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 187680, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 187900, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 187920, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 188140, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 188160, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $92, $4c   ;  wallTime = 202060, Time=14469900us, 2380 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 202080, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $92, $4c   ;  wallTime = 205900, Time=3976620us, 2380 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 205920, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 206380, Time=478860us, 460 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 206400, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 206860, Time=478860us, 460 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 206880, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 207340, Time=478860us, 460 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 207360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $90, $5c   ;  wallTime = 209500, Time=2227740us, 2140 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 209520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 209740, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 209760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 209980, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 210000, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 210220, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 210240, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 210460, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 210480, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 210700, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 210720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 210940, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 210960, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 211180, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 211200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $9c, $24   ;  wallTime = 221040, Time=10243440us, 3620 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 221500, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 221520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 221980, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 222000, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 222460, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 222480, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $8b, $0c   ;  wallTime = 228940, Time=6724860us, 1420 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 228960, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 229180, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 229200, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 229440, Time=249840us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 229660, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 229680, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 229900, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 230140, Time=249840us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 230160, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 230620, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 230640, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 230860, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 230880, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 231100, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 231120, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 231340, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 231360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 232540, Time=1228380us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 232560, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 232780, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 232800, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 233020, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 233040, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 233260, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 233280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 233500, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 233520, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 233740, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 233760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 233980, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234000, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 234340, Time=353940us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 234460, Time=104100us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234480, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 234580, Time=104100us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234600, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $64   ;  wallTime = 234700, Time=104100us, 100 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 234720, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 234940, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $74   ;  wallTime = 235440, Time=520500us, 500 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 235660, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 235680, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 235900, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 235920, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 236380, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 236400, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 236620, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 236640, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 236860, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 236880, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 237340, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 237360, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 237580, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 237820, Time=249840us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 237840, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 238300, Time=478860us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 238320, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 238540, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 238560, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 238780, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 238800, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $14   ;  wallTime = 239040, Time=249840us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 239260, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 239280, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T3_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 239500, Time=229020us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 239740, Time=249840us, 220 ticks
   .byte  SN76489_T3_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T3_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 239760, Time=20820us, 20 ticks
   .byte  SN76489_T3_FREQ|NOTE_DS3_L4, NOTE_DS3_H6, (SN76489_T3_ATTN | $02)

   .byte $00
midi_data_end1 = *

; midi_data:

;    .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3b   ;  wallTime = 187, Time=486948us, 187 ticks
;    .byte  SN76489_T1_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $01   ;  wallTime = 188, Time=2604us, 1 ticks
;    .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3c   ;  wallTime = 376, Time=489552us, 188 ticks
;    .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $06   ;  wallTime = 382, Time=15624us, 6 ticks
;    .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3a   ;  wallTime = 568, Time=484344us, 186 ticks
;    .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $06   ;  wallTime = 574, Time=15624us, 6 ticks
;    .byte  SN76489_T1_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3d   ;  wallTime = 763, Time=492156us, 189 ticks
;    .byte  SN76489_T1_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $03   ;  wallTime = 766, Time=7812us, 3 ticks
;    .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3b   ;  wallTime = 953, Time=486948us, 187 ticks
;    .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $03   ;  wallTime = 956, Time=7812us, 3 ticks
;    .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3d   ;  wallTime = 1145, Time=492156us, 189 ticks
;    .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $00   ;  wallTime = 1145, Time=0us, 0 ticks
;    .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $3f   ;  wallTime = 1336, Time=497364us, 191 ticks
;    .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte  $01   ;  wallTime = 1337, Time=2604us, 1 ticks
;    .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $03)

;    .byte  $81, $42   ;  wallTime = 1531, Time=505176us, 194 ticks
;    .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

;    .byte $00
; midi_data_end1 = *

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
