        .include "via.inc"
        .include "core.inc"
        .include "blink.inc"
        .include "utils.inc"

        .code
init:
        stz irq_counter

        register_user_irq #service_irq

        lda #(VIA_ACR_T1_CONT_NO_PB7 | VIA_ACR_T2_TIMED | VIA_ACR_SR_DISABLED | VIA_ACR_PB_LATCH_DISABLE | VIA_ACR_PA_LATCH_DISABLE) ; T1 continuous, disable PB7
        sta VIA2_ACR
        lda #(VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG) ; Enable T1 interrupt
        sta VIA2_IER
        lda #250                 ; Every 65535 clocks
        sta VIA2_T1CL
        lda #200
        sta VIA2_T1CH            ; Enable timer

        lda #5
        jsr _delay_sec
        ; disable interrupt
        lda #(VIA_IER_CLEAR_FLAGS | VIA_IER_TIMER1_FLAG) ; Enable T1 interrupt
        sta VIA2_IER
        rts

service_irq:
        bit VIA2_IFR
        bpl @exit
        lda VIA2_T1CL
        inc irq_counter
        bne @exit
        jsr _strobe_led
@exit:
        rts

        .segment "BSS"
irq_counter:
        .res 1