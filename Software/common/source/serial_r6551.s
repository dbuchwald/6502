        .include "zeropage.inc"
        .include "sys_const.inc"
        .include "sysram_map.inc"
        .include "utils.inc"
        
        .import __ACIA_START__
        .export _serial_init
        .export _handle_serial_irq
        .export _serial_is_data_available
        .export _serial_read_byte
        .export serial_write_byte
        .export serial_write_string
        .export _serial_write_byte
        .export _serial_write_string

ACIA_DATA    = __ACIA_START__ + $00
ACIA_STATUS  = __ACIA_START__ + $01
ACIA_COMMAND = __ACIA_START__ + $02
ACIA_CONTROL = __ACIA_START__ + $03

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

ACIA_DATA_AVAILABLE    = $01
ACIA_NO_DATA_AVAILABLE = $00

        .code

; POSITIVE C COMPLIANT
; channel number in A        
_serial_init:
        ; preserve registers
        pha
        phy
        ; calculate channel offset by multiplication
        tay
        lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_DISABLE_RTS_LOW | ACIA_RX_INT_ENABLE | ACIA_DTR_LOW)
        sta ACIA_COMMAND
        lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_19200)
        sta ACIA_CONTROL
        stz serial_rx_rptr,y
        stz serial_rx_wptr,y
        stz serial_tx_rptr,y
        stz serial_tx_wptr,y
        ply
        pla
        rts

; TENTATIVE C COMPLIANT
_handle_serial_irq:
        ; Preserve accumulator, x and y register
        pha
        phx
        phy
        ; store channel offset in Y
        tay
        ; Load current ACIA status
        lda ACIA_STATUS
        ; Stop processing if only CTS is high
        cmp #$80
        beq @cts_high
        ; Ignore IRQ bit, we already know
        asl
        ; ignore DSR
        asl
        ; ignore DCD
        asl
        ; Ignore the following code for ACIA chips that don't support TX IRQ (WDC65C51)
        .if acia_tx_irq=1
        ; TX buffer empty
        bpl @tx_empty_exit
        ; Preserve accumulator
        pha
        ; Compare TX write and read buffer pointers
        lda serial_tx_rptr,y
        cmp serial_tx_wptr,y
        bne @tx_send_character
        ; Both equal - nothing to send in buffer
        lda ACIA_COMMAND
        ; Disable TX interrupt now until new data sent
        and #%11110011
        ora #(ACIA_TX_INT_DISABLE_RTS_LOW)
        sta ACIA_COMMAND
        ; Restore value of accumulator (rolled ACIA STATUS)
        pla
        bra @tx_empty_exit
@tx_send_character:
        ; Otherwise, send new character
        tax
        ; TODO: single buffer now
        lda serial_tx_buffer,x
        sta ACIA_DATA
        ; Increase read buffer pointer
        inc serial_tx_rptr,y
        ; Compare pointers - is there any data
        lda serial_tx_rptr,y
        cmp serial_tx_wptr,y
        bne @tx_data_left_to_send
        ; Both equal - nothing to send in buffer
        lda ACIA_COMMAND
        ; Disable TX interrupt now until new data sent
        and #%11110011
        ora #(ACIA_TX_INT_DISABLE_RTS_LOW)
        sta ACIA_COMMAND
        ; Restore value of accumulator (rolled ACIA STATUS)
@tx_data_left_to_send:
        pla
@tx_empty_exit:
        ; End of R6551 specific code
        .endif
        ; Test the RX bit now
        asl
        ; Receive buffer full
        bpl @rx_full_exit
        ; Preserve accumulator again
        pha
        ; Read byte from RX
        lda ACIA_DATA
        ldx serial_rx_wptr,y
        ; Store in rx buffer
        ; TODO: Single buffer here 
        sta serial_rx_buffer,x
        ; Increase write buffer pointer
        inc serial_rx_wptr,y
        ; Check for receive buffer overflow condition
        lda serial_rx_wptr,y
        sec
        sbc serial_rx_rptr,y
        ; We have more than 128 characters to service in queue - overflow
        cmp #$80
        bcc @no_rx_overflow
        ; Raise RTS line to stop inflow
        lda ACIA_COMMAND
        and #%11110011
        ; ora #%00000001
        sta ACIA_COMMAND
