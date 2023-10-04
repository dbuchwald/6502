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

      jsr position_sprite



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

      lda frame
      clc
      adc #4
      cmp #12
      bne :+
      lda #0
:
      sta frame

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

      pla
      rti



      .segment "RODATA"

hello_msg:
      .byte "Graphics Test 1", $00

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
