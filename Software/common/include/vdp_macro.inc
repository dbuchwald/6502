;------------------------------------------------------------------------------
;
; Utility Macros
;
;------------------------------------------------------------------------------
.macro  vdp_set_vram_addr Address
    lda #<Address
    sta VDP_REG    
    lda #>Address | VDP_WRITE_VRAM_SELECT
    sta VDP_REG 
.endmacro