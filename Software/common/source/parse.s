        .setcpu "65C02"
        .include "string.inc"
        .include "utils.inc"
        .include "macros.inc"

        .export _parse_onoff
        .export parse_onoff
        .export _parse_hex_byte
        .export parse_hex_byte
        .export _parse_hex_word
        .export parse_hex_word
        .export _parse_dec_word
        .export parse_dec_word

PARSE_SUCCESS = $01
PARSE_FAILED  = $00

; C wrapper for parse_onoff function
; return status in A
; buffer for result in A/X
; data to parse on stack
_parse_onoff:
        sta return_buffer_pointer
        stx return_buffer_pointer+1
        ldy #$01
        lda (sp),y
        tax
        lda (sp)
        jsr parse_onoff
        ldx #$00
        bcc @error
        copy_ptr return_buffer_pointer, ptr1
        sta (ptr1)
        lda #(PARSE_SUCCESS)
        inc_ptr sp, #$02
        rts
@error:
        lda #(PARSE_FAILED)
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - ptr1, returning value in carry
; Function assumes token pointer in ptr1
; Returns status in carry flag (set - parsed successfully)
; Returns value in A (0 - off, 1 - on)
parse_onoff:
        ; Copy pointer to preserve during strcompare operation
        sta parsed_token_pointer
        stx parsed_token_pointer+1
        ; Convert whole token uppercase for comparison
        strtoupper parsed_token_pointer
        ; Compare against "ON"
        strcompare #token_on, parsed_token_pointer
        cmp #$00
        bne @not_on
        ; Equal
        sec
        lda #$01
        rts
@not_on:
        ; Compare against "OFF"
        strcompare #token_off, parsed_token_pointer
        cmp #$00
        bne @error
        sec
        lda #$00
        rts
@error:
        clc
        rts

; C wrapper for parse_hex_byte function
; return status in A
; buffer for result in A/X
; data to parse on stack
_parse_hex_byte:
        sta return_buffer_pointer
        stx return_buffer_pointer+1
        ldy #$01
        lda (sp),y
        tax
        lda (sp)
        jsr parse_hex_byte
        ldx #$00
        bcc @error
        copy_ptr return_buffer_pointer, ptr1
        sta (ptr1)
        lda #(PARSE_SUCCESS)
        inc_ptr sp, #$02
        rts
@error:
        lda #(PARSE_FAILED)
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - input in ptr1, return value in carry
; Function assumes token pointer in ptr1
; Returns status in carry flag (set - parsed successfully)
; Returns value in A
; Stores temp value in tmp1 (but preserves it)
parse_hex_byte:
        sta parsed_token_pointer
        stx parsed_token_pointer+1
        ; preserve Y
        phy
        ; preserve tmp1
        lda tmp1
        pha
        ; ; Copy pointer to preserve during strtoupper operation
        ; copy_ptr ptr1, parsed_token_pointer
        ; Check length (expect two chars only)
        strlength parsed_token_pointer
        cmp #$02
        bne @error
        ; Convert whole token uppercase for comparison
        strtoupper parsed_token_pointer
        ; Copy pointer back to dereference
        copy_ptr parsed_token_pointer, ptr1
        ; get first char
        ldy #$00
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        asl
        asl
        asl
        asl
        sta tmp1
        iny
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        clc
        adc tmp1
        sec
        bra @return
@error:
        clc
@return:
        ply
        sty tmp1
        ply
        rts

; C wrapper for parse_hex_word function
; return status in A
; buffer for result in A/X
; data to parse on stack
_parse_hex_word:
        sta return_buffer_pointer
        stx return_buffer_pointer+1
        ldy #$01
        lda (sp),y
        tax
        dey
        lda (sp),y
        jsr parse_hex_word
        bcc @error
        copy_ptr return_buffer_pointer, ptr1
        ldy #$01
        sta (ptr1),y
        txa
        sta (ptr1)
        lda #(PARSE_SUCCESS)
        ldx #$00
        inc_ptr sp, #$02
        rts
