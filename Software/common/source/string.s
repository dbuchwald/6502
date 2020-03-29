        .include "zeropage.inc"

        .export _strlen
        .export _strcmp
        .export _strtoupper
        .export _strtolower
        .export _strtriml
        .export _strtrimr

SPACE = $20

        .code
; Compare two strings (ptr1, ptr2)
; A will contain comparison result
; -1 -> ptr1 < ptr2
; 0  -> ptr1 = ptr2
; +1 -> ptr1 > ptr2
_strcmp:
        phy
        ldy #$00
@strcmp_loop:
        lda (ptr1),y
        beq @ptr1_end
        cmp (ptr2),y
        bne @set_result
        iny
        beq @equal ; prevention against infinite loop
        bra @strcmp_loop
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

; Count characters in string (ptr1)
; A will contain result
_strlen:
        phy
        ldy #$00
@strlen_loop:
        lda (ptr1),y
        beq @return
        iny
        beq @very_long ; prevention against infinite loop
        bra @strlen_loop
@very_long:
        dey
@return:
        tya
        ply
        rts

; Converts string to upper case in place
_strtoupper:
        phy
        pha
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
        pla
        ply
        rts

; Converts string to lower case in place
_strtolower:
        phy
        pha
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
        pla
        ply
        rts

; Trim all leading and trailing space characters
; ptr1 - points at the beginning of null terminated string
; ptr2 - used to copy data
_strtriml:
        phy
        pha
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
        pla
        ply
        rts

; Trims all the trailing space characters
; ptr1 points to null terminated string to be trimmed
_strtrimr:
        phy
        pha
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
        pla
        ply
        rts
