    .include "sys_const.inc"
    .include "sysram_map.inc"
    .include "vdp.inc"
    .include "vdp_const.inc"
    .include "vdp_macro.inc"
    .include "sysram_map.inc"
    .include "zeropage.inc"
    .include "blink.inc"

    .export scroll_line
    .export vdp_line
    .export vdp_char_pos


      .segment "BSS"
vdp_line:              .byte $00
vdp_char_pos:          .byte $00 


    .code
;------------------------------------------------------------------------------
;
; ScrollLine
; Shift Text on Screen Up one line; does not alter current char position
;
;------------------------------------------------------------------------------
scroll_line:
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