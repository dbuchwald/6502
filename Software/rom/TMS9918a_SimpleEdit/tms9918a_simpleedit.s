      .setcpu "65C02"

      .include "vdp.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "vdp_text_mode.inc"
      .include "via.inc"
      .include "via_const.inc" 
    
      .include "keyboard.inc"
      .include "blink.inc"
      .include "zeropage.inc"


VDP_NAME_TABLE_BASE = $0000
CURSOR = '_'
SPACE = ' '
      .segment "BSS"
last_keyboard_status:  .byte $00

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   handle_irq

      .code
init:  
      ldx #$ff
      txs

      jsr _keyboard_init
      jsr vdp_text_init
      jsr _blink_init

      vdp_set_vram_addr $00     
      lda #$00
      sta vdp_line

      jsr vdp_set_prompt

      jsr _strobe_led

      lda $ff
      sta last_keyboard_status

      cli

wait: 
      jsr _keyboard_is_data_available
      cmp #KEYBOARD_DATA_AVAILABLE
      bne wait

      jsr _keyboard_read_char

      cmp #KEY_BACKSPACE
      bne not_backspace

      lda #SPACE
      jsr vdp_out_char


      jsr vdp_backspace
      bra set_cursor

not_backspace:
      cmp #KEY_ENTER
      bne not_enter

      lda #SPACE
      jsr vdp_out_char

      jsr vdp_newline
      jsr vdp_set_prompt
      bra set_cursor

not_enter:
      cmp #KEY_ESCAPE
      bne not_escape

      lda #SPACE
      jsr vdp_out_char

      jsr vdp_clear_line
      jsr vdp_set_prompt
      bra set_cursor
     
not_escape:
      cmp #KEY_TAB
      bne not_tab

; this is silly - just a placeholder
      lda #SPACE
      jsr vdp_out_char
      jsr vdp_advance_char_position
      jsr vdp_advance_char_position
      jsr vdp_advance_char_position
      jsr vdp_advance_char_position 
      bra set_cursor       

not_tab:
      jsr vdp_write_char             ; not a special char; output at current position and advance
      
      ; to do  - add cursor blink under VIA timer unterupt.
set_cursor:      
      lda #CURSOR
      jsr vdp_out_char

      bra wait



;------------------------------------------------------------------------------
;
; Interrupt Handler
;
;------------------------------------------------------------------------------

handle_irq:
      pha
      lda VIA1_IFR
      bpl not_via1

      phx
      tax
      and #VIA_IFR_CA1_ACTIVE_EDGE
      beq not_keyboard

      jsr _handle_keyboard_irq
not_keyboard:
      plx      

not_via1:
      ; lda VIA2_IFR
      ; bpl not_via2

      ; and #VIA_IFR_TIME_OUT_T1
      ; bne not_via2_timer1

      ; lda #VIA_IFR_TIME_OUT_T1      ; Clear the Timer interrupt
      ; sta VIA2_IFR

not_via2_timer1:
not_via2:
      pla
      rti
