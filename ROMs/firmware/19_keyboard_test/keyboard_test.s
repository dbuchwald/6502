      .setcpu "65C02"
      .include "utils.inc"
      .include "via.inc"
      .include "lcd.inc"
      .include "zeropage.inc"
      .segment "VECTORS"

      .word   $0000
      .word   init
      .word   read_data

      .code

init:
      ldx #$ff
      txs

handshake_init:
      stz VIA1_DDRA            ; VIA2 PORTA is all input
      stz VIA1_PORTA
                               ; define read handshake on VIA2 CA1/CA2
      lda #(VIA_PCR_CA1_INTERRUPT_NEGATIVE | VIA_PCR_CA2_OUTPUT_PULSE | VIA_PCR_CB1_INTERRUPT_NEGATIVE | VIA_PCR_CB2_OUTPUT_HIGH)
      sta VIA1_PCR
                               ; enable interrupt from VIA2 on CA1 (Data ready)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_CA1_FLAG)
      sta VIA1_IER

      jsr _lcd_init

      lda #$ff
      jsr _delay_ms
      lda VIA1_IFR
      lda VIA1_PORTA

      write_lcd hello_msg
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

      cli                      ; enable interrupt processing

program_loop:
      jmp program_loop

read_data:
      pha
      lda VIA1_PORTA           ; should trigger data taken signal
      cmp #$ff
      beq keyboard_connected
      cmp #$fe
      beq keyboard_disconnected
      jsr _lcd_clear
      write_lcd key_msg
      ldx #$00
special_keys_loop:
      cmp special_keys,x
      beq print_special_key
      inx
      inx
      inx
      ldy special_keys,x
      cpy #$00
      bne special_keys_loop
      bra regular_char
print_special_key:
      inx
      lda special_keys,x
      sta lcd_out_ptr
      inx
      lda special_keys,x
      sta lcd_out_ptr+1
      jsr _lcd_print
      bra read_data_end
regular_char:
      jsr _lcd_print_char
      write_lcd key_part_two
      jsr _convert_to_hex
      txa
      jsr _lcd_print_char
      tya
      jsr _lcd_print_char
      write_lcd key_part_three
      bra read_data_end

keyboard_connected:
      jsr _lcd_clear
      write_lcd conn_msg
      bra read_data_end

keyboard_disconnected:
      jsr _lcd_clear
      write_lcd disconn_msg
      bra read_data_end

read_data_end:
      pla
      rti

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

      special_char_def $0d, special_enter
      special_char_def $1b, special_esc
      special_char_def $7f, special_back
      special_char_def $0b, special_up
      special_char_def $0a, special_down
      special_char_def $15, special_right
      special_char_def $08, special_left
      special_char_def $09, special_tab
      special_char_def $19, special_pgup
      special_char_def $1a, special_pgdown
      special_char_def $00, $0000

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
