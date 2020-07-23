        .include "core.inc"

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

BUFFER_SIZE = 256

        .zeropage
rxr_idx: .res 1
rxw_idx: .res 1
txr_idx: .res 1
txw_idx: .res 1

        .code
init:
        ; init buffer index variables
        stz rxr_idx
        stz rxw_idx
        stz txr_idx
        stz txw_idx
        ; clear buffer area
        ldx #$00
@clear_buffer:
        stz rxbuffer,X
        stz txbuffer,X
        inx
        beq @exit_clear
        bra @clear_buffer
@exit_clear:

        register_user_irq #service_duart_irq
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
        ; RxINT on at least one byte in FIFO (b6=0)
        ; TxINT on ready FIFO (b5:4=11)
        ; b3=0
        ; Extended mode (b2:0=001)
        lda #%00110001
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
        ; Enable Channel A Tx/Rx interrupts
        lda #%00000011
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
        ; Wait until all characters are sent out
@flush_loop:
        lda DUART_R_SRA
        and #%00001000
        beq @flush_loop
        ; Disable all interrupts
        lda #%00000000
        sta DUART_W_IMR
        rts

write_char:
        phx
        pha
        ; check txbuffer state
@check_buffer_full:
        lda txw_idx
        sec
        sbc txr_idx
        cmp #$ff
        beq @check_buffer_full
        pla
        ldx txw_idx
        sta txbuffer,X
        inc txw_idx
        lda #%00000011
        sta DUART_W_IMR
        plx
        rts

read_char:
        ; block until data available
        lda rxw_idx
        cmp rxr_idx
        beq read_char
        phx
        ldx rxr_idx
        lda rxbuffer,X
        inc rxr_idx
        plx
        rts

service_duart_irq:
        lda DUART_R_ISR
        asl
        asl
        asl
        asl
        asl
        asl
        ; check for Rx IRQ
        bpl @not_rx_irq
        pha
        lda DUART_R_RxA
        ldx rxw_idx
        sta rxbuffer,X
        inc rxw_idx
        pla
@not_rx_irq:
        asl
        bpl @not_tx_irq
        ; compare buffer indexes to see if there is anything to send
        ldx txr_idx
        cpx txw_idx
        bne @transmit_char
        ; nothing to send, disable tx interrupt temporarily
        lda #%00000010
        sta DUART_W_IMR
        bra @not_tx_irq       
@transmit_char:
        lda txbuffer,X
        sta DUART_W_TxA
        inc txr_idx
@not_tx_irq:
        rts

        .segment "BSS"
rxbuffer:
        .res BUFFER_SIZE
txbuffer:
        .res BUFFER_SIZE

        .segment "RODATA"
message:
        .byte "Hello from SC26C92 (async)!", CR, LF, $00