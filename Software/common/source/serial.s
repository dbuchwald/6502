        .setcpu "65C02"
        .include "zeropage.inc"
        .include "sys_const.inc"
        .include "sysram_map.inc"
        .include "utils.inc"
        .include "macros.inc"
        
        .export _serial_init
        .export _serial_is_data_available
        .export _serial_read_byte
        .export serial_write_byte
        .export serial_write_string
        .export _serial_write_byte
        .export _serial_write_string

        .import _serial_init_controller
        .import _serial_notify_read
        .import _serial_notify_write

        .code

; POSITIVE C COMPLIANT
; channel number in A        
_serial_init:
        ; preserve registers
        pha
        phx
        ; calculate channel offset by multiplication
        tax
        stz serial_rx_rptr,x
        stz serial_rx_wptr,x
        stz serial_tx_rptr,x
        stz serial_tx_wptr,x
        ; init pointers
        lda #<(serial_rx_buffer)
        sta serial_rx_buffer_ptr,x
        lda #>(serial_rx_buffer)
        sta serial_rx_buffer_ptr+1,x
        lda #<(serial_tx_buffer)
        sta serial_tx_buffer_ptr,x
        lda #>(serial_tx_buffer)
        sta serial_tx_buffer_ptr+1,x
        ; preserve channel number
        stx tmp1
        ; keep adding buffer size to offset
@pointer_loop:
        lda tmp1
        beq @done
        clc
        lda #<(SERIAL_RX_BUFFER_SIZE)
        adc serial_rx_buffer_ptr,x
        sta serial_rx_buffer_ptr,x
        lda #>(SERIAL_RX_BUFFER_SIZE)
        adc serial_rx_buffer_ptr+1,x
        sta serial_rx_buffer_ptr+1,x
        clc
        lda #<(SERIAL_TX_BUFFER_SIZE)
        adc serial_tx_buffer_ptr,x
        sta serial_tx_buffer_ptr,x
        lda #>(SERIAL_TX_BUFFER_SIZE)
        adc serial_tx_buffer_ptr+1,x
        sta serial_tx_buffer_ptr+1,x
        dec tmp1
        bra @pointer_loop
@done:
        ; memory allocation completed
        ; move on to controller init
        jsr _serial_init_controller
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
        lda #(SERIAL_DATA_AVAILABLE)
        rts
@no_data_found:
        ply
        lda #(SERIAL_NO_DATA_AVAILABLE)
        rts

; POSITIVE C COMPLIANT
; Return one byte from RX buffer
_serial_read_byte:
        phx
        tax
@wait_for_data:
        ; block until data available
        lda serial_rx_wptr,x
        cmp serial_rx_rptr,x
        beq @wait_for_data
        ; proceed
        phy
        ldy serial_rx_rptr,x
        ; Copy selected buffer pointer
        ; to temporary one for indirect
        ; access
        lda serial_rx_buffer_ptr,x
        sta serial_buffer_tmp_ptr
        lda serial_rx_buffer_ptr+1,x
        sta serial_buffer_tmp_ptr+1
        lda (serial_buffer_tmp_ptr),y
        ; Increase read buffer pointer
        inc serial_rx_rptr,x
        jsr _serial_notify_read
        ply
        plx
        rts

; NEGATIVE C COMPLIANT
; Write one byte to TX buffer
; Assume input in accumulator
; Assume channel in X
serial_write_byte:
        ; Preserve y register
        phy
        ; Preserve input value
        pha
        ; Check if TX buffer full - if so, keep polling until more space available
@compare_with_read_pointer:
        ; Load current value of write pointer
        lda serial_tx_wptr,x
        sec
        sbc serial_tx_rptr,x
        cmp #$ff
        beq @compare_with_read_pointer
        ; Copy selected buffer pointer
        ; to temporary one for indirect
        ; access
        lda serial_tx_buffer_ptr,x
        sta serial_buffer_tmp_ptr
        lda serial_tx_buffer_ptr+1,x
        sta serial_buffer_tmp_ptr+1
        ; Restore input value
        pla
        ; Write data to the TX buffer
        ldy serial_tx_wptr,x
        sta (serial_buffer_tmp_ptr),y
        ; Increase pointer
        inc serial_tx_wptr,x
        jsr _serial_notify_write
        ply
        rts

; C Wrapper
_serial_write_byte:
        pha
        lda (sp)
        tax
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
        ; move Y to X for serial_write_byte
        tya
        tax
        ; init index
        ldy #$00
@string_loop:
        ; load character
        lda (ptr1),y
        ; stop if null
        beq @end_loop
        ; send char to buffer
        jsr serial_write_byte
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