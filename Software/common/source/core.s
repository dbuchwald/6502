        .include "via.inc"
        .include "zeropage.inc"
        .include "utils.inc"
        .include "lcd.inc"
        .include "acia.inc"
        .include "blink.inc"
        .include "keyboard.inc"

        .import __USERRAM_START__
        .import __USERRAM_SIZE__

        .export _system_init
        .export _interrupt_handler
        .export _register_system_break
        .export _register_user_break
        .export _deregister_user_break
        .export _register_user_irq
        .export _deregister_user_irq

        .code

; POSITIVE C COMPLIANT
; Main system initialization routine
; LCD initialization
; ACIA initialization
; Disable BCD mode
; Enable interrupt handling
_system_init:
        ; Clear system break flag
        stz system_break_flag
        ; Set system break address to init vector
        lda $fffc
        sta system_break_address
        lda $fffd
        sta system_break_address+1
        lda #$ff
        sta system_break_sp
        ; Set user break to null
        stz user_break_address
        stz user_break_address+1
        stz user_break_sp
        ; user IRQ to null
        stz user_irq_address
        stz user_irq_address+1
        ; Initialize BLINK LED
        jsr _blink_init
        ; Short BLINK LED strobe
        jsr _strobe_led
        ; Enable BLINK LED during init operation
        lda #(BLINK_LED_ON)
        jsr _blink_led
        ; Initialize C stack for loadable modules
        lda #<(__USERRAM_START__ + __USERRAM_SIZE__)
        sta sp
        lda #>(__USERRAM_START__ + __USERRAM_SIZE__)
        sta sp+1
        ; Initialize LCD
        jsr _lcd_init
        ; Initialize ACIA
        jsr _acia_init
        ; Initialize keyboard
        jsr _keyboard_init
        ; Disable BCD mode
        cld
        ; Enable interrupt processing
        cli
        ; Turn off BLINK LED, init done
        lda #(BLINK_LED_OFF)
        jsr _blink_led
        ; Done, return from subroutine
        rts

; TENTATIVE C COMPLIANT
; Main interrupt handling routine
; Uses ACIA and keyboard handling routines
_interrupt_handler:
        ; Test ACIA first
        bit ACIA_STATUS
        bpl check_via1
        jsr _handle_acia_irq
check_via1:
        bit VIA1_IFR
        bpl check_via2
        pha
        lda VIA1_IFR
        and VIA1_IER
        and #%00000010 ; IFR_CA1
        beq not_keyboard
        jsr _handle_keyboard_irq
not_keyboard:
        pla
check_via2:
        ; bit VIA2_IFR
        ; TODO: Missing VIA2 IRQ handler
        ; Check if user IRQ handler is defined
test_user_irq:
        ; It's definitely not on zeropage, so
        ; use MSB as indicator whether it's
        ; defined or not
        pha
        lda user_irq_address+1
        beq no_user_handler
        ; prevent register overwrite in user routine
        ; will actually happen with C code!
        pha
        phx
        phy
        jsr service_user_irq
        ply
        plx
        pla
no_user_handler:
        ; Test for system break flag
        lda system_break_flag
        bne system_break_request
        pla
        rti
system_break_request:
        ; Check if user break is defined
        ; Checking MSB only as it's not on ZP
        lda user_break_address+1
        bne @user_break
        bra @system_break
@user_break:
        ; Replace return pointer with our own
        ldx user_break_sp
        txs
        lda user_break_address+1
        pha
        lda user_break_address
        pha
        bra @exit_handler
@system_break:
        ; Replace return pointer with our own
        ldx system_break_sp
        txs
        lda system_break_address+1
        pha
        lda system_break_address
        pha
@exit_handler:
        ; Clear interrupt flag upon return
        cli
        php
        ; Clear flag
        stz system_break_flag
        rti

; POSITIVE C COMPLIANT
_register_system_break:
        ; Save address provided in parameters
        sta system_break_address
        stx system_break_address+1
        ; Get current stack pointer
        tsx
        ; Remove last address - it's our own
        inx
        inx
        ; Save for break operation
        stx system_break_sp
        rts

; POSITIVE C COMPLIANT
_register_user_break:
        ; Save address provided in parameters
        sta user_break_address
        stx user_break_address+1
        ; Get current stack pointer
        tsx
        ; Remove last address - it's our own
        inx
        inx
        ; Save for break operation
        stx user_break_sp
        rts

; POSITIVE C COMPLIANT
_deregister_user_break:
        stz user_break_address
        stz user_break_address+1
        stz user_break_sp
        rts

; POSITIVE C COMPLIANT
_register_user_irq:
        ; disable IRQ processing for a sec
        ; to ensure this update is atomic
        sei
        sta user_irq_address
        stx user_irq_address+1
        ; reenable IRQ processing
        cli
        rts

; POSITIVE C COMPLIANT
_deregister_user_irq:
        ; disable IRQ processing
        sei
        stz user_irq_address+1
        stz user_irq_address
        ; reenable
        cli
        rts

; INTERNAL
service_user_irq:
        jmp (user_irq_address)