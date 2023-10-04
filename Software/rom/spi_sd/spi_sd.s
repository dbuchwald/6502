      .setcpu "65C02"

      .include "via_const.inc" 
      .include "via.inc"

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


SD_CS   = %00010000
SD_SCK  = %00001000
SD_MOSI = %00000100
SD_MISO = %00000010
SD_CARD = %00000001

SD_DDR = SD_CS | SD_SCK | SD_MOSI


      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

       .BSS

frame: .res 1

; count: .res 1


      .code

init:  
      jsr _lcd_init
    ;   jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      writeln_tty #hello_msg

      lda #SD_DDR
      sta VIA2_DDRA

      jsr _strobe_led

      lda #'M'
      jsr _tty_send_character

    lda #$5A
    jsr _tty_write_hex

      lda #':'
      jsr _tty_send_character


      lda #'I'
      jsr _tty_send_character



    ; We need to apply around 80 clock pulses with CS and MOSI high.
    ; Normally MOSI doesn't matter when CS is high, but the card is
    ; not yet is SPI mode, and in this non-SPI state it does care.

    lda #SD_CS | SD_MOSI
    ldx #160               ; toggle the clock 160 times, so 80 low-high transitions
preinitloop:
    eor #SD_SCK
    sta VIA2_PORTA
    dex
    bne preinitloop
  
    ; Read a byte from the card, expecting $ff as no commands have been sent
    jsr sd_readbyte
    jsr _tty_write_hex



cmd0:
    ; GO_IDLE_STATE - resets card to idle state
    ; This also puts the card in SPI mode.
    ; Unlike most commands, the CRC is checked.
      lda #':'
      jsr _tty_send_character


    lda #'c'
    jsr _tty_send_character
    lda #$00
    jsr _tty_write_hex

     lda #':'
      jsr _tty_send_character

    lda #SD_MOSI           ; pull CS low to begin command
    sta VIA2_PORTA

    ; CMD0, data 00000000, crc 95
    lda #$40
    jsr sd_writebyte
    lda #$00
    jsr sd_writebyte
    lda #$00
    jsr sd_writebyte
    lda #$00
    jsr sd_writebyte
    lda #$00
    jsr sd_writebyte
    lda #$95
    jsr sd_writebyte

    ; Read response and print it - should be $01 (not initialized)
    jsr sd_waitresult
    pha
    jsr _tty_write_hex

    lda #SD_CS | SD_MOSI   ; set CS high again
    sta VIA2_PORTA

      lda #':'
      jsr _tty_send_character


    ; Expect status response $01 (not initialized)
    pla
    cmp #$01
    bne initfailed


    lda #'Y'
    jsr _tty_send_character
    bra loop

initfailed:
    lda #'X'
    jsr _tty_send_character

loop:
      jsr _blink_led  

      lda VIA2_PORTA
      and #SD_CARD

      bra loop
      



sd_readbyte:
    .scope
    ; Enable the card and tick the clock 8 times with MOSI high, 
    ; capturing bits from MISO and returning them

    ldx #8                      ; we'll read 8 bits
loop:

    lda #SD_MOSI                ; enable card (CS low), set MOSI (resting state), SCK low
    sta VIA2_PORTA

    lda #SD_MOSI | SD_SCK       ; toggle the clock high
    sta VIA2_PORTA

    lda VIA2_PORTA                   ; read next bit
    and #SD_MISO

    clc                         ; default to clearing the bottom bit
    beq bitnotset              ; unless MISO was set
    sec                         ; in which case get ready to set the bottom bit
bitnotset:

    tya                         ; transfer partial result from Y
    rol                         ; rotate carry bit into read result
    tay                         ; save partial result back to Y

    dex                         ; decrement counter
    bne loop                   ; loop if we need to read more bits

    rts
    .endscope


sd_writebyte:
    .scope
    ; Tick the clock 8 times with descending bits on MOSI
    ; SD communication is mostly half-duplex so we ignore anything it sends back here

    ldx #8                      ; send 8 bits

loop:
    asl                         ; shift next bit into carry
    tay                         ; save remaining bits for later

    lda #0
    bcc sendbit                ; if carry clear, don't set MOSI for this bit
    ora #SD_MOSI

sendbit:
    sta VIA2_PORTA                   ; set MOSI (or not) first with SCK low
    eor #SD_SCK
    sta VIA2_PORTA                   ; raise SCK keeping MOSI the same, to send the bit

    tya                         ; restore remaining bits to send

    dex
    bne loop                   ; loop if there are more bits to send

    rts
    .endscope

sd_waitresult:
    ; Wait for the SD card to return something other than $ff
    jsr sd_readbyte
    cmp #$ff
    beq sd_waitresult
    rts




      .segment "RODATA"

hello_msg:
      .byte "Graphics Test 1", $00
