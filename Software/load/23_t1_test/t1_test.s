        .include "via.inc"

        .code
init:
        lda #(VIA_ACR_T1_CONT_SQUARE_PB7)
        sta VIA2_ACR
        lda #$ff
        sta VIA2_T1CL
        sta VIA2_T1CH

loop:
        nop
        jmp loop
