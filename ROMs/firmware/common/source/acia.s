        .include "zeropage.inc"
        
        .import __ACIA_START__
        .export ACIA_DATA
        .export ACIA_STATUS
        .export ACIA_COMMAND
        .export ACIA_CONTROL
        .export _acia_init
        .export _handle_acia_irq
        .export _acia_is_data_available
        .export _acia_read_byte
        .export _acia_write_byte

ACIA_DATA    = __ACIA_START__ + $00
ACIA_STATUS  = __ACIA_START__ + $01
ACIA_COMMAND = __ACIA_START__ + $02
ACIA_CONTROL = __ACIA_START__ + $03

ACIA_RX_BUFFER_SIZE = 64
ACIA_TX_BUFFER_SIZE = 64

ACIA_STOP_BITS_1 = %00000000
ACIA_STOP_BITS_2 = %10000000
ACIA_DATA_BITS_8 = %00000000
ACIA_DATA_BITS_7 = %00100000
ACIA_DATA_BITS_6 = %01000000
ACIA_DATA_BITS_5 = %01100000
ACIA_CLOCK_EXT   = %00000000
ACIA_CLOCK_INT   = %00010000
ACIA_BAUD_16XEXT = %00000000
ACIA_BAUD_50     = %00000001
ACIA_BAUD_75     = %00000010
ACIA_BAUD_109    = %00000011
ACIA_BAUD_134    = %00000100
ACIA_BAUD_150    = %00000101
ACIA_BAUD_300    = %00000110
ACIA_BAUD_600    = %00000111
ACIA_BAUD_1200   = %00001000
ACIA_BAUD_1800   = %00001001
ACIA_BAUD_2400   = %00001010
ACIA_BAUD_3600   = %00001011
ACIA_BAUD_4800   = %00001100
ACIA_BAUD_7200   = %00001101
ACIA_BAUD_9600   = %00001110
ACIA_BAUD_19200  = %00001111

; ACIA command register bit values

ACIA_PARITY_ODD              = %00000000
ACIA_PARITY_EVEN             = %01000000
ACIA_PARITY_MARK             = %10000000
ACIA_PARITY_SPACE            = %11000000
ACIA_PARITY_DISABLE          = %00000000
ACIA_PARITY_ENABLE           = %00100000
ACIA_ECHO_DISABLE            = %00000000
ACIA_ECHO_ENABLE             = %00010000
ACIA_TX_INT_DISABLE_RTS_HIGH = %00000000
ACIA_TX_INT_ENABLE_RTS_LOW   = %00000100
ACIA_TX_INT_DISABLE_RTS_LOW  = %00001000
ACIA_TX_INT_DISABLE_BREAK    = %00001100
ACIA_RX_INT_ENABLE           = %00000000
ACIA_RX_INT_DISABLE          = %00000010
ACIA_DTR_HIGH                = %00000000
ACIA_DTR_LOW                 = %00000001

; ACIA status register bit masks

ACIA_STATUS_IRQ        = 1 << 7
ACIA_STATUS_DSR        = 1 << 6
ACIA_STATUS_DCD        = 1 << 5
ACIA_STATUS_TX_EMPTY   = 1 << 4
ACIA_STATUS_RX_FULL    = 1 << 3
ACIA_STATUS_OVERRUN    = 1 << 2
ACIA_STATUS_FRAME_ERR  = 1 << 1
ACIA_STATUS_PARITY_ERR = 1 << 0

_acia_init:
        lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_DISABLE_RTS_LOW | ACIA_RX_INT_ENABLE | ACIA_DTR_LOW)
        sta ACIA_COMMAND
        lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_19200)
        sta ACIA_CONTROL
        stz acia_rx_rptr
        stz acia_rx_wptr
        stz acia_tx_rptr
        stz acia_tx_wptr
        rts

_handle_acia_irq:
        ; Preserve accumulator and x register
        pha
        phx
        ; Load current ACIA status
        lda ACIA_STATUS
        ; Stop processing if only CTS is high
        cmp #$80
        beq cts_high
        ; Ignore IRQ bit, we already know
        asl
        ; ignore DSR
        asl
        ; ignore DCD
        asl
        ; TX buffer empty
        bpl tx_empty_exit
        ; Preserve accumulator
        pha
        ; Compare TX write and read buffer pointers
        ldx acia_tx_rptr
        cpx acia_tx_wptr
        bne tx_send_character
        ; Both equal - nothing to send in buffer
        lda ACIA_COMMAND
        ; Disable TX interrupt now until new data sent
        and #%11110011
        ora #%00001000
        sta ACIA_COMMAND
        ; Restore value of accumulator (rolled ACIA STATUS)
        pla
        bra tx_empty_exit
