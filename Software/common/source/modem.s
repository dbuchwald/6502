        .include "zeropage.inc"
        .include "acia.inc"
        .include "utils.inc"
        .export _modem_send
        .export _modem_receive

; Original implementation by Daryl Rictor 
; Slightly modified for this build (IRQ-based ACIA)

; Constants used
NULL    = $00   ; Null char
SOH     = $01   ; Start of Heading
ETX     = $03   ; End of Text
EOT     = $04   ; End of Transmission
ACK     = $06   ; Acknowledgement
LF      = $0a   ; Line Feed
CR      = $0d   ; Carriage Return
NAK     = $15   ; Negative Acknowledgement
CAN     = $18   ; Cancel
ESC     = $1b   ; Escape
SPACE   = $20   ; Space
DEL     = $7f   ; Delete
BS      = $7f   ; Backspace on Mac

RECEIVE_BUFFER_SIZE = 140

MODEM_RECEIVE_FAILED    = $00
MODEM_RECEIVE_SUCCESS   = $01
MODEM_RECEIVE_CANCELLED = $02

; Private modem variables
        .zeropage
crc:              .res 2
block_number:     .res 1
first_block_flag: .res 1
memory_pointer:   .res 2
delay_counter:    .res 1

        .code
_modem_send:
        ; nothing here yet
        rts

; NEGATIVE C COMPLIANT - uses carry flag for result
_modem_receive:
        ; Send prompt to terminal
        jsr @send_prompt
        ; Initialize block number
        ; X-Modem starts with 1
        lda #$01
        sta block_number
        ; Initialize first block flag
        ; Used to distinguish between
        ; Block 1 and blocks 1+$ff...
        sta first_block_flag
        ; Initialize CRC calculation
        stz crc
        stz crc+1
@enable_crc:
        ; Request CRC mode
        lda #('C')
        jsr _acia_write_byte
@read_block_loop:
        ; Poll for first character
        jsr @wait_for_next_char
        bcc @enable_crc
        ; jsr _acia_is_data_available
        ; bcc @read_block_loop
        ; Read data
        ; jsr _acia_read_byte
        ; Check control characters
        cmp #(ESC)
        bne @not_quitting_yet
        ; Transfer failed
        jsr @send_abort_message
        lda #(MODEM_RECEIVE_CANCELLED)
        ; Exit
        rts
@not_quitting_yet:
        cmp #(SOH)
        beq @start_of_header
        cmp #(EOT)
        ; Not SOH, not EOT, bad package then
        bne @bad_package
        jmp @receive_complete
@start_of_header:
        ldx #$00
@read_block_data_poll:
        jsr @wait_for_next_char
        ; No data loaded in 3 sec
        bcc @bad_package
@process_loaded_character:
        ; Store in buffer
        sta recv_buffer,x
        ; Increase pointer
        inx
        ; Check for package completion (132 chars)
        ; <Block#><_Block#><128bytes of data><CRC 2bytes>
        cpx #132
        ; Repeat until block loaded
        bne @read_block_data_poll
        ; Check buffer number
        ldx #$00
        lda recv_buffer,x
        cmp block_number
        ; Abort if block number incorrect
        beq @correct_block_number
@incorrect_block_number:
        jsr @send_error_message
        jsr @flush_input
        ; Receive failed
        lda #(MODEM_RECEIVE_FAILED)
        rts
@correct_block_number:
        ; Calculate second block indicator
        eor #$ff
        inx 
        cmp recv_buffer,x
        bne @incorrect_block_number
        ; Calculate block CRC
        jsr @calculate_block_crc
        ; Compare against data in buffer
        ; Y should point to second last byte
        lda recv_buffer,y
        cmp crc+1
        bne @bad_package
        iny
        lda recv_buffer,y
        cmp crc
        ; Both CRC bytes correct
        beq @correct_crc
@bad_package:
        ; Flush incoming input
        jsr @flush_input
        ; Send negative acknowledgement
        lda #(NAK)
        jsr _acia_write_byte
        ; Try the package again
        jmp @read_block_loop
@correct_crc:
        ldx #$02
        ; Check if this is the very first package
        lda block_number
        cmp #$01
        ; Not a first one
        bne @copy_block_to_memory
        ; Check if first first
        lda first_block_flag
        ; Apparently not
        beq @copy_block_to_memory
        ; Since it's first first block, it
        ; contains address of where the data
        ; should be loaded - move it to pointer
        lda recv_buffer,x
        sta memory_pointer
        inx
        lda recv_buffer,x
        sta memory_pointer+1
        inx
        ; No other first block with be first first
        stz first_block_flag
