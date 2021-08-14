      .setcpu "65C02"

;      .include "lcd.inc"
;      .include "blink.inc"
      .include "vdp.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "via.inc"
      .include "via_const.inc"      
      .include "keyboard.inc"
      .include "blink.inc"
      .include "zeropage.inc"

VDP_NAME_TABLE_BASE = $0000
PROMPT = '>'

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   handle_irq

      .code
init:  
      ldx #$ff
      txs

      jsr _keyboard_init
      jsr vdp_reset
      jsr _blink_init

      vdp_set_vram_addr $00 

      lda #PROMPT
      sta VDP_VRAM
      
      lda #$00
      sta vdp_line
      lda #$01
      sta vdp_char_pos

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
      jsr setup_backspace
      bra output_char

not_backspace:

      cmp #KEY_ENTER
      bne not_return
      jsr setup_return
      bra output_char

not_return:
      jsr advance_char_position
      
output_char:      
      jsr load_vram_char_position
      sta VDP_VRAM

      bra wait

handle_irq:
      pha

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #BLINK_LED_OFF
      jsr _blink_led

      lda VIA1_IFR
      bpl not_via

      phx
      tax
      and #VIA_IFR_CA1_ACTIVE_EDGE
      beq not_keyboard

      jsr _handle_keyboard_irq
not_keyboard:
      plx      

not_via:
      pla
      rti

setup_backspace:
      .scope
      cmp #KEY_BACKSPACE
      bne dont_backspace

      ldx vdp_char_pos
      beq dont_backspace
;     dex 
;     beq dont_backspace

;      dec vdp_char_pos
      dec vdp_char_pos
      lda #KEY_SPACE

dont_backspace:
      rts
      .endscope


setup_return:
      .scope
      cmp #KEY_ENTER
      bne dont_return

      ldx vdp_line
      cmp #VDP_TEXT_MODE_LINE_COUNT - 1

      beq dont_return

      lda #0
      sta vdp_char_pos
      inc vdp_line
      lda #PROMPT

dont_return:
      rts
      .endscope

advance_char_position:
      .scope
      pha

      lda vdp_char_pos
      cmp #VDP_TEXT_MODE_LINE_LENGTH - 1

      beq do_not_advance_char

      inc vdp_char_pos
do_not_advance_char:      
      pla
      rts
      .endscope

load_vram_char_position:
      .scope
      pha
      phx

      lda #0
      sta vdp_vram_address+1

      lda vdp_char_pos                    ; keep LSB of VRAM Address here
      ldx vdp_line
      beq done

      clc
next_line:
      adc #VDP_TEXT_MODE_LINE_LENGTH
      bcc no_carry     
      inc vdp_vram_address+1
no_carry:      
      dex
      bne next_line

done:
      sta VDP_REG
  
      lda vdp_vram_address+1
      ora #VDP_WRITE_VRAM_SELECT      
      sta VDP_REG

      plx
      pla
      rts
      .endscope







      .segment "BSS"
last_keyboard_status:  .byte $00
vdp_line:              .byte $00
vdp_char_pos:          .byte $00 

      .segment "RODATA"

hello_msg:
      .byte "0123456789012345678901234567890123456789", $00

vdp_reset:
  jsr vdp_init_text_mode
  jsr vdp_initialize_text_pattern_table
  jsr vdp_clear_screen
  jsr vdp_enable_display
  rts

