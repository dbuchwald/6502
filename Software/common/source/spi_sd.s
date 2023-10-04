; SD card interface module
; Based on https://github.com/gfoot/sdcard6502
; Key modifications - extra clocks before and after send command!
;
; Uses zero-page variable storage:
;   sd_address - 2 bytes
;   sd_currentsector - 4 bytes

    .include "via_const.inc" 
    .include "via.inc"
    .include "zeropage.inc"

    .export sd_init
    .export sd_readbyte 
    .export sd_writebyte 

    .export sd_waitresult 
    .export sd_sendcommand 

    .export sd_readsector
    .export sd_readpage

    .export idle_clock


SD_CS   = %00010000
SD_SCK  = %00001000
SD_MOSI = %00000100
SD_MISO = %00000010
SD_CARD = %00000001

SD_DDR = SD_CS | SD_SCK | SD_MOSI

    .RODATA

cmd0_bytes:
  .byte $40, $00, $00, $00, $00, $95
cmd8_bytes:
  .byte $48, $00, $00, $01, $aa, $87
cmd55_bytes:
  .byte $77, $00, $00, $00, $00, $01
cmd41_bytes:
  .byte $69, $40, $00, $00, $00, $01


    .code

sd_init:
    ; Let the SD card boot up, by pumping the clock with SD CS disabled

    ; We need to apply around 80 clock pulses with CS and MOSI high.
    ; Normally MOSI doesn't matter when CS is high, but the card is
    ; not yet is SPI mode, and in this non-SPI state it does care.

    ; result in Acc; 0 = OK, 1 if there's an error
    .scope

    ; set up PORT A for SPI
    lda #SD_CS | SD_MOSI
    sta VIA2_PORTA
    lda #SD_DDR
    sta VIA2_DDRA

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
    sta sd_currentsector
    lda #>cmd0_bytes
    sta sd_currentsector+1

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
    sta sd_currentsector
    lda #>cmd8_bytes
    sta sd_currentsector+1

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
    sta sd_currentsector
    lda #>cmd55_bytes
    sta sd_currentsector+1

    jsr sd_sendcommand

    ; Expect status response $01 (not initialized)
    cmp #$01
    bne initfailed

cmd41: 
    ; APP_SEND_OP_COND - send operating conditions, initialize card
    lda #<cmd41_bytes
    sta sd_currentsector
    lda #>cmd41_bytes
    sta sd_currentsector+1

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
    lda #0
    rts

initfailed:
    lda #1

    rts
    .endscope


sd_readbyte:
    .scope
    ; Enable the card and tick the clock 8 times with MOSI high, 
    ; capturing bits from MISO and returning them

    ldx #$fe    ; Preloaded with seven ones and a zero, so we stop after eight bits

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

    txa                         ; transfer partial result from X
    rol                         ; rotate carry bit into read result
    tax                         ; save partial result back to X

    bcs loop                    ; loop if we need to read more bits

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
    bcc sendbit                 ; if carry clear, don't set MOSI for this bit
    ora #SD_MOSI

sendbit:
    sta VIA2_PORTA              ; set MOSI (or not) first with SCK low
    eor #SD_SCK
    sta VIA2_PORTA              ; raise SCK keeping MOSI the same, to send the bit

    tya                         ; restore remaining bits to send

    dex
    bne loop                    ; loop if there are more bits to send

    rts
    .endscope


;------

sd_waitresult:
    ; Wait for the SD card to return something other than $ff
    jsr sd_readbyte
    cmp #$ff
    beq sd_waitresult
    rts

;------



sd_sendcommand:
      ; Send 6 byte command pointed to by th sd_currentsector in zero page
      ; the command is NOT corrupted by this routine (so commands can be repeated)
      ; Result returned in acc
  
      phx
      phy

      ldx #$10
      lda #SD_CS | SD_MOSI ; <- leave clock low at end?
idle1:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne idle1

      lda #SD_MOSI           ; pull CS low to begin command
      sta VIA2_PORTA

      ldy #0
      lda (sd_currentsector),y    ; command byte
      jsr sd_writebyte
      ldy #1
      lda (sd_currentsector),y    ; data 1
      jsr sd_writebyte
      ldy #2
      lda (sd_currentsector),y    ; data 2
      jsr sd_writebyte
      ldy #3
      lda (sd_currentsector),y    ; data 3
      jsr sd_writebyte
      ldy #4
      lda (sd_currentsector),y    ; data 4
      jsr sd_writebyte
      ldy #5
      lda (sd_currentsector),y    ; crc
      jsr sd_writebyte

      jsr sd_waitresult
      pha

      ; End command
      lda #SD_CS | SD_MOSI   ; set CS high again
      ldx #$0F
idle2:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne idle2

      pla   ; restore result code
      ply
      plx
      rts


;------

sd_readsector:
    ; Read a sector from the SD card.  A sector is 512 bytes.
    ;
    ; Parameters:
    ;    sd_currentsector   32-bit sector number
    ;    sd_address     address of buffer to receive data

    ; result in Acc; 0 = OK, 1 if there's an error
    .scope
  
    ; lda #SD_MOSI
    ; sta VIA2_PORTA

    ; Command 17, arg is sector number, crc not checked
    lda #$51                    ; CMD17 - READ_SINGLE_BLOCK
    jsr sd_writebyte
    lda sd_currentsector+3   ; sector 24:31
    jsr sd_writebyte
    lda sd_currentsector+2   ; sector 16:23
    jsr sd_writebyte
    lda sd_currentsector+1   ; sector 8:15
    jsr sd_writebyte
    lda sd_currentsector     ; sector 0:7
    jsr sd_writebyte
    lda #$01                    ; crc (not checked)
    jsr sd_writebyte

    jsr sd_waitresult
    cmp #$00
    bne fail

    ; wait for data
    jsr sd_waitresult
    cmp #$fe
    bne fail

    ; Need to read 512 bytes - two pages of 256 bytes each
    jsr sd_readpage
    inc sd_address+1
    jsr sd_readpage
    dec sd_address+1

    ; not going to check, but DO need to read!
    jsr sd_readbyte ; CRC Byte 1
    jsr sd_readbyte ; CRC Byte 2

    ; End command
    lda #SD_CS | SD_MOSI
    sta VIA2_PORTA

    jsr idle_clock

succeed:
    lda #0
    rts

fail:
    lda #1
    rts
    .endscope


;------

sd_readpage:
    .scope
    ; Read 256 bytes to the address at sd_address
    phy
    pha

    ldy #0
readloop:
    jsr sd_readbyte
    sta (sd_address),y
    iny
    bne readloop

    pla
    ply
    rts
    .endscope

;------

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


idle_clock:
    ; Idle / Clock + NOT CS for eight cycles
      .scope
      pha
      phx

      lda #SD_CS | SD_MOSI   ; set CS high again
      sta VIA2_PORTA
      ldx #$0F ; clock starts low, has 8 rising edges
idle:
      eor #SD_SCK
      sta VIA2_PORTA
      dex
      bne idle

      plx
      pla
      rts
    .endscope