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
        .export _acia_write_string

ACIA_DATA    = __ACIA_START__ + $00
ACIA_STATUS  = __ACIA_START__ + $01
ACIA_COMMAND = __ACIA_START__ + $02
ACIA_CONTROL = __ACIA_START__ + $03

ACIA_RX_BUFFER_SIZE = 256
ACIA_TX_BUFFER_SIZE = 256

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
        .code
        
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
        ora #(ACIA_TX_INT_DISABLE_RTS_LOW)
        sta ACIA_COMMAND
        ; Restore value of accumulator (rolled ACIA STATUS)
        pla
        bra tx_empty_exit
tx_send_character:
        ; Otherwise, send new character
        lda acia_tx_buffer,x
        sta ACIA_DATA
        ; Increase read buffer pointer
        inc acia_tx_rptr
        ; Compare pointers - is there any data
        lda acia_tx_rptr
        cmp acia_tx_wptr
        bne tx_data_left_to_send
        ; Both equal - nothing to send in buffer
        lda ACIA_COMMAND
        ; Disable TX interrupt now until new data sent
        and #%11110011
        ora #(ACIA_TX_INT_DISABLE_RTS_LOW)
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
        inc acia_rx_wptr
        ; Check for receive buffer overflow condition
        lda acia_rx_wptr
        sec
        sbc acia_rx_rptr
        ; We have more than 128 characters to service in queue - overflow
        cmp #$80
        bcc no_rx_overflow
        ; Raise RTS line to stop inflow
        lda ACIA_COMMAND
        and #%11110011
        ; ora #%00000001
        sta ACIA_COMMAND
no_rx_overflow:
        pla
rx_full_exit:
        ; Ignore overrun
        ; Ignore framing error
        ; Ignore parity error
cts_high:
        plx
        pla
        rts

; Check if there is anything to receive and return in Carry flag
; 0 - data not available
; 1 - data available
_acia_is_data_available:
        pha
        lda acia_rx_wptr
        cmp acia_rx_rptr
        beq @no_data_found
        sec
        pla
        rts
@no_data_found:
        clc
        pla
        rts

; Return one byte from RX buffer
_acia_read_byte:
        ; block until data available
        jsr _acia_is_data_available
        bcc _acia_read_byte
        ; proceed
        phx
        ldx acia_rx_rptr
        lda acia_rx_buffer,x
        ; Increase read buffer pointer
        inc acia_rx_rptr
        ; Store result in X for a while now
        tax
        ; Check how many characters are to be serviced
        lda acia_rx_wptr
        sec
        sbc acia_rx_rptr
        ; More than 64 - still overflow
        cmp #$40
        bcs still_rx_overflow
        ; Otherwise accept more characters
        lda ACIA_COMMAND
        and #%11110011
        ; We might enable the TX empty interrupt without any data to write
        ; but there is no way of checking it, and the interrupt will 
        ; correct the setting if it should not be enabled
        ora #(ACIA_TX_INT_ENABLE_RTS_LOW)
        sta ACIA_COMMAND
still_rx_overflow:
        ; Transfer result back to A
        txa
        plx
        rts

; Write one byte to TX buffer
; Assume input in accumulator
_acia_write_byte:
        ; Preserve x register
        phx
        ; Preserve input value
        pha
        ; Check if TX buffer full - if so, keep polling until more space available
@compare_with_read_pointer:
        ; Load current value of write pointer
        lda acia_tx_wptr
        sec
        sbc acia_tx_rptr
        cmp #$ff
        beq @compare_with_read_pointer
        ; Restore input value
        pla
        ; Write data to the TX buffer
        ldx acia_tx_wptr
        sta acia_tx_buffer,x
        ; Increase pointer
        inc acia_tx_wptr
        ; Enable interrupt after tx buffer is empty
        pha
        lda ACIA_COMMAND
        and #%11110011
        ora #(ACIA_TX_INT_ENABLE_RTS_LOW)
        sta ACIA_COMMAND
        pla

        plx
        rts

; Write null terminated string to TX buffer
; Assume input pointer in ptr1
_acia_write_string:
        ; preserve A register
        pha
        ; preserve Y register
        phy
        ; init index
        ldy #$00
@string_loop:
        ; load character
        lda (ptr1),y
        ; stop if null
        beq @end_loop
        ; send char to buffer
        jsr _acia_write_byte
        ; increase index
        iny 
        ; prevent infinite loop
        beq @end_loop
        ; repeat
        bra @string_loop
@end_loop:
        ; restore Y register
        ply
        ; restore A register
        pla
        ; return
        rts

        .segment "BSS"
acia_rx_buffer:
        .res ACIA_RX_BUFFER_SIZE
acia_tx_buffer:
        .res ACIA_TX_BUFFER_SIZE
