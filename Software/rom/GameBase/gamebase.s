      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "vdp.inc"
      .include "tty.inc"
      .include "gamepad.inc"

      .include "zeropage.inc"

VDP_NAME_TABLE_BASE = $0000
SCREEN1 = VDP_REG2_NAME_TABLE_BASE_0000
SCREEN2 = VDP_REG2_NAME_TABLE_BASE_2000 ; can just toggle bit 3


      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   irq_handler

       .BSS

last_controller_input: .res 1

vPos: .res 1
hPos: .res 1
blink_stat: .res 1
frame: .res 1

windowXOffset: .res 1
windowYOffset: .res 1
currentScreenSelect: .res 1
objTemp: .res 1 ; move to zp


screen_buffer:
      .res 768 


      .code

init:  
      jsr _lcd_init
      jsr vdp_graphics1_init
      jsr _blink_init

      lda blink_stat
      jsr _blink_led

    ;  lda #( TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      writeln_tty #hello_msg

      jsr _strobe_led

      lda #$17
      jsr vdp_fill_color

      jsr vdp_hide_sprites

      jsr load_sprite

      lda #100
      sta vPos
      sta hPos

      lda #0
      sta frame
      sta windowXOffset
      sta windowYOffset

      jsr position_sprite

      jsr ClearScreenBuffer
      jsr LoadObjectsToBuffer
      jsr CopyBufferToVRAM

      lda VDP_REG
      cli

program_loop:

      ldx GAMEPAD1

      ;cpx last_controller_input      
      beq program_loop

      lda #'$'
      jsr _tty_send_character
      txa  
      jsr _tty_write_hex
      jsr _tty_send_newline

      sta last_controller_input

      bit #NESPAD_UP
      beq :+
      dec vPos
:
      bit #NESPAD_DOWN
      beq :+
      inc vPos
:
      bit #NESPAD_LEFT
      beq :+
      dec hPos
:
      bit #NESPAD_RIGHT
      beq :+
      inc hPos
:

done:
      jmp program_loop

load_sprite:      
      pha
      phx

      vdp_set_vram_addr $1000

      ldx #0
:
      lda sprite2,x
      sta VDP_VRAM
      inx
      cpx #(sprite_table_end - sprite2)
      bne :-

      plx
      pla
      rts

 position_sprite:
      pha
  
      vdp_set_vram_addr $0500

      lda vPos
      sta VDP_VRAM

      lda hPos
      sta VDP_VRAM

      lda frame 
      sta VDP_VRAM

      lda #($00 | (VDP_COLOR_BLACK & VDP_COLOR_MASK_LOW_NIBBLE))
      sta VDP_VRAM

      ; Disable all other sprites. 
      lda #$D0
      sta VDP_VRAM

      pla
      rts     

irq_handler:
      pha

      lda VDP_REG

      jsr position_sprite

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #BLINK_LED_OFF
      jsr _blink_led

      lda frame
      clc
      adc #4
      cmp #12
      bne :+
      lda #0
:
      sta frame

      pla
      rti



ClearScreenBuffer: 
   .scope 
    pha
    phx
    phy

    lda #<screen_buffer
    sta vdp_buffer_address
    lda #>screen_buffer
    sta vdp_buffer_address + 1 

    ldy #0         ; count locations
    ldx #3         ; count pages
    lda #$20 
    
    ; load a page at a time
clear_next:      
    sta (vdp_buffer_address),Y
    iny
    bne clear_next
    inc vdp_buffer_address+1

    dex
    bne clear_next

    ply
    plx
    pla

    rts
    .endscope

;
; Load all Objects to Screen Buffer
; Based on current Window Position
;
LoadObjectsToBuffer:
    .scope 
    pha
    phx
    phy

    ;
    ; Check each Object and add
    ; to Buffer if within Window
    ;
    ldx #0

checkObject:       

      txa
      jsr _tty_write_hex 
      lda #$20
      jsr _tty_send_character   
      lda #(ObjectTableEnd - ObjectTable)
      jsr _tty_write_hex 
      jsr _tty_send_newline

    cpx #(ObjectTableEnd - ObjectTable)
    beq done

    ; Check X Position in screen Window
    lda ObjectTable,X 

;     jsr _tty_write_hex 
;     lda #$3A
;     jsr _tty_send_character      

    sec
    sbc windowXOffset
    bmi nextObject3

;     jsr _tty_write_hex 
;     lda #$20
;     jsr _tty_send_character     

    cmp #32
    bpl nextObject3

    sta objTemp

        
;     jsr _tty_write_hex 
;     lda #$3A
;     jsr _tty_send_character   
;     ;jsr _tty_send_newline

    inx 
    ; Check Y Position in screen Window
    lda ObjectTable,X
    sec
    sbc windowYOffset
    bmi nextObject2

    cmp #24
    bpl nextObject2