@no_rx_overflow:
        pla
@rx_full_exit:
        ; Ignore overrun
        ; Ignore framing error
        ; Ignore parity error
@cts_high:
        ply
        plx
        pla
        rts

; POSITIVE C COMPLIANT - return value A
; Check if there is anything to receive and return in A
; 0 - data not available
; 1 - data available
_serial_is_data_available:
        phy
        tay
        lda serial_rx_wptr,y
        cmp serial_rx_rptr,y
        beq @no_data_found
        ply
        lda #(ACIA_DATA_AVAILABLE)
        rts
@no_data_found:
        ply
        lda #(ACIA_NO_DATA_AVAILABLE)
        rts

; POSITIVE C COMPLIANT
; Return one byte from RX buffer
_serial_read_byte:
        phy
        tay
        ; block until data available
        lda serial_rx_wptr,y
        cmp serial_rx_rptr,y
        beq _serial_read_byte
        ; proceed
        phx
        ldx serial_rx_rptr,y
        ; TODO: Single buffer here
        lda serial_rx_buffer,x
        ; Increase read buffer pointer
        inc serial_rx_rptr,y
        ; Store result in X for a while now
        tax
        ; Check how many characters are to be serviced
        lda serial_rx_wptr,y
        sec
        sbc serial_rx_rptr,y
        ; More than 64 - still overflow
        cmp #$40
        bcs @still_rx_overflow
        ; Otherwise accept more characters
        lda ACIA_COMMAND
        and #%11110011
        ; We might enable the TX empty interrupt without any data to write
        ; but there is no way of checking it, and the interrupt will 
        ; correct the setting if it should not be enabled
        ora #(ACIA_TX_INT_ENABLE_RTS_LOW)
        sta ACIA_COMMAND
@still_rx_overflow:
        ; Transfer result back to A
        txa
        plx
        ply
        rts

; NEGATIVE C COMPLIANT
; Write one byte to TX buffer
; Assume input in accumulator
; Assume channel in Y
serial_write_byte:
        ; below code works only for R6551 and compatibles
        .if acia_tx_irq=1
        ; Preserve x register
        phx
        ; Preserve input value
        pha
        ; Check if TX buffer full - if so, keep polling until more space available
@compare_with_read_pointer:
        ; Load current value of write pointer
        lda serial_tx_wptr,y
        sec
        sbc serial_tx_rptr,y
        cmp #$ff
        beq @compare_with_read_pointer
        ; Restore input value
        pla
        ; Write data to the TX buffer
        ldx serial_tx_wptr,y
        ; TODO: Single buffer
        sta serial_tx_buffer,x
        ; Increase pointer
        inc serial_tx_wptr,y
        ; Enable interrupt after tx buffer is empty
        pha
        lda ACIA_COMMAND
        and #%11110011
        ora #(ACIA_TX_INT_ENABLE_RTS_LOW)
        sta ACIA_COMMAND
        pla
        plx
        .else
        ; code below works for non-IRQ compliant devices, like WDC65C51
        ; store data in data register
        sta ACIA_DATA
        pha
        ; wait 1ms (more than 520us for 19200 baud)
        lda #$01
        jsr _delay_ms
        pla
        ; done, sent
        .endif
        rts

; C Wrapper
_serial_write_byte:
        pha
        lda (sp)
        tay
        pla
        jsr serial_write_byte
        inc_ptr sp
        rts

; NEGATIVE C COMPLIANT
; Write null terminated string to TX buffer
; Assume input pointer in A,X
; Assume channel number in Y
serial_write_string:
        sta ptr1
        stx ptr1+1
        ; init index
        ldx #$00
@string_loop:
        ; load character
        lda (ptr1),x
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
        ; return
        rts

; C Wrapper
_serial_write_string:
        pha
        lda (sp)
        tay
        pla
        jsr serial_write_string
        inc_ptr sp
        rts