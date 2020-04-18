        .include "zeropage.inc"
        .include "utils.inc"
        .include "macros.inc"

        .export _strcopy
        .export strcopy
        .export _strlength
        .export _strcompare
        .export strcompare
        .export _strtoupper
        .export _strtolower
        .export _strtriml
        .export _strtrimr
        .export _strtokenize
        .export strtokenize
        .export _strgettoken

SPACE = $20

        .code
; C Wrapper for strcopy function
; A/X contain target string address
; sp points to source string
; pointers are copied to ptr1/ptr2
_strcopy:
        sta ptr2
        stx ptr2+1
        ldy #$01
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1
        jsr strcopy
        inc_ptr sp, #$02
        rts

        .code
; NEGATIVE C COMPLIANT - ptr1, ptr2
; Copy str1 to str2
strcopy:
        phy
        ldy #$00
@strcopy_loop:
        lda (ptr1),y
        sta (ptr2),y
        beq @return
        iny
        beq @return ; prevention against infinite loop
        bra @strcopy_loop
@return:
        ply
        rts

; C Wrapper for strcompare function
; A/X contain string2 address
; sp points to string1
; pointers are copied to ptr1/ptr2
; return value in A
_strcompare:
        sta ptr2
        stx ptr2+1
        ldy #$01
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1
        jsr strcompare
        ldx #$00
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - ptr1, ptr2
; Compare two strings (ptr1, ptr2)
; A will contain comparison result
; -1 -> ptr1 < ptr2
; 0  -> ptr1 = ptr2
; +1 -> ptr1 > ptr2
strcompare:
        phy
        ldy #$00
@strcompare_loop:
        lda (ptr1),y
        beq @ptr1_end
        cmp (ptr2),y
        bne @set_result
        iny
        beq @equal ; prevention against infinite loop
        bra @strcompare_loop
@ptr1_end:
        cmp (ptr2),y
@set_result:
        beq @equal
        bmi @less_than
        lda #$01
        bra @return
@equal:
        lda #$00
        bra @return
@less_than:
        lda #$ff
        bra @return
@return:
        ply
        rts

; POSITIVE C COMPLIANT
; Count characters in string (ptr1)
; A will contain result
_strlength:
        sta ptr1
        stx ptr1+1
        phy
        ldy #$00
@strlength_loop:
        lda (ptr1),y
        beq @return
        iny
        beq @very_long ; prevention against infinite loop
        bra @strlength_loop
@very_long:
        dey
@return:
        tya
        ply
        rts

; POSITIVE C COMPLIANT
; Converts string to upper case in place
_strtoupper:
        sta ptr1
        stx ptr1+1
        phy
        ldy #$00
@strtoupper_loop:
        lda (ptr1),y
        beq @return
        cmp #('a')
        bmi @nextchar
        cmp #('z'+1)
        bpl @nextchar
        sec
        sbc #('a'-'A')
        sta (ptr1),y
@nextchar:
        iny
        beq @return ; prevention against infinite loop
        bra @strtoupper_loop
@return:
        ply
        rts

; POSTITIVE C COMPLIANT
; Converts string to lower case in place
_strtolower:
        sta ptr1
        stx ptr1+1
        phy
        ldy #$00
@strtolower_loop:
        lda (ptr1),y
        beq @return
        cmp #('A')
        bmi @nextchar
        cmp #('Z'+1)
        bpl @nextchar
        clc
        adc #('a'-'A')
        sta (ptr1),y
@nextchar:
        iny
        beq @return ; prevention against infinite loop
        bra @strtolower_loop
@return:
        ply
        rts

; POSITIVE C COMPLIANT
; Trim all leading and trailing space characters
; ptr1 - points at the beginning of null terminated string
; ptr2 - used to copy data
_strtriml:
        sta ptr1
        stx ptr1+1
        phy
        ; Copy ptr1 to ptr2
        lda ptr1
        sta ptr2
        lda ptr1+1
        sta ptr2+1
        ldy #$00
@skip_loop:
        ; keep moving ptr2 until first non-white char found
        lda (ptr2),y
        cmp #(SPACE)
        bne @copy_loop
        inc ptr2
        bne @skip_loop
        inc ptr2+1
        bra @skip_loop
@copy_loop:
        lda (ptr2),y
        sta (ptr1),y
        beq @return
        iny
        beq @return ; prevention against infinite loop
        bra @copy_loop
@return:
        ply
        rts