@error:
        lda #(PARSE_FAILED)
        ldx #$00
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - input in ptr1, return value in carry
; Function assumes token pointer in ptr1
; Returns status in carry flag (set - parsed successfully)
; Returns value in MSB: A, LSB: X
; Stores temp value in tmp1 and tmp2 (but preserves them)
parse_hex_word:
        sta parsed_token_pointer
        stx parsed_token_pointer+1
        ; preserve Y
        phy
        ; preserve tmp1
        lda tmp1
        pha
        lda tmp2
        pha
        stz tmp1
        ; ; Copy pointer to preserve during strtoupper operation
        ; copy_ptr ptr1, parsed_token_pointer
        ; Convert whole token uppercase for comparison
        strtoupper parsed_token_pointer
        ; Copy pointer back to dereference
        copy_ptr parsed_token_pointer, ptr1
        ; Set index pointer
        ldy #$00
        ; Check length
        strlength parsed_token_pointer
        cmp #$02
        beq @zeropage
        cmp #$04
        bne @error
        ; get first char
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        asl
        asl
        asl
        asl
        sta tmp1
        iny
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        clc
        adc tmp1
        sta tmp1
        iny
@zeropage:
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        asl
        asl
        asl
        asl
        sta tmp2
        iny
        lda (ptr1),y
        jsr parse_hex_char
        bcc @error
        clc
        adc tmp2
        sta tmp2
        sec
        ldx tmp2
        lda tmp1
        bra @return
@error:
        clc
@return:
        ply
        sty tmp2
        ply
        sty tmp1
        ply
        rts

; INTERNAL
; Assumes char in A
; returns status in carry (set - OK)
; returns value in A
parse_hex_char:
        cmp #('0')
        bmi @error 
        cmp #('9'+1)
        bmi @digit
        cmp #('A')
        bmi @error
        cmp #('F'+1)
        bmi @char
        bra @error
@digit:
        sec
        sbc #('0')
        sec
        rts
@char:
        sec
        sbc #('A'-$0a)
        sec
        rts
@error:
        clc
        rts

; C wrapper for parse_dec_word function
; return status in A
; buffer for result in A/X
; data to parse on stack
_parse_dec_word:
        sta return_buffer_pointer
        stx return_buffer_pointer+1
        ldy #$01
        lda (sp),y
        tax
        dey
        lda (sp),y
        jsr parse_dec_word
        bcc @error
        copy_ptr return_buffer_pointer, ptr1
        ldy #$01
        sta (ptr1),y
        txa
        sta (ptr1)
        lda #(PARSE_SUCCESS)
        ldx #$00
        inc_ptr sp, #$02
        rts
@error:
        lda #(PARSE_FAILED)
        ldx #$00
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - status in carry
; Return in A/X (MSB/LSB)
parse_dec_word:
        sta parsed_token_pointer
        stx parsed_token_pointer+1
        ; preserve Y
        phy

        ; check input length
        strlength parsed_token_pointer
        cmp #$06
        bmi @not_too_long
        jmp @error
@not_too_long:
        stz return_value
        stz return_value+1
        ldy #$00
        copy_ptr parsed_token_pointer, ptr1
@convert_loop:
        lda (ptr1),y
        beq @done
        jsr parse_dec_char
        bcc @error
        ; multiply result by 10
        jsr multiply_by_10
        bcc @error
        clc
        adc return_value
        sta return_value
        lda return_value+1
        adc #$00
        sta return_value+1
        bcs @error
        iny
        bra @convert_loop
@error:
        ply
        clc
        rts
@done:
        ply
        lda return_value+1
        ldx return_value
        sec
        rts


; INTERNAL
; Assumes char in A
; returns status in carry (set - OK)
; returns value in A
parse_dec_char:
        cmp #('0')
        bmi @error 
        cmp #('9'+1)
        bpl @error
        sec
        sbc #('0')
        sec
        rts
@error:
        clc
        rts

; INTERNAL
; Multiplies return_value by 10
multiply_by_10:
        pha
        lda return_value
        sta temp_value
        lda return_value+1
        sta temp_value+1
        ; mul by 8
        asl return_value
        rol return_value+1
        ; report error on overflow
        bcs @error
        asl return_value
        rol return_value+1
        ; report error on overflow
        bcs @error
        asl return_value
        rol return_value+1
        ; report error on overflow
        bcs @error
        ; mul by 2
        asl temp_value
        rol temp_value+1
        bcs @error
        clc
        lda return_value
        adc temp_value
        sta return_value
        lda return_value+1
        adc temp_value+1
        sta return_value+1
        bcs @error
        sec
        bra @exit
@error:
        clc
@exit:
        pla
        rts

        .segment "BSS"
parsed_token_pointer:
        .res 2
return_buffer_pointer:
        .res 2
return_value:
        .res 2
temp_value:
        .res 2
        .segment "RODATA"
token_on:
        .asciiz "ON"
token_off:
        .asciiz "OFF"
