      .setcpu "65C02"
 ;     .include "utils.inc"
      .include "lcd.inc"
      .include "blink.inc"
      .include "vdp.inc"
      .include "vdp_const.inc"


VDP_NAME_TABLE_BASE = $0000
VDP_PATTERN_TABLE_BASE = $0800

      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

      .code

init:  

      jsr _blink_init
      jsr vdp_reset

      lda #<VDP_NAME_TABLE_BASE
      sta VDP_REG    
      lda #>VDP_NAME_TABLE_BASE | VDP_WRITE_VRAM_SELECT
      sta VDP_REG 

      ldx #0
hello_loop:
      lda hello_msg,x
      beq done_with_hello
      sta VDP_VRAM
      inx
      bra hello_loop

done_with_hello:
    ldx #0

start_end_loop:
      lda #<VDP_NAME_TABLE_BASE
      sta VDP_REG    
      lda #>VDP_NAME_TABLE_BASE | VDP_READ_VRAM_SELECT
      sta VDP_REG 

      ldx #0
check_loop:
 
      lda hello_msg,x
      beq done_with_check

      lda VDP_VRAM
      cmp hello_msg,x
      beq byte_read_ok

      lda #BLINK_LED_ON
      jsr _blink_led
      lda #BLINK_LED_OFF
      jsr _blink_led

byte_read_ok:
      inx
      bra check_loop

done_with_check:
    bra start_end_loop

      .segment "RODATA"

hello_msg:
      .byte "Hello, World!", $00


vdp_reset:
  jsr vdp_init_text_mode
  jsr vdp_initialize_text_pattern_table
  jsr vdp_clear_screen
  jsr vdp_enable_display
  rts

