      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      
      .include "SN76489_const.inc"
      .include "SN76489.inc"
      .include "utils.inc"
      .include "tty.inc"

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

      .code
init:  
      jsr _lcd_init
      jsr vdp_text_init
      jsr _blink_init
      write_tty #hello_msg
      jsr _strobe_led

      jsr sn76489_init

      jsr _strobe_led
      jsr sn76489_low_beep
      jsr sn76489_high_beep

start:

      lda #( SN76489_T1_ATTN | SN76489_ATTEN_OFF ) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      jsr _strobe_led

      lda #( SN76489_T1_ATTN | SN76489_ATTEN_2DB ) 
      sta SN76489_LEFT
      sta SN76489_RIGHT

      ldx #$00

next_note: 
      cpx notes_count
      beq start   

      lda notes, x
      ora #SN76489_T1_FREQ
      sta SN76489_LEFT
      sta SN76489_RIGHT
      inx

      lda notes, x
      ora #SN76489_FREQ_H6
      sta SN76489_LEFT
      sta SN76489_RIGHT
      inx      

      lda #250
      jsr _delay_ms

      bra next_note


      .segment "RODATA"
hello_msg:
      .byte "Tone Test", $00

notes:
      .byte NOTE_C5_L4, NOTE_C5_H6
      .byte NOTE_D5_L4, NOTE_D5_H6
      .byte NOTE_E5_L4, NOTE_E5_H6
      .byte NOTE_F5_L4, NOTE_F5_H6
      .byte NOTE_G5_L4, NOTE_G5_H6
      .byte NOTE_A5_L4, NOTE_A5_H6
      .byte NOTE_B5_L4, NOTE_B5_H6
      .byte NOTE_C6_L4, NOTE_C6_H6
notes_count:
      .byte * - notes
