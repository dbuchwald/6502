      .setcpu "65C02"
      .include "utils.inc"
      .include "lcd.inc"
      .include "keyboard.inc"
      .include "blink.inc"

      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   $0000

      .code

init:
      ; Say hello
      jsr _lcd_clear
      write_lcd #hello_msg
      lda #01
      jsr _delay_sec
      lda #('.')
      jsr _lcd_print_char
      lda #01
      jsr _delay_sec
      lda #('.')
      jsr _lcd_print_char
      lda #01
      jsr _delay_sec

      ; Unknown status first
      lda $ff
      sta last_keyboard_status

program_loop:
      ; Check current status of keyboard connection
      lda keyboard_conn
      cmp last_keyboard_status
      beq @no_change_to_keyboard_status
      ; If it has changed
      ; Save new status
      sta last_keyboard_status
      cmp #$80
      beq @keyboard_connected
      cmp #$00
      beq @keyboard_disconnected
      jmp program_loop
      ; Display keyboard connection message
@keyboard_connected:
      jsr _lcd_clear
      write_lcd #conn_msg
      jmp program_loop
      ; Display keyboard disconnection message
@keyboard_disconnected:
      jsr _lcd_clear
      write_lcd #disconn_msg
      jmp program_loop
@no_change_to_keyboard_status:
      ; Is there new data to be read
      jsr _keyboard_is_data_available
      ; Nope
      cmp #(KEYBOARD_NO_DATA_AVAILABLE)
      beq program_loop
      ; There is something new here
      lda keyboard_conn
      cmp #$00
      bne @handle_input
      ; Keyboard disconnected, yet keys are arriving
      jsr _strobe_led
@handle_input:
      jsr _lcd_clear
      jsr _keyboard_read_char
      ; New key is in the A now
      write_lcd #key_msg
      ldy #$00
@special_keys_loop:
      cmp special_keys,y
      beq @print_special_key
      iny
      iny
      iny
      ldx special_keys,y
      cpx #$00
      bne @special_keys_loop
      bra @regular_char
@print_special_key:
      iny
      lda special_keys,y
      ; sta ptr1
      iny
      ldx special_keys,y
      ; sta ptr1+1
      jsr _lcd_print
      bra program_loop
@regular_char:
      jsr _lcd_print_char
      write_lcd #key_part_two
      jsr convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char
      write_lcd #key_part_three
      jmp program_loop

      .segment "BSS"
last_keyboard_status:
      .byte $00

      .segment "RODATA"
hello_msg:
      .byte "Keyboard testing program.", $00
key_msg:
      .byte "Key pressed: ",$00
key_part_two:
      .byte " ($",$00
key_part_three:
      .byte ")",$00

conn_msg:
      .byte "Keyboard connected", $00
disconn_msg:
      .byte "Keyboard disconnected", $00

special_keys:
      .macro special_char_def code, string_addr
      .byte code, <string_addr, >string_addr
      .endmacro

      special_char_def KEY_SPACE, special_space
      special_char_def KEY_ENTER, special_enter
      special_char_def KEY_ESCAPE, special_esc
      special_char_def KEY_BACKSPACE, special_back
      special_char_def KEY_ARROW_UP, special_up
      special_char_def KEY_ARROW_DOWN, special_down
      special_char_def KEY_ARROW_RIGHT, special_right
      special_char_def KEY_ARROW_LEFT, special_left
      special_char_def KEY_TAB, special_tab
      special_char_def KEY_PAGE_UP, special_pgup
      special_char_def KEY_PAGE_DOWN, special_pgdown
      special_char_def KEY_CTRL_X, special_ctrlx
      special_char_def $00, $0000

special_space:
      .byte "[SPACE]",$00
special_enter:
      .byte "[ENTER]",$00
special_back:
      .byte "[BACK]",$00
special_esc:
      .byte "[ESC]",$00
special_up:
      .byte "[UP]",$00
special_down:
      .byte "[DOWN]",$00
special_left:
      .byte "[LEFT]",$00
special_right:
      .byte "[RIGHT]",$00
special_tab:
      .byte "[TAB]",$00
special_pgup:
      .byte "[PGUP]",$00
special_pgdown:
      .byte "[PGDN]",$00
special_ctrlx:
      .byte "[CTRLX]",$00
