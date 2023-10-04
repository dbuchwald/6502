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

zp_sd_cmd_address = tmp1



      .segment "VECTORS"
      .word   $0000
      .word   init
      .word   $0000

       .BSS

frame: .res 1


      .code

init:  
      ; set up PORT A for SPI
      lda #SD_CS | SD_MOSI
      sta VIA2_PORTA
      lda #SD_DDR
      sta VIA2_DDRA


      jsr _lcd_init
    ;   jsr vdp_text_init
      jsr _blink_init

      lda #( TTY_CONFIG_OUTPUT_LCD |TTY_CONFIG_INPUT_KEYBOARD )
      jsr _tty_init
      ;writeln_tty #hello_msg


      jsr _strobe_led

      jsr sd_init

done:
      jsr _strobe_led
      bra done




;----------------------------


sd_init:
      ; Let the SD card boot up, by pumping the clock with SD CS disabled

      ; We need to apply around 80 clock pulses with CS and MOSI high.
      ; Normally MOSI doesn't matter when CS is high, but the card is
      ; not yet is SPI mode, and in this non-SPI state it does care.
      .scope
      lda #SD_CS | SD_MOSI
      ldx #160               ; toggle the clock 160 times, so 80 low-high transitions (spec is 74)

preinitloop:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne preinitloop

cmd0:
      ; GO_IDLE_STATE - resets card to idle state
      ; This also puts the card in SPI mode.
      ; Unlike most commands, the CRC is checked.
      lda #<cmd0_bytes
      sta zp_sd_cmd_address
      lda #>cmd0_bytes
      sta zp_sd_cmd_address+1

      jsr sd_sendcommand

      ; Expect status response $01 (not initialized)
      cmp #$01
      beq cmd8

      ; do a single retry
      ; This never seems to be necessary for a warm start, 
      ; but executes about 25% of the time for a cold start.
      ; (command pointer should still be valid)
      jsr sd_sendcommand

      ; Expect status response $01 (not initialized)
      cmp #$01
      bne initfailed

cmd8:
      ; SEND_IF_COND - tell the card how we want it to operate (3.3V, etc)
      lda #<cmd8_bytes
      sta zp_sd_cmd_address
      lda #>cmd8_bytes
      sta zp_sd_cmd_address+1

      jsr sd_sendcommand

      ; Expect status response $01 (not initialized)
      cmp #$01
      bne initfailed

      ; Read 32-bit return value, but ignore it
      jsr sd_readbyte
      jsr sd_readbyte
      jsr sd_readbyte
      jsr sd_readbyte
      lda #SD_CS | SD_MOSI   ; restore 'idle'
      sta VIA2_PORTA


cmd55:
      ; APP_CMD - required prefix for ACMD commands
      lda #<cmd55_bytes
      sta zp_sd_cmd_address
      lda #>cmd55_bytes
      sta zp_sd_cmd_address+1

      jsr sd_sendcommand

      ; Expect status response $01 (not initialized)
      cmp #$01
      bne initfailed

cmd41: 
      ; APP_SEND_OP_COND - send operating conditions, initialize card
      lda #<cmd41_bytes
      sta zp_sd_cmd_address
      lda #>cmd41_bytes
      sta zp_sd_cmd_address+1

      jsr sd_sendcommand

      ; Status response $00 means initialised
      cmp #$00
      beq initialized

      ; Otherwise expect status response $01 (not initialized)
      cmp #$01
      bne initfailed

      ; Not initialized yet, so wait a while then try again.
      ; This retry is important, to give the card time to initialize.
      ;jsr delay
      jsr shortdelay
      jmp cmd55


initialized:
  lda #'Y'
  jsr _tty_send_character
  rts

initfailed:
  lda #'X'
  jsr _tty_send_character

;loop:
;   jmp loop

      rts
      .endscope

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

    lda VIA2_PORTA              ; read next bit
    and #SD_MISO

    clc                         ; default to clearing the bottom bit
    beq bitnotset               ; unless MISO was set
    sec                         ; in which case get ready to set the bottom bit
bitnotset:

    tya                         ; transfer partial result from Y
    rol                         ; rotate carry bit into read result
    tay                         ; save partial result back to Y

    dex                         ; decrement counter
    bne loop                    ; loop if we need to read more bits


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





sd_sendcommand:
      ; Send 6 byte command pointed to by th zp_sd_cmd_address in zero page
      ; the command is NOT corrupted by this routine (so commands can be repeated)
      ; Result returned in acc
  
      ; Debug print which command is being executed
      ; jsr _lcd_clear
      ; lda #':'
      ; jsr _tty_send_character

      ; lda #'C'
      ; jsr _tty_send_character
      phx
      phy

      ldx #$10
      lda #SD_CS | SD_MOSI ; <- leave clock low at end?
idle1:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne idle1

      ; ldx #0
      ; lda (zp_sd_cmd_address,x)
      ; jsr _tty_write_hex

      lda #SD_MOSI           ; pull CS low to begin command
      sta VIA2_PORTA

      ldy #0
      lda (zp_sd_cmd_address),y    ; command byte
      jsr sd_writebyte
      ldy #1
      lda (zp_sd_cmd_address),y    ; data 1
      jsr sd_writebyte
      ldy #2
      lda (zp_sd_cmd_address),y    ; data 2
      jsr sd_writebyte
      ldy #3
      lda (zp_sd_cmd_address),y    ; data 3
      jsr sd_writebyte
      ldy #4
      lda (zp_sd_cmd_address),y    ; data 4
      jsr sd_writebyte
      ldy #5
      lda (zp_sd_cmd_address),y    ; crc
      jsr sd_writebyte

      jsr sd_waitresult
      pha

      ; End command
      lda #SD_CS | SD_MOSI   ; set CS high again
      ldx #$10
idle2:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne idle2

      ; Debug print the result code
      ; jsr _tty_write_hex
      ; jsr _tty_send_newline

      pla   ; restore result code
      ply
      plx
      rts





shortdelay:
      .scope
      ldx #$01
      ldy #$A0
loop:
      dey
      bne loop
      dex
      bne loop
      rts
      .endscope




delay:
      .scope
      ldx #0
      ldy #0
loop:
      dey
      bne loop
      dex
      bne loop
      rts
      .endscope

longdelay:
      jsr mediumdelay
      jsr mediumdelay
      jsr mediumdelay

mediumdelay:
      jsr delay
      jsr delay
      jsr delay
      jmp delay
      


      .segment "RODATA"

hello_msg:
      .byte "Graphics Test 1", $00


cmd0_bytes:
  .byte $40, $00, $00, $00, $00, $95
cmd8_bytes:
  .byte $48, $00, $00, $01, $aa, $87
cmd55_bytes:
  .byte $77, $00, $00, $00, $00, $01
cmd41_bytes:
  .byte $69, $40, $00, $00, $00, $01


