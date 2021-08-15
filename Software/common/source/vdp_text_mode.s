    .include "sysram_map.inc"
    .include "vdp.inc"
    .include "vdp_const.inc"
    .include "vdp_macro.inc"
    .include "sysram_map.inc"
    .include "zeropage.inc"

    .export scroll_line
    .export vdp_line
    .export vdp_char_pos


      .segment "BSS"
vdp_line:              .byte $00
vdp_char_pos:          .byte $00 

;------------------------------------------------------------------------------
;
; ScrollLine
; Shift Text on Screen Up one line; does not alter current char position
;
;------------------------------------------------------------------------------
scroll_line:
      .scope

      lda #VDP_TEXT_MODE_LINE_LENGTH    ; Start read one line in
      sta vdp_vram_address 
      sta vdp_vram_address+1

      lda #<text_screen_buffer
      sta vdp_buffer_address
      lda #>text_screen_buffer
      sta vdp_buffer_address+1

      ; how much to read?

      jsr vdp_vram_read_buffer


       lda #0
       sta vdp_vram_address
       sta vdp_vram_address+1

       lda #<text_screen_buffer
       sta vdp_buffer_address
       lda #>text_screen_buffer
       sta vdp_buffer_address+1

       ; how much to write? 

       jsr vdp_vram_write_buffer

      rts
      .endscope