; POSITIVE C COMPLIANT
; Trims all the trailing space characters
; ptr1 points to null terminated string to be trimmed
_strtrimr:
        sta ptr1
        stx ptr1+1
        phy
        ldy #$00
@skip_loop:
        ; keep moving until the end of string is found
        lda (ptr1),y
        beq @trimr_loop
        iny
        beq @return ; prevention against infinite loop
        bra @skip_loop

@trimr_loop:
        dey
        lda (ptr1),y
        cmp #(SPACE)
        bne @return
        lda #$00
        sta (ptr1),y
        bra @trimr_loop
@return:
        ply
        rts

; C Wrapper for strtokenize function
; A/X contain token buffer address
; sp points to string
; pointers are copied to ptr1/ptr2
; return value in A
_strtokenize:
        sta ptr2
        stx ptr2+1
        ldy #$01
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1
        jsr strtokenize
        ldx #$00
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - ptr1, ptr2
; Temp variables used:
;  ptr1 - source string address (input)
;  ptr2 - target buffer address (input)
;  tmp1 - size of target buffer (input)
;  tmp2 - count of tokens (internal)
;  tmp3 - count of chars in output buffer (internal)
strtokenize:
        phx
        stz tmp2

        lda (ptr1)
        jsr get_char_type
@tokenize_loop:
        cpx #(CHAR_END)
        beq @strtokenize_exit
        cpx #(CHAR_WHITESPACE)
        beq @skip_whitespace
        cpx #(CHAR_STRING)
        beq @process_string
        cpx #(CHAR_SINGLE)
        beq @process_single
        ; Should never happen
        bra @strtokenize_exit
@skip_whitespace:
        inc_ptr ptr1
        lda (ptr1)
        jsr get_char_type
        cpx #(CHAR_WHITESPACE)
        beq @skip_whitespace
        bra @tokenize_loop
@process_string:
        jsr copy_char_to_token_buffer
        lda (ptr1)
        jsr get_char_type
        cpx #(CHAR_STRING)
        beq @process_string
        jsr end_token
        bra @tokenize_loop
@process_single:
        jsr copy_char_to_token_buffer
        jsr end_token
        lda (ptr1)
        jsr get_char_type
        bra @tokenize_loop
@strtokenize_exit:
        plx
        lda tmp2
        rts

CHAR_END        = $00
CHAR_WHITESPACE = $01
CHAR_STRING     = $02
CHAR_SINGLE     = $03

; INTERNAL
; Assumes input character in A
; returns char type in X 
;$0b,$0a,$0d,$20,$00
get_char_type:
        cmp #$00 ; NULL
        beq @return_end
        cmp #$09 ; tab
        beq @return_whitespace
        cmp #$0a ; LF
        beq @return_whitespace
        cmp #$0d ; CR
        beq @return_whitespace
        cmp #$20 ; space
        beq @return_whitespace
        cmp #('_')
        beq @return_string
        cmp #('0')
        bmi @return_single
        cmp #('9'+1)
        bmi @return_string
        cmp #('A')
        bmi @return_single
        cmp #('Z'+1)
        bmi @return_string
        cmp #('a')
        bmi @return_single
        cmp #('z'+1)
        bmi @return_string
        bra @return_single
@return_end:
        ldx #(CHAR_END)
        rts
@return_whitespace:
        ldx #(CHAR_WHITESPACE)
        rts
@return_string:
        ldx #(CHAR_STRING)
        rts
@return_single:
        ldx #(CHAR_SINGLE)
        rts

; INTERNAL
; Assumes ptr1 points to source
; and ptr2 points to target in buffer
copy_char_to_token_buffer:
        lda (ptr1)
        sta (ptr2)
        inc_ptr ptr1
        inc_ptr ptr2
        rts

; INTERNAL
; Assumes ptr2 points to next char in target buffer
end_token:
        lda #$00
        sta (ptr2)
        inc_ptr ptr2
        inc tmp2
        rts

; C function to retrieve token
; wrapper for ASM macro
; token number in A
; token buffer on stack
; return pointer in A/X
_strgettoken:
        sta tmp1
        phy
        ldy #$01
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1

@token_loop:
        lda tmp1
        beq @exit
@char_loop:
        inc_ptr ptr1
        lda (ptr1)
        bne @char_loop
        inc_ptr ptr1
        dec tmp1
        bra @token_loop
@exit:
        inc_ptr sp, #$02
        ply
        lda ptr1
        ldx ptr1+1
        rts