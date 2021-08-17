    .include "sys_const.inc"
    .include "sysram_map.inc"
    .include "vdp.inc"
    .include "vdp_const.inc"
    .include "vdp_macro.inc"
    .include "sysram_map.inc"
    .include "zeropage.inc"
    .include "blink.inc"

    .export vdp_text_init
    .export vdp_scroll_line
    .export vdp_line
    .export vdp_char_pos

    .export vdp_advance_char_position
    .export vdp_newline
    .export vdp_clear_line
    .export vdp_clear_text_screen

    .export vdp_backspace
    .export vdp_set_prompt

    .export vdp_out_char
    .export vdp_write_char
    .export vdp_write_string

PROMPT = '>'
SPACE = ' '
LINE_FEED = $0A
CARRIAGE_RETURN = $0D



      .segment "BSS"
vdp_line:              .byte $00
vdp_char_pos:          .byte $00 


    .code

;------------------------------------------------------------------------------
;
; VDPReset
; Set Text Mode / Typical Settings
;
;------------------------------------------------------------------------------
vdp_text_init:
  jsr vdp_init_text_mode
  jsr vdp_initialize_text_pattern_table
  jsr vdp_clear_screen
  jsr vdp_enable_display

  lda #0
  sta vdp_line
  sta vdp_char_pos

  rts


;------------------------------------------------------------------------------
;
; AdvanceChar
; Move to the next character position
; TODO: future - scroll line right to allow longer lines
;
;------------------------------------------------------------------------------
vdp_advance_char_position:
      pha

      lda vdp_char_pos
      cmp #VDP_TEXT_MODE_LINE_LENGTH - 1

      beq @do_not_advance_char

      inc vdp_char_pos
@do_not_advance_char:      
      pla
      rts

;------------------------------------------------------------------------------
;
; AdvanceLine
; Move to the next line on the screen and set position to the first character
;
;------------------------------------------------------------------------------
vdp_newline:
      pha

      lda vdp_line
      cmp #VDP_TEXT_MODE_LINE_COUNT-1
      beq @scroll_required

      inc
      sta vdp_line
      bra @done

@scroll_required:
      jsr vdp_scroll_line
      jsr vdp_clear_line

@done:
      lda #0        
      sta vdp_char_pos

      pla
      rts





;------------------------------------------------------------------------------
;
; VDPWriteChar
; Write the charater in acc to the active position on the screen and advance
;
;------------------------------------------------------------------------------
vdp_write_char:
      jsr vdp_out_char

      jsr vdp_advance_char_position  
      rts

;------------------------------------------------------------------------------
;
; VDPOutChar
; Write the charater in acc to the active position on the screen
;
;------------------------------------------------------------------------------
vdp_out_char:
    cmp #LINE_FEED
    bne @not_line_feed        
    jsr vdp_newline
    bra @done

@not_line_feed:
    cmp #CARRIAGE_RETURN
    bne @not_carriage_return   
    lda #0
    sta vdp_char_pos
    bra @done

@not_carriage_return:
      jsr load_vram_char_position
      sta VDP_VRAM
@done:
      rts      

;------------------------------------------------------------------------------
;
; VDPWriteString
; Write null terminated string at ADDR LSB = Acc, MSB = X and advance
; Currently limited to 256 char string; use vdp_vram_write_buffer for long blocks
;
;------------------------------------------------------------------------------
vdp_write_string:
    sta vdp_buffer_address
    stx vdp_buffer_address + 1
    jsr load_vram_char_position

    phy
    ldy #0
@write_loop:
    lda (vdp_buffer_address),y
    beq @done
    jsr vdp_write_char    ; note inefficiency of rewriting VDP RAM Address here
  
    iny
    bra @write_loop  

@done:
    jsr vdp_advance_char_position  

    ply
    rts



;------------------------------------------------------------------------------
;
; LoadVRAMCharPosition
; Loads the VDP VRAM address that corresponds to (vdp_line, vdp_char_pos)
;
;------------------------------------------------------------------------------
load_vram_char_position:
      .scope
      pha
      phx

      lda #0
      sta vdp_vram_address+1

      lda vdp_char_pos                    ; keep LSB of VRAM Address here
      ldx vdp_line
      beq done

next_line:
      clc
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



;------------------------------------------------------------------------------
;
; VDPClearLine
; Clear current line - does not change the character position
;
;------------------------------------------------------------------------------
vdp_clear_line:
      .scope
      pha
      phx

      ldx #0
      stx vdp_char_pos

      lda #' '
      jsr load_vram_char_position

loop:
      sta VDP_VRAM
      inx
      cpx #VDP_TEXT_MODE_LINE_LENGTH
      bne loop      
 
      plx  
      pla
      rts
      .endscope


;------------------------------------------------------------------------------
;
; VDPClearScreen
;
;------------------------------------------------------------------------------
vdp_clear_text_screen:
      pha

    jsr vdp_clear_screen

    lda #0
    sta vdp_char_pos
    sta vdp_line
 
      pla
      rts

;------------------------------------------------------------------------------
;
; DoBackspace
; Back up to the last character, replace it with a space, and stay there
;
;------------------------------------------------------------------------------
vdp_backspace:
      .scope
      ldx vdp_char_pos
      beq dont_backspace
      dex 
      beq dont_backspace

      dec vdp_char_pos
      lda #SPACE
      jsr vdp_out_char
;      jsr load_vram_char_position
;      sta VDP_VRAM

dont_backspace:
      rts
      .endscope


;------------------------------------------------------------------------------
;
; SetupPrompt
; Move to beginning of line; output a prompt, and advance
;
;------------------------------------------------------------------------------
vdp_set_prompt:
      .scope
      pha

      lda #0
      sta vdp_char_pos

      lda #PROMPT
      jsr vdp_out_char      
;      jsr load_vram_char_position
;      sta VDP_VRAM

      jsr vdp_advance_char_position

      pla
      rts
      .endscope



;------------------------------------------------------------------------------
;
; ScrollLine
; Shift Text on Screen Up one line; does not alter current char position
;
;------------------------------------------------------------------------------
vdp_scroll_line:
    .scope
    pha

    lda #VDP_TEXT_MODE_LINE_LENGTH    ; Start read one line in
    sta vdp_vram_address 
    lda #0
    sta vdp_vram_address+1

    lda #<text_screen_buffer          ; Read into the start of the buffer  
    sta vdp_buffer_address
    lda #>text_screen_buffer
    sta vdp_buffer_address+1

    ; how much to read?               ; 23 lines of text  
    lda #<((VDP_TEXT_MODE_LINE_COUNT - 1) * VDP_TEXT_MODE_LINE_LENGTH)
    sta vdp_char_count
    lda #>((VDP_TEXT_MODE_LINE_COUNT - 1) * VDP_TEXT_MODE_LINE_LENGTH)
    sta vdp_char_count+1

    jsr vdp_vram_read_buffer

    ; TODO: add blank line at bottom so junk is not duplicated

    lda #0                              ; now write it to the first line
    sta vdp_vram_address
    sta vdp_vram_address+1

    lda #<text_screen_buffer
    sta vdp_buffer_address
    lda #>text_screen_buffer
    sta vdp_buffer_address+1

    ; how much to write? 
    lda #<((VDP_TEXT_MODE_LINE_COUNT - 1) * VDP_TEXT_MODE_LINE_LENGTH)
    sta vdp_char_count
    lda #>((VDP_TEXT_MODE_LINE_COUNT - 1) * VDP_TEXT_MODE_LINE_LENGTH)
    sta vdp_char_count+1

    jsr vdp_vram_write_buffer

    pla
    rts
    .endscope