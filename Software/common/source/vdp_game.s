    .include "sys_const.inc"
    .include "sysram_map.inc"
    .include "vdp.inc"
    .include "vdp_const.inc"
    .include "vdp_macro.inc"
    .include "sysram_map.inc"
    .include "zeropage.inc"
    .include "vdp_game_config.inc"

; For debug, these:
    .include "tty.inc"
    .include "blink.inc"

    .export VdpFillScreenBuffer
    .export VdpCopyBufferToVRAM
    .export VdpLoadObjectsToBuffer

    .export windowXOffset
    .export windowYOffset


    .BSS

windowXOffset: .res 2
windowYOffset: .res 2
currentScreenSelect: .res 1
objTemp: .res 1 ; move to zp

screen_buffer:
      .res 768 

    .CODE

;
; Fill Buffer with char in acc
;
VdpFillScreenBuffer:
   .scope 
    phx
    phy

    ldx #<screen_buffer
    stx vdp_buffer_address
    ldx #>screen_buffer
    stx vdp_buffer_address + 1 

    ldy #0         ; count locations
    ldx #3         ; count pages
    
    ; load a page at a time
clear_next:      
    sta (vdp_buffer_address),Y
    iny
    bne clear_next
    inc vdp_buffer_address+1

    dex
    bne clear_next

    plx
    pla

    rts
    .endscope

;
; Load all Objects to Screen Buffer
; Based on current Window Position
; ptr1 = base address of screen map (will be corrupted)
; ptr2 = first address after the end of the screen map (unchanged)
VdpLoadObjectsToBuffer:
    .scope 
    pha
    phx
    phy

checkObject:       
    lda ptr1
    cmp ptr2
    bne not_done

    lda ptr1+1
    cmp ptr2+1
    beq done

not_done:
    ldy #0

    ; Check X Position in screen Window
    lda (ptr1),y 

    sec
    sbc windowXOffset
    bmi nextObject
    ;bcc nextObject3

    cmp #32
    bpl nextObject

    sta objTemp

    iny 
    ; Check Y Position in screen Window
    lda (ptr1),y 
    sec
    sbc windowYOffset
    bmi nextObject
    ;bcc nextObject2

    cmp #24
    bpl nextObject

    ldx #0
    ;
    ; Object is Onscreen; save to Buffer
    ;
    asl
    asl
    asl
    ; these last two could carry
    asl
    bcc :+
    inx
    inx ; extra +1 to simulate a shift into the 2's place
:
    asl
    bcc :+
    inx  
:    

    ; get total lsb in a
    ; top 3 bits are lower y position, bottom 5 are x position
    clc
    adc objTemp

    ; add buffer start to offset  
    clc
    adc #<screen_buffer
    sta vdp_buffer_address
    txa
    adc #>screen_buffer         ; retains potential carry!
    sta vdp_buffer_address+1

    ;
    ; Get and write pattern
    ;
    iny ; point to pattern
    lda (ptr1),y 
    ldx #0
    sta (vdp_buffer_address,x)

  
nextObject:
    lda ptr1
    clc
    adc #3
    sta ptr1
    bcc checkObject
    inc ptr1+1
    bra checkObject

done:
    ply
    plx
    pla
    rts
    .endscope


;
; Copy Full Screen Buffer to VRAM
; acc should have the VDP Address MSB
;
VdpCopyBufferToVRAM:
.scope  
    phx
    phy

    ; Set starting VRAM Address (LSB=0)
    ldx #0
    stx VDP_REG    
    ora #VDP_WRITE_VRAM_SELECT
    sta VDP_REG 

    lda #<screen_buffer
    sta vdp_vram_address 

    lda #>screen_buffer 
    sta vdp_vram_address+1

    ldy #0
    ldx #3
  
next_loc:

    lda (vdp_vram_address),y
    sta VDP_VRAM
    iny
    bne next_loc

    inc vdp_vram_address+1
    dex
    bne next_loc

    ply
    plx
    rts
.endscope
