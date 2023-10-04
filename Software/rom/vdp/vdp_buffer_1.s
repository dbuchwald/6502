      .setcpu "65C02"

      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp_text_mode.inc"
      .include "vdp_const.inc"
      .include "vdp_macro.inc"
      .include "vdp_game_config.inc"      
      .include "vdp_game.inc"
      .include "vdp.inc"
      .include "tty.inc"
      .include "gamepad.inc"

      .include "zeropage.inc"

      .import PATTERNS, PATTERNS_END 
      .import COLORS, COLORS_END    
      .import SCREEN_DATA, SCREEN_DATA_END 

VDP_GAME_BUFFER_READY = %00000001

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   irq_handler

       .BSS

last_controller_input: .res 1

vPos: .res 1
hPos: .res 1
frame: .res 1

;
;  Screen Geometry Constants
;
screen_height_in_pixels = 192
screen_width_in_pixels = 256
scroll_bounding_offset = 40
sprint_bound_top = scroll_bounding_offset
sprite_bound_left = scroll_bounding_offset
sprite_bound_right = screen_width_in_pixels - scroll_bounding_offset
sprite_bound_bottom = screen_height_in_pixels - scroll_bounding_offset

current_page: .res 1

      .code

init:  
      jsr _lcd_init
      jsr vdp_init
      jsr _blink_init

    ;  lda #( TTY_CONFIG_OUTPUT_VDP | TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      writeln_tty #hello_msg

      jsr _strobe_led

      ; lda #$C3
      ; jsr vdp_fill_color

      lda #$02
      jsr vdp_set_border_color

      jsr vdp_hide_sprites

      jsr load_sprite

      lda #100
      sta vPos
      sta hPos

      lda #0
      sta frame

      lda #VDP_GAME_BUFFER_READY
      sta vdp_page_status

      lda #0
      sta windowXOffset
      sta windowXOffset + 1
      lda #0
      sta windowYOffset
      sta windowYOffset + 1

      jsr position_sprite

      lda #$20
      jsr VdpFillScreenBuffer
      lda #<SCREEN_DATA
      sta ptr1
      lda #>SCREEN_DATA
      sta ptr1 + 1

      lda #<SCREEN_DATA_END
      sta ptr2
      lda #>SCREEN_DATA_END
      sta ptr2 + 1
      jsr VdpLoadObjectsToBuffer

      lda #VDP_PAGE_1_MSB
      jsr VdpCopyBufferToVRAM
      lda #VDP_PAGE_2_MSB
      jsr VdpCopyBufferToVRAM

      lda #VDP_PAGE_1_SELECT
      sta current_page

      lda VDP_REG
      cli

program_loop:

      lda GAMEPAD1

      ; Comment out for 'repeat'
      ;cmp last_controller_input      
      ;beq program_loop
      
      sta last_controller_input

      ;
      ; UP
      ;
      bit #NESPAD_UP
      beq not_up

      ldx vPos
      cpx #sprint_bound_top
      bmi chk1_window
      dec vPos
      bra not_up
chk1_window:
      dec windowYOffset

      ;
      ; DOWN
      ;
not_up:
      bit #NESPAD_DOWN
      beq not_down

      ldx vPos
      cpx #sprite_bound_bottom
      bpl chk2_window
      inc vPos
      bra not_down
chk2_window:      
      inc windowYOffset

      ;
      ; LEFT
      ;
not_down:
      bit #NESPAD_LEFT
      beq not_left

      ldx hPos
      cpx #sprite_bound_left
      bmi chk3_window
      dec hPos
      bra not_left
chk3_window:      
      dec windowXOffset
      ldx #sprite_bound_left+1
      stx hPos

      ;
      ; RIGHT
      ;
not_left:
      bit #NESPAD_RIGHT
      beq done

      ldx hPos
      cpx #sprite_bound_right
      bpl chk4_window
      inc hPos
      bra done
chk4_window:
      inc windowXOffset
      ldx #sprite_bound_right-1
      stx hPos


done:
      jsr load_new_page
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
      .scope
      pha

      lda VDP_REG  ; Clear VDP Status to allow next interrupt.

      ; select PAGE for next scan

      lda #VDP_GAME_BUFFER_READY
      bit vdp_page_status
      ;beq skip_frame
      beq done

      lda current_page
      sta VDP_REG
      lda #VDP_REGISTER_2 
      sta VDP_REG

      lda vdp_page_status
      eor #VDP_GAME_BUFFER_READY
      sta vdp_page_status

      ; lda #BLINK_LED_ON
      ; jsr _blink_led
      ; lda #BLINK_LED_OFF
      ; jsr _blink_led

skip_frame:
      jsr position_sprite

      lda frame
      clc
      adc #4
      cmp #12
      bne :+
      lda #0
:
      sta frame

done:
      pla
      rti
      .endscope

;
; Load hidden page using backgroud at current
; windowXOffset, windowYOffset
;
load_new_page:
      .scope
      pha

      ; lda #$20
      ; jsr VdpFillScreenBuffer
      ; jsr VdpLoadObjectsToBuffer

      lda current_page
      cmp #VDP_PAGE_1_SELECT
      beq set_page_2

set_page_1:

      lda #0
      jsr VdpFillScreenBuffer
      lda #<SCREEN_DATA
      sta ptr1
      lda #>SCREEN_DATA
      sta ptr1 + 1

      lda #<SCREEN_DATA_END
      sta ptr2
      lda #>SCREEN_DATA_END
      sta ptr2 + 1
      jsr VdpLoadObjectsToBuffer

      lda #VDP_PAGE_1_MSB
      jsr VdpCopyBufferToVRAM

      lda #VDP_PAGE_1_SELECT
      bra done

set_page_2: 

      lda #0
      jsr VdpFillScreenBuffer
      lda #<SCREEN_DATA
      sta ptr1
      lda #>SCREEN_DATA
      sta ptr1 + 1

      lda #<SCREEN_DATA_END
      sta ptr2
      lda #>SCREEN_DATA_END
      sta ptr2 + 1      
      jsr VdpLoadObjectsToBuffer

      lda #VDP_PAGE_2_MSB
      jsr VdpCopyBufferToVRAM

      lda #VDP_PAGE_2_SELECT

done:
      sta current_page

      lda vdp_page_status
      ora #VDP_GAME_BUFFER_READY
      sta vdp_page_status

skip:     
      pla
      .endscope
      rts
 


vdp_init:
  jsr vdp_init_graphics1_mode
  load_pattern_table PATTERNS, PATTERNS_END
  load_color_table COLORS, COLORS_END
  jsr vdp_clear_screen
  jsr vdp_enable_display

  stz vdp_line
  stz vdp_char_pos

  rts

      .segment "RODATA"

hello_msg:
      .byte "Graphics Test 1", $00



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

