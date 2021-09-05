      .setcpu "65C02"

      .include "midi.inc"

      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "tty.inc"
      .include "utils.inc"
      .include "zeropage.inc"

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

      .code
init:  
      jsr vdp_text_init

      lda #( TTY_CONFIG_OUTPUT_VDP )
      jsr _tty_init
      writeln_tty #hello_msg

      lda #<variable_int_test
      sta next_midi_event
      lda #>variable_int_test
      sta next_midi_event+1

      ldx testCount  
do_test:      
      lda #'$'
      jsr _tty_send_character
      write_tty_address next_midi_event
      jsr _tty_send_newline

      jsr load_midi_tick_count

      tya
      adc next_midi_event
      sta next_midi_event
      bcc @no_carry
      inc next_midi_event + 1     
@no_carry:

       lda #'$'
       jsr _tty_send_character
       write_tty_address midi_tick_countdown+2
       write_tty_address midi_tick_countdown
       jsr _tty_send_newline

      dex
      bne do_test

program_loop:
      jmp program_loop


; ;
; ; Load the Tick Count Until the Next Event
; ; next_midi_byte, x should point to the first byte of a variable length word
; ; ref: http://forum.6502.org/viewtopic.php?t=5415
; ;
; ; Uses y index register - returns with the number of 
; ;
; Load_Midi_Tick_Count:
;       pha 
;       phx

;       stz midi_tick_countdown           ; initialize to zero, will be LSB of result
;       stz midi_tick_countdown + 1
;       stz midi_tick_countdown + 2
;       stz midi_tick_countdown + 3       ; msb
;       ldy #0
; @next_byte:
;       lda (next_midi_event), y          ; get byte of variable-length value
;       bpl @last_byte
;       and #$7F             ; keep 'value' bits
;       tax
;       ror midi_tick_countdown + 3
;       lda midi_tick_countdown + 2
;       ror 
;       sta midi_tick_countdown + 3
;       lda midi_tick_countdown + 1
;       ror 
;       sta midi_tick_countdown + 2
;       txa
;       ora midi_tick_countdown
;       ror 
;       sta midi_tick_countdown + 1
;       lda #0               
;       ror                 ; gets back the lsb from above
;       sta midi_tick_countdown
;       iny
;       bra @next_byte
; @last_byte:
;       ora midi_tick_countdown
;       sta midi_tick_countdown

;       iny
;       plx
;       pla
;       rts

 
      .segment "RODATA"
hello_msg:
      .byte "Midi Test", $00

testCount: 
      .byte 12

variable_int_test:
      .byte $00 
      .byte $40
      .byte $7F
      .byte $81, $00
      .byte $C0, $00
      .byte $FF, $7F
      .byte $81, $80, $00
      .byte $C0, $80, $00
      .byte $FF, $FF, $7f
      .byte $81, $80, $80, $00
      .byte $C0, $80, $80, $00
      .byte $FF, $FF, $FF, $7F
