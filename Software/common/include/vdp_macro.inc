;------------------------------------------------------------------------------
;
; Utility Macros
;
;------------------------------------------------------------------------------

;
; Sets a VDP Address
; Subsequent data writes will begin at this address and auto-increment
;
.macro  vdp_set_vram_addr Address
    lda #<Address
    sta VDP_REG    
    lda #>Address | VDP_WRITE_VRAM_SELECT
    sta VDP_REG 
.endmacro


;
; Sets zp address pointer to point to a table of 'Source' data
;
.macro  vdp_set_src_addr Address
    lda #<Address
    sta vdp_vram_address
    lda #>Address
    sta vdp_vram_address+1
.endmacro

;
; Load a pattern table into the VDP
; TODO: Parameterize the VRAM table addr
;
.macro load_pattern_table pattern_tab_start, pattern_tab_end
    vdp_set_vram_addr VDP_PATTERN_TABLE_BASE  
    vdp_set_src_addr pattern_tab_start

:
    lda (vdp_vram_address)
    sta VDP_VRAM

    lda vdp_vram_address
    clc
    adc #1
    sta vdp_vram_address
    lda #0
    adc vdp_vram_address+1
    sta vdp_vram_address+1
    cmp #>pattern_tab_end
    bne :-
    lda vdp_vram_address
    cmp #<pattern_tab_end
    bne :-

.endmacro


;
; Load a pattern table into the VDP
; TODO: Parameterize the VRAM table addr
;
.macro load_color_table color_tab_start, color_tab_end
    vdp_set_vram_addr VDP_COLOR_TABLE_BASE  
    vdp_set_src_addr color_tab_start

:
    lda (vdp_vram_address)
    sta VDP_VRAM

    lda vdp_vram_address
    clc
    adc #1
    sta vdp_vram_address
    lda #0
    adc vdp_vram_address+1
    sta vdp_vram_address+1
    cmp #>color_tab_end
    bne :-
    lda vdp_vram_address
    cmp #<color_tab_end
    bne :-

.endmacro