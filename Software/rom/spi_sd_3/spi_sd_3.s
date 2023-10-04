      .setcpu "65C02"

      .include "via_const.inc" 
      .include "via.inc"

      .include "lcd.inc"
      .include "blink.inc"
      .include "tty.inc"

      .include "spi_sd.inc"
 
      .include "zeropage.inc"


SD_CS   = %00010000
SD_SCK  = %00001000
SD_MOSI = %00000100
SD_MISO = %00000010
SD_CARD = %00000001

SD_DDR = SD_CS | SD_SCK | SD_MOSI

zp_sd_cmd_address = tmp1



      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

       .BSS

frame: .res 1


      .code

init:  
      jsr _lcd_init
    ;   jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      ;writeln_tty #hello_msg

      jsr _strobe_led

      jsr sd_init

;-----
      jsr _lcd_clear
      lda #'r'
      jsr _tty_send_character
      lda #'s'
      jsr _tty_send_character
      lda #':'
      jsr _tty_send_character

      lda #SD_MOSI
      sta VIA2_PORTA

      ; Command 17, arg is sector number, crc not checked
      lda #$51           ; CMD17 - READ_SINGLE_BLOCK
      jsr sd_writebyte
      lda #$00           ; sector 24:31
      jsr sd_writebyte
      lda #$00           ; sector 16:23
      jsr sd_writebyte
      lda #$00           ; sector 8:15
      jsr sd_writebyte
      lda #$00           ; sector 0:7
      jsr sd_writebyte
      lda #$01           ; crc (not checked)
      jsr sd_writebyte

      jsr sd_waitresult
      cmp #$00
      beq readsuccess

      lda #'f'
      jsr _tty_send_character
      jmp done

readsuccess:
      lda #'s'
      jsr _tty_send_character
      lda #':'
      jsr _tty_send_character

      ; wait for data
      jsr sd_waitresult
      cmp #$fe
      beq readgotdata

      lda #'f'
      jsr _tty_send_character
      jmp done

readgotdata:
      ; Need to read 512 bytes.  Read two at a time, 256 times.
      lda #0
      sta $00 ; counter
readloop:
      jsr sd_readbyte
      sta $01 ; byte1
      jsr sd_readbyte
      sta $02 ; byte2
      dec $00 ; counter
      bne readloop

      ; End command
      lda #SD_CS | SD_MOSI
      sta VIA2_PORTA

      ; Print the last two bytes read, in hex
      lda $01 ; byte1
      jsr _tty_write_hex
      lda $02 ; byte2
      jsr _tty_write_hex

;-----
done:
      jsr _strobe_led
      bra done

