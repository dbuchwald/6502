        .include "zeropage.inc"

        .export _strlen
        .export _strcmp

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