;     jsr _tty_write_hex 
;     lda #$20
;     jsr _tty_send_character   
;     jsr _tty_send_newline

    ldy #0
    ;
    ; Object is Onscreen; save to Buffer
    ;
    asl
    asl
    asl
    ; these last two could carry
    asl
    bcc :+
    iny
    iny ; extra +1 to simulate a shift into the 2's place
:
    asl
    bcc :+
    iny  
:    
    ; add buffser start to offset  
    clc
    adc #<screen_buffer
    sta vdp_buffer_address
    tya
    adc #>screen_buffer
    sta vdp_buffer_address+1

    ;
    ; Get and write pattern
    ;
    inx ; point to pattern
    lda ObjectTable, x
    ldy objTemp
    sta (vdp_buffer_address), Y

    bra nextObject1

nextObject3:
    inx
nextObject2:
    inx
nextObject1:
    inx

    bra checkObject

done:
    ply
    plx
    pla
    rts
    .endscope

;
; Copy Full Screen Buffer to VRAM
;
CopyBufferToVRAM:
.scope  
    pha
    phx
    phy

    vdp_set_vram_addr VDP_NAME_TABLE_BASE

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
    pla
    rts
.endscope



      .segment "RODATA"

hello_msg:
      .byte "Graphics Test 1", $00

testmsg1:
      .byte "Test Point 1", $00

testmsg2:
      .byte "Test Point 2", $00


; sprite:
;       .byte %01111110
;       .byte %10000001
;       .byte %10100101
;       .byte %10000001
;       .byte %10100101
;       .byte %10011101
;       .byte %10000001
;       .byte %01111110
; sprite_table_end:
;       .byte %01010101


sprite2:
     .byte   $01, $03, $02, $05, $84, $7A, $01, $0E
     .byte   $12, $21, $23, $13, $02, $02, $0C, $0C
     .byte   $20, $90, $CC, $44, $04, $48, $B0, $40
     .byte   $80, $80, $C0, $C0, $20, $20, $30, $30


sprite3:
     .byte   $01, $03, $02, $05, $04, $FA, $01, $0E
     .byte   $12, $21, $23, $13, $02, $02, $0C, $08
     .byte   $20, $90, $CC, $44, $04, $48, $B0, $40
     .byte   $80, $80, $C0, $C0, $20, $20, $30, $18

sprite4:
     .byte   $01, $03, $02, $05, $04, $7A, $81, $0E
     .byte   $12, $21, $23, $13, $02, $02, $03, $06
     .byte   $20, $90, $CC, $44, $04, $48, $B0, $40
     .byte   $80, $80, $C0, $C0, $20, $20, $60, $60
sprite_table_end:  

;
; Character object map, [ hPos, vPos, char ]
;
ObjectTable:
;     .byte 0, 0, '0'
;     .byte 5, 5, '1'
;     .byte 10, 10, '2'
;     .byte 15, 15, '3'
;     .byte 20, 20, '4'
;     .byte 23, 23, '5'
;     .byte 31, 23, '6'
      .byte   0, 0, 48, 31, 0, 48, 5, 0, 48
      .byte   0, 1, 49, 31, 1, 49, 6, 1, 49
      .byte   0, 2, 50, 31, 2, 50, 7, 2, 50
      .byte   0, 3, 51, 31, 3, 51, 8, 3, 51
      .byte   0, 4, 52, 31, 4, 52, 9, 4, 52
      .byte   0, 5, 53, 31, 5, 53, 10, 5, 53
      .byte   0, 6, 54, 31, 6, 54, 11, 6, 54
      .byte   0, 7, 55, 31, 7, 55, 12, 7, 55
      .byte   0, 8, 56, 31, 8, 56, 13, 8, 56
      .byte   0, 9, 57, 31, 9, 57, 14, 9, 57
      .byte   0, 10, 48, 31, 10, 48, 15, 10, 48
      .byte   0, 11, 49, 31, 11, 49, 16, 11, 49
      .byte   0, 12, 50, 31, 12, 50, 17, 12, 50
      .byte   0, 13, 51, 31, 13, 51, 18, 13, 51
      .byte   0, 14, 52, 31, 14, 52, 19, 14, 52
      .byte   0, 15, 53, 31, 15, 53, 20, 15, 53
      .byte   0, 16, 54, 31, 16, 54, 21, 16, 54
      .byte   0, 17, 55, 31, 17, 55, 22, 17, 55
      .byte   0, 18, 56, 31, 18, 56, 23, 18, 56
      .byte   0, 19, 57, 31, 19, 57, 24, 19, 57
      .byte   0, 20, 48, 31, 20, 48, 25, 20, 48
      .byte   0, 21, 49, 31, 21, 49, 26, 21, 49
      .byte   0, 22, 50, 31, 22, 50, 27, 22, 50
      .byte   0, 23, 51, 31, 23, 51, 28, 23, 51
ObjectTableEnd:    
    .byte $00
