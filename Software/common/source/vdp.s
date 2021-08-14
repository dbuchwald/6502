    .include "vdp_const.inc"
    .include "blink.inc"
    .include "vdp_macro.inc"
    .include "zeropage.inc"

    .import __VDP_START__
    
    .export VDP_REG
    .export VDP_VRAM

    .export VDP_TEXT_PATTERNS_START
    .export VDP_TEXT_PATTERNS_END

    .export vdp_init_text_mode
    .export vdp_initialize_text_pattern_table
    .export vdp_clear_screen
    .export vdp_enable_display


  ; TODO how to manage addresses defined by our config?
VDP_PATTERN_TABLE_BASE = $0800
VDP_NAME_TABLE_BASE = $0000

VDP_REG = __VDP_START__ + VDP_REGISTER_OFFSET
VDP_VRAM = __VDP_START__ + VDP_VRAM_OFFSET

VDP_TEXT_PATTERNS_START:
; line drawing
  .byte $00,$00,$00,$FF,$FF,$00,$00,$00 ; lr
  .byte $18,$18,$18,$18,$18,$18,$18,$18 ; ud
  .byte $00,$00,$00,$F8,$F8,$18,$18,$18 ; ld
  .byte $00,$00,$00,$1F,$1F,$18,$18,$18 ; rd
  .byte $18,$18,$18,$F8,$F8,$00,$00,$00 ; lu
  .byte $18,$18,$18,$1F,$1F,$00,$00,$00 ; ur
  .byte $18,$18,$18,$FF,$FF,$18,$18,$18 ; lurd

; <available>
  .byte $07,$07,$07,$07,$07,$07,$07,$00 ; 07
  .byte $08,$08,$08,$08,$08,$08,$08,$00 ; 08
  .byte $09,$09,$09,$09,$09,$09,$09,$00 ; 09
  .byte $0A,$0A,$0A,$0A,$0A,$0A,$0A,$00 ; 0A
  .byte $0B,$0B,$0B,$0B,$0B,$0B,$0B,$00 ; 0B
  .byte $0C,$0C,$0C,$0C,$0C,$0C,$0C,$00 ; 0C
  .byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$00 ; 0D
  .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$00 ; 0E
  .byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$00 ; 0F
  .byte $10,$10,$10,$10,$10,$10,$10,$00 ; 10
  .byte $11,$11,$11,$11,$11,$11,$11,$00 ; 11
  .byte $12,$12,$12,$12,$12,$12,$12,$00 ; 12
  .byte $13,$13,$13,$13,$13,$13,$13,$00 ; 13
  .byte $14,$14,$14,$14,$14,$14,$14,$00 ; 14
  .byte $15,$15,$15,$15,$15,$15,$15,$00 ; 15
  .byte $16,$16,$16,$16,$16,$16,$16,$00 ; 16
  .byte $17,$17,$17,$17,$17,$17,$17,$00 ; 17
  .byte $18,$18,$18,$18,$18,$18,$18,$00 ; 18
  .byte $19,$19,$19,$19,$19,$19,$19,$00 ; 19
  .byte $1A,$1A,$1A,$1A,$1A,$1A,$1A,$00 ; 1A
  .byte $1B,$1B,$1B,$1B,$1B,$1B,$1B,$00 ; 1B
  .byte $1C,$1C,$1C,$1C,$1C,$1C,$1C,$00 ; 1C
  .byte $1D,$1D,$1D,$1D,$1D,$1D,$1D,$00 ; 1D
  .byte $1E,$1E,$1E,$1E,$1E,$1E,$1E,$00 ; 1E
  .byte $1F,$1F,$1F,$1F,$1F,$1F,$1F,$00 ; 1F
