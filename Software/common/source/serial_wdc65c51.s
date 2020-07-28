        .setcpu "65C02"
        .include "zeropage.inc"
        .include "sys_const.inc"
        .include "sysram_map.inc"
        .include "utils.inc"
        .include "macros.inc"
        
        .import __ACIA_START__

        .export _handle_serial_irq
        .export _serial_init_controller
        .export _serial_notify_read
        .export _serial_notify_write
        .export _serial_disable_controller

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

        .code

; POSITIVE C COMPLIANT
; channel number in A        
_serial_init_controller:
        lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_DISABLE_RTS_LOW | ACIA_RX_INT_ENABLE | ACIA_DTR_LOW)
        sta ACIA_COMMAND
        lda #(ACIA_STOP_BITS_1 | ACIA_DATA_BITS_8 | ACIA_CLOCK_INT | ACIA_BAUD_19200)
        sta ACIA_CONTROL
        rts

; TENTATIVE C COMPLIANT
_handle_serial_irq:
        ; Preserve accumulator
        pha
        bit ACIA_STATUS
        bmi @process_irq
        jmp @no_irq
@process_irq:
        ; Process, preserve x and y register 
        phx
        phy
        ; Preserve temporary buffer pointer
        ldx serial_buffer_tmp_ptr
        phx
        ldx serial_buffer_tmp_ptr+1
        phx
        ; store channel offset in X
        tax
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
        ; Test the RX bit now
        asl
        ; Receive buffer full
        bpl @rx_full_exit
        ; Preserve accumulator again
        pha
        ; Copy buffer pointer to temporary
        ; pointer for indirection
        lda serial_rx_buffer_ptr,x
        sta serial_buffer_tmp_ptr
        lda serial_rx_buffer_ptr+1,x
        sta serial_buffer_tmp_ptr+1
        ; Read byte from RX
        lda ACIA_DATA
        ldy serial_rx_wptr,x
        ; Store in rx buffer
        sta (serial_buffer_tmp_ptr),y
        ; Increase write buffer pointer
        inc serial_rx_wptr,x
        ; Check for receive buffer overflow condition
        lda serial_rx_wptr,x
        sec
        sbc serial_rx_rptr,x
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
        pla
        sta serial_buffer_tmp_ptr+1
        pla
        sta serial_buffer_tmp_ptr
        ply
        plx
@no_irq:
        pla
        rts

; X contains channel number
_serial_notify_read:
        pha
        ; Check how many characters are to be serviced
        lda serial_rx_wptr,x
        sec
        sbc serial_rx_rptr,x
        ; More than 64 - still overflow
        cmp #$40
        bcs @still_rx_overflow
        ; Otherwise accept more characters
        lda ACIA_COMMAND
        and #%11110011
        ora #(ACIA_TX_INT_DISABLE_RTS_LOW)
        sta ACIA_COMMAND
@still_rx_overflow:
        ; Transfer result back to A
        pla
        rts

; A contains written character
; X contains channel number
_serial_notify_write:
        ; store data in data register
        sta ACIA_DATA
        ; Increase read buffer pointer
        inc serial_tx_rptr,x
        pha
        ; wait 1ms (more than 520us for 19200 baud)
        lda #$01
        jsr _delay_ms
        pla
        ; done, sent
        rts

; POSITIVE C COMPLIANT
; channel number in A        
_serial_disable_controller:
        lda #(ACIA_PARITY_DISABLE | ACIA_ECHO_DISABLE | ACIA_TX_INT_DISABLE_RTS_LOW | ACIA_RX_INT_DISABLE | ACIA_DTR_LOW)
        sta ACIA_COMMAND
        rts