tx_send_character:
        ; Otherwise, send new character
        lda acia_tx_buffer,x
        sta ACIA_DATA
        ; Increase read buffer pointer
        inx
        ; Check if we are overrunning the buffer
        cpx #(ACIA_TX_BUFFER_SIZE)
        ; We are not yet
        bne tx_send_complete
        ; Yes, we are, start from beginning
        ldx #00
tx_send_complete:
        ; Update buffer read pointer
        stx acia_tx_rptr
        cpx acia_tx_wptr
        bne tx_data_left_to_send
        ; Both equal - nothing to send in buffer
        lda ACIA_COMMAND
        ; Disable TX interrupt now until new data sent
        and #%11110011
        ora #%00001000
        sta ACIA_COMMAND
        ; Restore value of accumulator (rolled ACIA STATUS)
tx_data_left_to_send:
        pla
tx_empty_exit:
        ; Test the RX bit now
        asl
        ; Receive buffer full
        bpl rx_full_exit
        ; Preserve accumulator again
        pha
        ; Read byte from RX
        lda ACIA_DATA
        ldx acia_rx_wptr
        ; Store in rx buffer
        sta acia_rx_buffer,x
        ; Increase write buffer pointer
        inx
        ; Check for overrun again
        cpx #(ACIA_RX_BUFFER_SIZE)
        ; Not yet
        bne rx_recv_complete
        ; Yes, we are, start from beginning
        ldx #00
rx_recv_complete:
        ; Update buffer write pointer
        stx acia_rx_wptr
        pla
rx_full_exit:
        ; Ignore overrun
        ; Ignore framing error
        ; Ignore parity error
cts_high:
        plx
        pla
        rts

; Check if there is anything to receive
; 0 - data not available
; 1 - data available
_acia_is_data_available:
        ; clc
        ; clv
        ; lda acia_rx_wptr
        ; sbc acia_rx_rptr
        ; rts
        lda acia_rx_wptr
        cmp acia_rx_rptr
        beq @no_data_found
        lda #01
        rts
@no_data_found:
        lda #00
        rts

; Return one byte from RX buffer
_acia_read_byte:
        phx
        ldx acia_rx_rptr
        lda acia_rx_buffer,x
        ; Increase read buffer pointer
        inx
        ; Check for overrun
        cpx #(ACIA_RX_BUFFER_SIZE)
        ; Not yet
        bne read_complete
        ; Yes, we are, start from beginning
        ldx #00
read_complete:
        ; Update buffer write pointer
        stx acia_rx_rptr
        plx
        rts

; Write one byte to TX buffer
; Assume input in accumulator
_acia_write_byte:
        ; Preserve x register
        phx
        ; Load write pointer
;         ldx acia_tx_wptr
;         ; Compare against read buffer
;         cpx acia_tx_rptr
;         ; Only store new data in buffer
;         bne store_data_in_buffer
;         ; Since read and write pointers are equal - send immediately        
;         sta ACIA_DATA
;         ; Enable interrupt after tx buffer is empty
;         pha
;         lda ACIA_COMMAND
;         and #%11110011
;         ora #%00000100
;         sta ACIA_COMMAND
;         pla
; store_data_in_buffer:
;         sta acia_tx_buffer,x
;         ; Increase pointer
;         inx 
;         ; Check if we are overrunning the buffer
;         cpx #(ACIA_TX_BUFFER_SIZE)
;         ; We are not yet
;         bne send_complete
;         ; Yes, we are, start from beginning
;         ldx #00
; send_complete:
;         ; Update buffer read pointer
;         stx acia_tx_wptr
        ldx acia_tx_wptr
        sta acia_tx_buffer,x
        ; Increase pointer
        inx 
        ; Check if we are overrunning the buffer
        cpx #(ACIA_TX_BUFFER_SIZE)
        ; We are not yet
        bne send_complete
        ; Yes, we are, start from beginning
        ldx #00
send_complete:
        ; Update buffer read pointer
        stx acia_tx_wptr
        ; Enable interrupt after tx buffer is empty
        pha
        lda ACIA_COMMAND
        and #%11110011
        ora #%00000100
        sta ACIA_COMMAND
        pla

        plx
        rts

        .segment "BSS"
acia_rx_buffer:
        .res ACIA_RX_BUFFER_SIZE
acia_tx_buffer:
        .res ACIA_TX_BUFFER_SIZE
