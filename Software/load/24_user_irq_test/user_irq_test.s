        .include "via_const.inc"
        .include "via_utils.inc"
        .include "core.inc"
        .include "blink.inc"
        .include "utils.inc"

        .code
init:
        stz irq_counter

        register_user_irq #service_irq

        via2_set_register VIA_REGISTER_ACR, #(VIA_ACR_T1_CONT_NO_PB7 | VIA_ACR_T2_TIMED | VIA_ACR_SR_DISABLED | VIA_ACR_PB_LATCH_DISABLE | VIA_ACR_PA_LATCH_DISABLE) 
        via2_set_register VIA_REGISTER_IER, #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG)
        via2_set_register VIA_REGISTER_T1CL, #250
        via2_set_register VIA_REGISTER_T1CH, #200 

        lda #5
        jsr _delay_sec
        ; disable interrupt
        via2_set_register VIA_REGISTER_IER, #(VIA_IER_CLEAR_FLAGS | VIA_IER_TIMER1_FLAG)
        rts

service_irq:
        ; No need to save registers, it's done automatically
        ; phx
        ; pha
        via2_get_register VIA_REGISTER_IFR
        bpl @exit
        via2_get_register VIA_REGISTER_T1CL
        inc irq_counter
        bne @exit
        jsr _strobe_led
@exit:
        ; pla
        ; plx
        rts

        .segment "BSS"
irq_counter:
        .res 1