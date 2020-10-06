        .setcpu "65C02"
        .include "zeropage.inc"
        .include "sys_const.inc"
        .include "sysram_map.inc"
        .include "utils.inc"
        .include "macros.inc"

        .import __SERIAL_START__
        
        .export _handle_serial_irq
        .export _serial_init_controller
        .export _serial_notify_read
        .export _serial_notify_write
        .export _serial_disable_controller
        .export SERIAL_DRIVER_STRING

; READ:
DUART_R_MR0A  = __SERIAL_START__ + $00
DUART_R_MR1A  = __SERIAL_START__ + $00
DUART_R_MR2A  = __SERIAL_START__ + $00
DUART_R_SRA   = __SERIAL_START__ + $01
;Reserved
DUART_R_RxA   = __SERIAL_START__ + $03
DUART_R_IPCR  = __SERIAL_START__ + $04
DUART_R_ISR   = __SERIAL_START__ + $05
DUART_R_CTU   = __SERIAL_START__ + $06
DUART_R_CTL   = __SERIAL_START__ + $07
DUART_R_MR0B  = __SERIAL_START__ + $08
DUART_R_MR1B  = __SERIAL_START__ + $08
DUART_R_MR2B  = __SERIAL_START__ + $08
DUART_R_SRB   = __SERIAL_START__ + $09
;Reserved
DUART_R_RxB   = __SERIAL_START__ + $0b
DUART_R_USER  = __SERIAL_START__ + $0c
DUART_R_PORT  = __SERIAL_START__ + $0d
DUART_R_START = __SERIAL_START__ + $0e
DUART_R_STOP  = __SERIAL_START__ + $0f
; WRITE:
DUART_W_MR0A  = __SERIAL_START__ + $00
DUART_W_MR1A  = __SERIAL_START__ + $00
DUART_W_MR2A  = __SERIAL_START__ + $00
DUART_W_CSRA  = __SERIAL_START__ + $01
DUART_W_CRA   = __SERIAL_START__ + $02
DUART_W_TxA   = __SERIAL_START__ + $03
DUART_W_ACR   = __SERIAL_START__ + $04
DUART_W_IMR   = __SERIAL_START__ + $05
DUART_W_CTPU  = __SERIAL_START__ + $06
DUART_W_CTPL  = __SERIAL_START__ + $07
DUART_W_MR0B  = __SERIAL_START__ + $08
DUART_W_MR1B  = __SERIAL_START__ + $08
DUART_W_MR2B  = __SERIAL_START__ + $08
DUART_W_CSRB  = __SERIAL_START__ + $09
DUART_W_CRB   = __SERIAL_START__ + $0a
DUART_W_TxB   = __SERIAL_START__ + $0b
DUART_W_USER  = __SERIAL_START__ + $0c
DUART_W_OPCR  = __SERIAL_START__ + $0d
DUART_W_SOP12 = __SERIAL_START__ + $0e
DUART_W_ROP12 = __SERIAL_START__ + $0f

        .code

; POSITIVE C COMPLIANT
; channel number in A        
_serial_init_controller:
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
        ; lda #%00110001
        ; Normal mode (b2:0=000)        
        lda #%00110000
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
        ; Enable both transmitter and receiver
        lda #%00000101
        sta DUART_W_CRA
        ; Enable Channel A Tx/Rx interrupts
        lda #%00000011
        sta DUART_W_IMR
        rts

; TENTATIVE C COMPLIANT
_handle_serial_irq:
        phx
        phy
        tax
        lda serial_buffer_tmp_ptr
        pha
        lda serial_buffer_tmp_ptr+1
        pha
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
        lda serial_rx_buffer_ptr,x
        sta serial_buffer_tmp_ptr
        lda serial_rx_buffer_ptr+1,x
        sta serial_buffer_tmp_ptr+1

@keep_reading_input:
        lda DUART_R_RxA
        ldy serial_rx_wptr,x
        ; Store in rx buffer
        sta (serial_buffer_tmp_ptr),y
        ; Increase write buffer pointer
        inc serial_rx_wptr,x
        ; repeat until all bytes read
        lda DUART_R_SRA
        and #%00000001
        bne @keep_reading_input
        pla
@not_rx_irq:
        asl
        bpl @not_tx_irq
        ; compare buffer indexes to see if there is anything to send
        lda serial_tx_rptr,x
        cmp serial_tx_wptr,x
        bne @transmit_char
        ; nothing to send, disable tx interrupt temporarily
        lda #%00000010
        sta DUART_W_IMR
        bra @not_tx_irq       
@transmit_char:
        tay
        lda (serial_buffer_tmp_ptr),y
        sta DUART_W_TxA
        ; Increase read buffer pointer
        inc serial_tx_rptr,x
@not_tx_irq:
        pla
        sta serial_buffer_tmp_ptr+1
        pla
        sta serial_buffer_tmp_ptr
        ply
        plx
        rts

; X contains channel number
_serial_notify_read:
        rts

; A contains written character
; X contains channel number
_serial_notify_write:
        ; Enable interrupt after tx buffer is empty
        pha
        lda #%00000011
        sta DUART_W_IMR
        pla
        rts

; POSITIVE C COMPLIANT
; channel number in A        
_serial_disable_controller:
        ; Disable both transmitter and receiver
        lda #%00000000
        sta DUART_W_CRA
        ; Disable Channel A Tx/Rx interrupts
        lda #%00000000
        sta DUART_W_IMR
        rts
        rts

        .segment "RODATA"
SERIAL_DRIVER_STRING:
        .asciiz "SC26C92"