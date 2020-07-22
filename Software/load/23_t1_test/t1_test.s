        .include "via_const.inc"
        .include "via_utils.inc"

        .code
init:
        via2_set_register VIA_REGISTER_ACR, #(VIA_ACR_T1_CONT_SQUARE_PB7)
        via2_set_register VIA_REGISTER_T1CL, #$ff
        via2_set_register VIA_REGISTER_T1CH, #$ff 

loop:
        nop
        jmp loop