@copy_block_to_memory:
@copy_block_loop:
        ; Load byte from receive buffer
        lda recv_buffer,x
        ; Store in address directed by pointer
        sta (memory_pointer)
        ; Increase pointer
        inc memory_pointer
        ; Check if we crossed page boundary
        bne @increase_buffer_index
        ; We have crossed page boundary
        inc memory_pointer+1
@increase_buffer_index:
        inx
        ; Check if we copied all 128 bytes
        cpx #$82
        ; Nope, keep copying
        bne @copy_block_loop
        ; Block completed
        inc block_number
        lda #(ACK)
        jsr _acia_write_byte
        jmp @read_block_loop

@receive_complete:
        ; Acknowledge transfer completion
        lda #(ACK)
        jsr _acia_write_byte
        ; Flush any input pending (should be none)
        jsr @flush_input
        ; Send nice completion message
        jsr @send_completion_message
        ; Set successful completion flag
        lda #(MODEM_RECEIVE_SUCCESS)
        rts

@wait_for_next_char:
        ; 150 times 20ms
        lda #150
        sta delay_counter
@three_second_wait:
        ; Is there any data available?
        jsr _acia_is_data_available
        cmp #(ACIA_NO_DATA_AVAILABLE)
        ; Yes it is
        bne @three_read_data
        ; Nope, it's not, wait 20ms
        lda #20
        jsr _delay_ms
        ; Reduce counter
        dec delay_counter
        ; Repeat until found or zero
        bne @three_second_wait
        ; No data received, clear carry
        clc
        rts
@three_read_data:
        jsr _acia_read_byte
        ; Data loaded, set carry
        sec
        rts

@flush_input:
        ; 50 times 20 ms
        lda #50
        sta delay_counter
@one_second_wait:
        ; Is there any data available?
        jsr _acia_is_data_available
        cmp #(ACIA_NO_DATA_AVAILABLE)
        ; Yes it is
        bne @one_read_data
        ; Nope, it's not, wait 20ms
        lda #20
        jsr _delay_ms
        ; Reduce counter
        dec delay_counter
        ; Repeat until found or zero
        bne @one_second_wait
        rts
@one_read_data:
        jsr _acia_read_byte
        ; Data loaded, ignore, repeat
        bra @one_second_wait

@send_prompt:
        ldx #$00
@prompt_loop:
        lda prompt,x
        beq @prompt_done
        jsr _acia_write_byte
        inx
        bra @prompt_loop
@prompt_done:
        rts

@send_completion_message:
        ldx #$00
@success_loop:
        lda success_message,x
        beq @success_done
        jsr _acia_write_byte
        inx
        bra @success_loop
@success_done:
        rts

@send_error_message:
        ldx #$00
@error_loop:
        lda error_message,x
        beq @error_done
        jsr _acia_write_byte
        inx
        bra @error_loop
@error_done:
        rts

@send_abort_message:
        ldx #$00
@abort_loop:
        lda abort_message,x
        beq @abort_done
        jsr _acia_write_byte
        inx
        bra @abort_loop
@abort_done:
        rts

@calculate_block_crc:
        stz crc
        stz crc+1
        ldy #$02
@crc_loop:
        lda recv_buffer,y
        eor crc+1
        tax
        lda crc
        eor crchi,x
        sta crc+1
        lda crclo,x
        sta crc
        iny
        cpy #$82
        bne @crc_loop
        rts

        .segment "BSS"
recv_buffer: 
        .res RECEIVE_BUFFER_SIZE

        .segment "RODATA"
prompt:
        .byte "Begin XMODEM/CRC transfer.  Press <Esc> to abort...", CR, LF, $00

error_message:     
        .byte "Transfer Error!", CR, LF, $00

abort_message:
        .byte "Transfer Aborted!", CR, LF, $00

success_message:    
        .byte EOT, CR, LF
        .byte "Transfer Successful!", CR, LF, $00

; The following tables are used to calculate the CRC for the 128 bytes
; in the xmodem data blocks.  You can use these tables if you plan to
; store this program in ROM.  If you choose to build them at run-time,
; then just delete them and define the two labels: crclo & crchi.
        .segment "RODATA_PA" ; Page Aligned Read Only DATA
        .align 256
