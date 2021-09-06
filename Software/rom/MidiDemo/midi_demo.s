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
      lda #$02 ; was $08
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

;   .byte  $8f, $00   ;  wallTime = 1920, Time=1998720us, 1920 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $8f, $00   ;  wallTime = 1920, Time=0us, 1920 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2020, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2020, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 2040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 2040, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2140, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2140, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 2160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 2160, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2260, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2260, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 2400, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 2400, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2500, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2500, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 2640, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 2640, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2740, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2740, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 2880, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 2880, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 2980, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 2980, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 3120, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 3120, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 3580, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $4c   ;  wallTime = 3580, Time=0us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 3600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 3600, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 3700, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 3700, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 3840, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 3840, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 3940, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 3940, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 4080, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 4080, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4180, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4180, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 4200, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4300, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4300, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 4320, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4420, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4420, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 4560, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 4560, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4660, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4660, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 4680, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4780, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4780, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 4800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 4800, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 4900, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 4900, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 5040, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 5040, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 5140, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 5140, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 5160, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 5260, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 5260, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 5280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 5280, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 5380, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 5380, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 5520, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 5520, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 5980, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $4c   ;  wallTime = 5980, Time=0us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 6000, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 6100, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 6100, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 6120, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 6220, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 6220, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 6240, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 6340, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 6340, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 6480, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 6480, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 6940, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $4c   ;  wallTime = 6940, Time=0us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 6960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 6960, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 7060, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 7060, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 7080, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 7180, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 7180, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 7200, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 7300, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 7300, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 7440, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 7440, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T2_ATTN | $02)

   .byte  $83, $4c   ;  wallTime = 7900, Time=478860us, 460 ticks
   .byte  SN76489_T1_FREQ|NOTE_E5_L4, NOTE_E5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $83, $4c   ;  wallTime = 7900, Time=0us, 460 ticks
   .byte  SN76489_T2_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 7920, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 7920, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8020, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS5_L4, NOTE_CS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8020, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8040, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8040, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8140, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8140, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8160, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8260, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8260, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8280, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8380, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8380, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8400, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8400, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8500, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8500, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8520, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8520, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8620, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8620, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8640, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8640, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8740, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8740, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8760, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8760, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8860, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8860, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 8880, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 8880, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 8980, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 8980, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9000, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9000, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9100, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9100, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9120, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9120, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9220, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9220, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9240, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9240, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9340, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9340, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9360, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9360, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9460, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9460, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9480, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9480, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS2_L4, NOTE_GS2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9580, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9580, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS2_L4, NOTE_GS2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9600, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9600, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9700, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9700, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9720, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9720, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9820, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9820, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9840, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9840, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS2_L4, NOTE_GS2_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 9940, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_B3_L4, NOTE_B3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 9940, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_GS2_L4, NOTE_GS2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 9960, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 9960, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10060, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10060, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10080, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10080, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10180, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10180, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10200, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10200, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10300, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_E4_L4, NOTE_E4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10300, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_E3_L4, NOTE_E3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10320, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10320, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10420, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_F4_L4, NOTE_F4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10420, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_F3_L4, NOTE_F3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10440, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10440, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10540, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10540, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10560, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10560, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10660, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_A4_L4, NOTE_A4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10660, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10680, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10680, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10780, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_AS4_L4, NOTE_AS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10780, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_AS3_L4, NOTE_AS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 10800, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 10800, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 10900, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 10900, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 11040, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 11040, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 11140, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_C5_L4, NOTE_C5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 11140, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_C4_L4, NOTE_C4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11160, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 11160, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 11260, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D5_L4, NOTE_D5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 11260, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $14   ;  wallTime = 11280, Time=20820us, 20 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, (SN76489_T1_ATTN | $02)

   .byte  $14   ;  wallTime = 11280, Time=0us, 20 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 11380, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_DS5_L4, NOTE_DS5_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 11380, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_DS4_L4, NOTE_DS4_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 11520, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 11520, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 11620, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_FS4_L4, NOTE_FS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 11620, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_FS3_L4, NOTE_FS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 11760, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 11760, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 11860, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_G4_L4, NOTE_G4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 11860, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_G3_L4, NOTE_G3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 12000, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 12000, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 12100, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_CS4_L4, NOTE_CS4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 12100, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_CS3_L4, NOTE_CS3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 12240, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 12240, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 12340, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $64   ;  wallTime = 12340, Time=0us, 100 ticks
   .byte  SN76489_T2_FREQ|NOTE_D3_L4, NOTE_D3_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $0c   ;  wallTime = 12480, Time=145740us, 140 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, (SN76489_T1_ATTN | $02)

   .byte  $81, $0c   ;  wallTime = 12480, Time=0us, 140 ticks
   .byte  SN76489_T2_FREQ|NOTE_F2_L4, NOTE_F2_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 12700, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_GS3_L4, NOTE_GS3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 12960, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, (SN76489_T1_ATTN | $02)

   .byte  $82, $40   ;  wallTime = 12960, Time=0us, 320 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, (SN76489_T2_ATTN | $02)

   .byte  $81, $5c   ;  wallTime = 13180, Time=229020us, 220 ticks
   .byte  SN76489_T1_FREQ|NOTE_A3_L4, NOTE_A3_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $82, $04   ;  wallTime = 13440, Time=270660us, 260 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, (SN76489_T1_ATTN | $02)

   .byte  $82, $40   ;  wallTime = 13440, Time=0us, 320 ticks
   .byte  SN76489_T2_FREQ|NOTE_B1_L4, NOTE_B1_H6, (SN76489_T2_ATTN | $02)

   .byte  $64   ;  wallTime = 13540, Time=104100us, 100 ticks
   .byte  SN76489_T1_FREQ|NOTE_D4_L4, NOTE_D4_H6, SN76489_T1_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $20   ;  wallTime = 12640, Time=4294030396us, 160 ticks
   .byte  SN76489_T2_FREQ|NOTE_F2_L4, NOTE_F2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $20   ;  wallTime = 13120, Time=499680us, 160 ticks
   .byte  SN76489_T2_FREQ|NOTE_A2_L4, NOTE_A2_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

   .byte  $81, $5c   ;  wallTime = 13660, Time=562140us, 220 ticks
   .byte  SN76489_T2_FREQ|NOTE_B1_L4, NOTE_B1_H6, SN76489_T2_ATTN | SN76489_ATTEN_OFF

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