; </available>

  .byte $00,$00,$00,$00,$00,$00,$00,$00 ; ' '
  .byte $20,$20,$20,$00,$20,$20,$00,$00 ; !
  .byte $50,$50,$50,$00,$00,$00,$00,$00 ; "
  .byte $50,$50,$F8,$50,$F8,$50,$50,$00 ; #
  .byte $20,$78,$A0,$70,$28,$F0,$20,$00 ; $
  .byte $C0,$C8,$10,$20,$40,$98,$18,$00 ; %
  .byte $40,$A0,$A0,$40,$A8,$90,$68,$00 ; &
  .byte $20,$20,$40,$00,$00,$00,$00,$00 ; '
  .byte $20,$40,$80,$80,$80,$40,$20,$00 ; (
  .byte $20,$10,$08,$08,$08,$10,$20,$00 ; )
  .byte $20,$A8,$70,$20,$70,$A8,$20,$00 ; *
  .byte $00,$20,$20,$F8,$20,$20,$00,$00 ; +
  .byte $00,$00,$00,$00,$20,$20,$40,$00 ; ,
  .byte $00,$00,$00,$F8,$00,$00,$00,$00 ; -
  .byte $00,$00,$00,$00,$20,$20,$00,$00 ; .
  .byte $00,$08,$10,$20,$40,$80,$00,$00 ; /
  .byte $70,$88,$98,$A8,$C8,$88,$70,$00 ; 0
  .byte $20,$60,$20,$20,$20,$20,$70,$00 ; 1
  .byte $70,$88,$08,$30,$40,$80,$F8,$00 ; 2
  .byte $F8,$08,$10,$30,$08,$88,$70,$00 ; 3
  .byte $10,$30,$50,$90,$F8,$10,$10,$00 ; 4
  .byte $F8,$80,$F0,$08,$08,$88,$70,$00 ; 5
  .byte $38,$40,$80,$F0,$88,$88,$70,$00 ; 6
  .byte $F8,$08,$10,$20,$40,$40,$40,$00 ; 7
  .byte $70,$88,$88,$70,$88,$88,$70,$00 ; 8
  .byte $70,$88,$88,$78,$08,$10,$E0,$00 ; 9
  .byte $00,$00,$20,$00,$20,$00,$00,$00 ; :
  .byte $00,$00,$20,$00,$20,$20,$40,$00 ; ;
  .byte $10,$20,$40,$80,$40,$20,$10,$00 ; <
  .byte $00,$00,$F8,$00,$F8,$00,$00,$00 ; =
  .byte $40,$20,$10,$08,$10,$20,$40,$00 ; >
  .byte $70,$88,$10,$20,$20,$00,$20,$00 ; ?
  .byte $70,$88,$A8,$B8,$B0,$80,$78,$00 ; @
  .byte $20,$50,$88,$88,$F8,$88,$88,$00 ; A
  .byte $F0,$88,$88,$F0,$88,$88,$F0,$00 ; B
  .byte $70,$88,$80,$80,$80,$88,$70,$00 ; C
  .byte $F0,$88,$88,$88,$88,$88,$F0,$00 ; D
  .byte $F8,$80,$80,$F0,$80,$80,$F8,$00 ; E
  .byte $F8,$80,$80,$F0,$80,$80,$80,$00 ; F
  .byte $78,$80,$80,$80,$98,$88,$78,$00 ; G
  .byte $88,$88,$88,$F8,$88,$88,$88,$00 ; H
  .byte $70,$20,$20,$20,$20,$20,$70,$00 ; I
  .byte $08,$08,$08,$08,$08,$88,$70,$00 ; J
  .byte $88,$90,$A0,$C0,$A0,$90,$88,$00 ; K
  .byte $80,$80,$80,$80,$80,$80,$F8,$00 ; L
  .byte $88,$D8,$A8,$A8,$88,$88,$88,$00 ; M
  .byte $88,$88,$C8,$A8,$98,$88,$88,$00 ; N
  .byte $70,$88,$88,$88,$88,$88,$70,$00 ; O
  .byte $F0,$88,$88,$F0,$80,$80,$80,$00 ; P
  .byte $70,$88,$88,$88,$A8,$90,$68,$00 ; Q
  .byte $F0,$88,$88,$F0,$A0,$90,$88,$00 ; R
  .byte $70,$88,$80,$70,$08,$88,$70,$00 ; S
  .byte $F8,$20,$20,$20,$20,$20,$20,$00 ; T
  .byte $88,$88,$88,$88,$88,$88,$70,$00 ; U
  .byte $88,$88,$88,$88,$50,$50,$20,$00 ; V
  .byte $88,$88,$88,$A8,$A8,$D8,$88,$00 ; W
  .byte $88,$88,$50,$20,$50,$88,$88,$00 ; X
  .byte $88,$88,$50,$20,$20,$20,$20,$00 ; Y
  .byte $F8,$08,$10,$20,$40,$80,$F8,$00 ; Z
  .byte $F8,$C0,$C0,$C0,$C0,$C0,$F8,$00 ; [
  .byte $00,$80,$40,$20,$10,$08,$00,$00 ; \
  .byte $F8,$18,$18,$18,$18,$18,$F8,$00 ; ]
  .byte $00,$00,$20,$50,$88,$00,$00,$00 ; ^
  .byte $00,$00,$00,$00,$00,$00,$F8,$00 ; _
  .byte $40,$20,$10,$00,$00,$00,$00,$00 ; `
  .byte $00,$00,$70,$88,$88,$98,$68,$00 ; a
  .byte $80,$80,$F0,$88,$88,$88,$F0,$00 ; b
  .byte $00,$00,$78,$80,$80,$80,$78,$00 ; c
  .byte $08,$08,$78,$88,$88,$88,$78,$00 ; d
  .byte $00,$00,$70,$88,$F8,$80,$78,$00 ; e
  .byte $30,$40,$E0,$40,$40,$40,$40,$00 ; f
  .byte $00,$00,$70,$88,$F8,$08,$F0,$00 ; g
  .byte $80,$80,$F0,$88,$88,$88,$88,$00 ; h
  .byte $00,$40,$00,$40,$40,$40,$40,$00 ; i
  .byte $00,$20,$00,$20,$20,$A0,$60,$00 ; j
  .byte $00,$80,$80,$A0,$C0,$A0,$90,$00 ; k
  .byte $C0,$40,$40,$40,$40,$40,$60,$00 ; l
  .byte $00,$00,$D8,$A8,$A8,$A8,$A8,$00 ; m
  .byte $00,$00,$F0,$88,$88,$88,$88,$00 ; n
  .byte $00,$00,$70,$88,$88,$88,$70,$00 ; o
  .byte $00,$00,$70,$88,$F0,$80,$80,$00 ; p
  .byte $00,$00,$F0,$88,$78,$08,$08,$00 ; q
  .byte $00,$00,$70,$88,$80,$80,$80,$00 ; r
  .byte $00,$00,$78,$80,$70,$08,$F0,$00 ; s
  .byte $40,$40,$F0,$40,$40,$40,$30,$00 ; t
  .byte $00,$00,$88,$88,$88,$88,$78,$00 ; u
  .byte $00,$00,$88,$88,$90,$A0,$40,$00 ; v
  .byte $00,$00,$88,$88,$88,$A8,$D8,$00 ; w
  .byte $00,$00,$88,$50,$20,$50,$88,$00 ; x
  .byte $00,$00,$88,$88,$78,$08,$F0,$00 ; y
  .byte $00,$00,$F8,$10,$20,$40,$F8,$00 ; z
  .byte $38,$40,$20,$C0,$20,$40,$38,$00 ; {
  .byte $40,$40,$40,$00,$40,$40,$40,$00 ; |
  .byte $E0,$10,$20,$18,$20,$10,$E0,$00 ; }
  .byte $40,$A8,$10,$00,$00,$00,$00,$00 ; ~
  .byte $A8,$50,$A8,$50,$A8,$50,$A8,$00 ; checkerboard
VDP_TEXT_PATTERNS_END:

vdp_text_mode_register_inits:
vdp_text_mode_register_0: .byte VDP_REG0_MODE_BIT_M3_DISABLE | VDP_REG_0_GRAPHICS_MODE_II_DISABLE
vdp_text_mode_register_1: .byte VDP_REG1_RAM_16K | VDP_REG1_TEXT_MODE_ENABLE | VDP_REG1_SCREEN_BLANK
vdp_text_mode_register_2: .byte VDP_REG2_NAME_TABLE_BASE_0000
vdp_text_mode_register_3: .byte VDP_REG3_COLOR_TABLE_BASE_0D00
vdp_text_mode_register_4: .byte VDP_REG4_PATTERN_TABLE_BASE_0800
vdp_text_mode_register_5: .byte VDP_REG5_SPRITE_ATTRIBUTE_TABLE_BASE_0000
vdp_text_mode_register_6: .byte VDP_REG6_SPRITE_PATTERN_TABLE_BASE_0000
vdp_text_mode_register_7: .byte (VDP_REG7_FOREGROUND_COLOR_MASK & VDP_COLOR_WHITE) | ( VDP_REG7_BACKGROUND_COLOR_MASK & VDP_COLOR_DARK_BLUE)
vdp_text_mode_register_inits_end:


;------------------------------------------------------------------------------
;
; Initialize VDP To Text Mode
; TODO: Parameterize the Color, at least
;
;------------------------------------------------------------------------------
vdp_init_text_mode:
  pha
  phx

  ldx #0
vdp_reg_reset_loop:

  ; Write init value  
  lda vdp_text_mode_register_inits,x
  sta VDP_REG

  ; Write the register #  
  txa
  ora #VDP_REGISTER_SELECT
  sta VDP_REG
 
  inx
  cpx #(vdp_text_mode_register_inits_end - vdp_text_mode_register_inits)
  bne vdp_reg_reset_loop

  plx
  pla
  rts

;------------------------------------------------------------------------------
;
; Initialize Pattern Table
; TODO: Parameterize the table address
;
;------------------------------------------------------------------------------
  vdp_initialize_text_pattern_table:
    pha
    phx

    vdp_set_vram_addr VDP_PATTERN_TABLE_BASE  
    
    lda #<VDP_TEXT_PATTERNS_START
    sta vdp_vram_address
    lda #>VDP_TEXT_PATTERNS_START
    sta vdp_vram_address+1
vdp_pattern_text_table_loop:
    lda (vdp_vram_address)
    sta VDP_VRAM

    lda vdp_vram_address
    clc
    adc #1
    sta vdp_vram_address
    lda #0
    adc vdp_vram_address+1
    sta vdp_vram_address+1
    cmp #>VDP_TEXT_PATTERNS_END
    bne vdp_pattern_text_table_loop
    lda vdp_vram_address
    cmp #<VDP_TEXT_PATTERNS_END
    bne vdp_pattern_text_table_loop
  
    plx
    pla
    rts


;------------------------------------------------------------------------------
;
; Initialize Name Table
;
;------------------------------------------------------------------------------
vdp_clear_screen:
  pha
  
  vdp_set_vram_addr VDP_NAME_TABLE_BASE

  lda #$C0
  sta vdp_vram_address 

  lda #$04 
  sta vdp_vram_address+1
  
vdp_name_table_loop:
  
  lda #$20 
  sta VDP_VRAM

  dec vdp_vram_address
  bne vdp_name_table_loop ; will be true after $FF

  jsr _strobe_led

  dec vdp_vram_address+1
  bne vdp_name_table_loop

  pla
  rts


;------------------------------------------------------------------------------
;
; Enable Display
;
;------------------------------------------------------------------------------
vdp_enable_display:
  pha

  lda VDP_REG
  ora #VDP_REG1_SCREEN_ACTIVE
  sta VDP_REG

  lda #(VDP_REGISTER_SELECT | VDP_REGISTER_1)
  sta VDP_REG
  
  pla
  rts