; low byte CRC lookup table (should be page aligned)
crclo:  .byte $00,$21,$42,$63,$84,$A5,$C6,$E7,$08,$29,$4A,$6B,$8C,$AD,$CE,$EF
        .byte $31,$10,$73,$52,$B5,$94,$F7,$D6,$39,$18,$7B,$5A,$BD,$9C,$FF,$DE
        .byte $62,$43,$20,$01,$E6,$C7,$A4,$85,$6A,$4B,$28,$09,$EE,$CF,$AC,$8D
        .byte $53,$72,$11,$30,$D7,$F6,$95,$B4,$5B,$7A,$19,$38,$DF,$FE,$9D,$BC
        .byte $C4,$E5,$86,$A7,$40,$61,$02,$23,$CC,$ED,$8E,$AF,$48,$69,$0A,$2B
        .byte $F5,$D4,$B7,$96,$71,$50,$33,$12,$FD,$DC,$BF,$9E,$79,$58,$3B,$1A
        .byte $A6,$87,$E4,$C5,$22,$03,$60,$41,$AE,$8F,$EC,$CD,$2A,$0B,$68,$49
        .byte $97,$B6,$D5,$F4,$13,$32,$51,$70,$9F,$BE,$DD,$FC,$1B,$3A,$59,$78
        .byte $88,$A9,$CA,$EB,$0C,$2D,$4E,$6F,$80,$A1,$C2,$E3,$04,$25,$46,$67
        .byte $B9,$98,$FB,$DA,$3D,$1C,$7F,$5E,$B1,$90,$F3,$D2,$35,$14,$77,$56
        .byte $EA,$CB,$A8,$89,$6E,$4F,$2C,$0D,$E2,$C3,$A0,$81,$66,$47,$24,$05
        .byte $DB,$FA,$99,$B8,$5F,$7E,$1D,$3C,$D3,$F2,$91,$B0,$57,$76,$15,$34
        .byte $4C,$6D,$0E,$2F,$C8,$E9,$8A,$AB,$44,$65,$06,$27,$C0,$E1,$82,$A3
        .byte $7D,$5C,$3F,$1E,$F9,$D8,$BB,$9A,$75,$54,$37,$16,$F1,$D0,$B3,$92
        .byte $2E,$0F,$6C,$4D,$AA,$8B,$E8,$C9,$26,$07,$64,$45,$A2,$83,$E0,$C1
        .byte $1F,$3E,$5D,$7C,$9B,$BA,$D9,$F8,$17,$36,$55,$74,$93,$B2,$D1,$F0

        .align 256
; hi byte CRC lookup table (should be page aligned)
crchi:  .byte $00,$10,$20,$30,$40,$50,$60,$70,$81,$91,$A1,$B1,$C1,$D1,$E1,$F1
        .byte $12,$02,$32,$22,$52,$42,$72,$62,$93,$83,$B3,$A3,$D3,$C3,$F3,$E3
        .byte $24,$34,$04,$14,$64,$74,$44,$54,$A5,$B5,$85,$95,$E5,$F5,$C5,$D5
        .byte $36,$26,$16,$06,$76,$66,$56,$46,$B7,$A7,$97,$87,$F7,$E7,$D7,$C7
        .byte $48,$58,$68,$78,$08,$18,$28,$38,$C9,$D9,$E9,$F9,$89,$99,$A9,$B9
        .byte $5A,$4A,$7A,$6A,$1A,$0A,$3A,$2A,$DB,$CB,$FB,$EB,$9B,$8B,$BB,$AB
        .byte $6C,$7C,$4C,$5C,$2C,$3C,$0C,$1C,$ED,$FD,$CD,$DD,$AD,$BD,$8D,$9D
        .byte $7E,$6E,$5E,$4E,$3E,$2E,$1E,$0E,$FF,$EF,$DF,$CF,$BF,$AF,$9F,$8F
        .byte $91,$81,$B1,$A1,$D1,$C1,$F1,$E1,$10,$00,$30,$20,$50,$40,$70,$60
        .byte $83,$93,$A3,$B3,$C3,$D3,$E3,$F3,$02,$12,$22,$32,$42,$52,$62,$72
        .byte $B5,$A5,$95,$85,$F5,$E5,$D5,$C5,$34,$24,$14,$04,$74,$64,$54,$44
        .byte $A7,$B7,$87,$97,$E7,$F7,$C7,$D7,$26,$36,$06,$16,$66,$76,$46,$56
        .byte $D9,$C9,$F9,$E9,$99,$89,$B9,$A9,$58,$48,$78,$68,$18,$08,$38,$28
        .byte $CB,$DB,$EB,$FB,$8B,$9B,$AB,$BB,$4A,$5A,$6A,$7A,$0A,$1A,$2A,$3A
        .byte $FD,$ED,$DD,$CD,$BD,$AD,$9D,$8D,$7C,$6C,$5C,$4C,$3C,$2C,$1C,$0C
        .byte $EF,$FF,$CF,$DF,$AF,$BF,$8F,$9F,$6E,$7E,$4E,$5E,$2E,$3E,$0E,$1E
