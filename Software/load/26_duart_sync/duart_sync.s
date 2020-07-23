DUART_START = $8200

; READ:
DUART_R_MR0A  = DUART_START + $00
DUART_R_MR1A  = DUART_START + $00
DUART_R_MR2A  = DUART_START + $00
DUART_R_SRA   = DUART_START + $01
;Reserved
DUART_R_RxA   = DUART_START + $03
DUART_R_IPCR  = DUART_START + $04
DUART_R_ISR   = DUART_START + $05
DUART_R_CTU   = DUART_START + $06
DUART_R_CTL   = DUART_START + $07
DUART_R_MR0B  = DUART_START + $08
DUART_R_MR1B  = DUART_START + $08
DUART_R_MR2B  = DUART_START + $08
DUART_R_SRB   = DUART_START + $09
;Reserved
DUART_R_RxB   = DUART_START + $0b
DUART_R_USER  = DUART_START + $0c
DUART_R_PORT  = DUART_START + $0d
DUART_R_START = DUART_START + $0e
DUART_R_STOP  = DUART_START + $0f
; WRITE:
DUART_W_MR0A  = DUART_START + $00
DUART_W_MR1A  = DUART_START + $00
DUART_W_MR2A  = DUART_START + $00
DUART_W_CSRA  = DUART_START + $01
DUART_W_CRA   = DUART_START + $02
DUART_W_TxA   = DUART_START + $03
DUART_W_ACR   = DUART_START + $04
DUART_W_IMR   = DUART_START + $05
DUART_W_CTPU  = DUART_START + $06
DUART_W_CTPL  = DUART_START + $07
DUART_W_MR0B  = DUART_START + $08
DUART_W_MR1B  = DUART_START + $08
DUART_W_MR2B  = DUART_START + $08
DUART_W_CSRB  = DUART_START + $09
DUART_W_CRB   = DUART_START + $0a
DUART_W_TxB   = DUART_START + $0b
DUART_W_USER  = DUART_START + $0c
DUART_W_OPCR  = DUART_START + $0d
DUART_W_SOP12 = DUART_START + $0e
DUART_W_ROP12 = DUART_START + $0f

LF      = $0a   ; Line Feed
CR      = $0d   ; Carriage Return

        .code
init:
        ; disable powerdown
        lda #$f0
        sta DUART_W_CRA
        ; deassert RTS
        lda #$90
        sta DUART_W_CRA
        ; reset receiver
        lda #$20
        sta DUART_W_CRA
        ; reset transmitter
        lda #$30
        sta DUART_W_CRA
        ; reset break irq
        lda #$50
        sta DUART_W_CRA
        ; reset error
        lda #$40
        sta DUART_W_CRA

        ; Write to MR0A
        lda #$b0
        sta DUART_W_CRA
        ; No watchdog (b7=0)
        ; RxINT on at least one byte in FIFO (b6=00)
        ; TxINT on empty FIFO (b5:4=00)
        ; b3=0
        ; Extended mode (b2:0=001)
        lda #%00000001
        sta DUART_W_MR0A
        ; Write to MR1A
        lda #$10
        sta DUART_W_CRA
        ; No RTS (b7=0)
        ; RxINT on at least one byte in FIFO (b6=0)
        ; Char error mode (b5=0)
        ; No parity (b4:3=10)
        ; Odd parity (b2=1)
        ; 8 bits (b1:0=11)
        lda #%00010111
        sta DUART_W_MR1A
        ; Write to MR2A
        ; Automatically moves after access to MR1A
        ; lda #$02
        ; sta DUART_W_CRA
        ; Normal channel (b7:6=00)
        ; No RTS on Tx (b5=0)
        ; No CTS on Tx (b4=0)
        ; One stop bit (b3:0=0111)
        lda #%00000111
        sta DUART_W_MR2A
        ; Select BRG
        lda #%11100000
        sta DUART_W_ACR
        ; ; Select clock (19200 baud) on Tx and Rx
        ; lda #%11001100
        ; Let's go much faster - 115200
        lda #%11001100
        sta DUART_W_CSRA

        

        ; ; Enable both transmitter and receiver
        lda #%00000101
        sta DUART_W_CRA
        ; Disable all interrupt masks
        lda #%00000000
        sta DUART_W_IMR

        ldy #$0
loop:
        ldx #$00
@send_msg:
        lda message,x
        beq @msg_sent
        jsr write_char
        inx
        bra @send_msg
@msg_sent:
        iny
        cpy #$0a
        beq @exit
        jsr read_char
        bra loop
@exit:
        rts

write_char:
        ; write char to TxFIFO
        pha
@txrdya:
        lda DUART_R_SRA
        and #%00000100
        beq @txrdya
        pla
        sta DUART_W_TxA
        rts

read_char:
        ; wait for the character in Rx buffer to show up
        lda DUART_R_SRA
        and #%00000001
        beq read_char
        lda DUART_R_RxA
        rts

        .segment "RODATA"
message:
        .byte "Hello from SC26C92 (sync)!", CR, LF, $00