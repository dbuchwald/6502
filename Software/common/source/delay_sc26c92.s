      .include "zeropage.inc"
      .include "via.inc"
      .include "via_const.inc"

      .import __SERIAL_START__

; SC26C92 registers used to drive Counter
DUART_R_ISR   = __SERIAL_START__ + $05

DUART_R_START = __SERIAL_START__ + $0e
DUART_R_STOP  = __SERIAL_START__ + $0f

DUART_W_CRA   = __SERIAL_START__ + $02
DUART_W_ACR   = __SERIAL_START__ + $04
DUART_W_CTPU  = __SERIAL_START__ + $06
DUART_W_CTPL  = __SERIAL_START__ + $07

      .export _delay_init
      .export _delay_ms
      .export _delay_sec
      .export _get_cpu_mhz
      .export TIMER_DRIVER_STRING

      .code
; POSITIVE C COMPLIANT
_delay_init:
      ; disable powerdown
      lda #$f0
      sta DUART_W_CRA
      ; Select BRG mode 2 and counter X1/16 mode
      lda #%10110000
      sta DUART_W_ACR
      rts

; POSITIVE C COMPLIANT
; number of milliseconds in A register
; uses tmp1 and tmp2 variables on ZP
_delay_ms:
; preserve registers
      pha
      phx
      phy
; prepare counters
      stz tmp1
      stz tmp2
; convert input value to number of sc26c92 cycles
      ldx #$00
@convert_loop:
; check if all the bits calculated already
      cmp #$00
      beq @convert_complete
; shift right to check the least significant bit
      lsr A
      bcs @add_factor
; increase X twice to skip to next multiplier
      inx
      inx
; keep repeating
      bra @convert_loop
@add_factor:
; preserve accumulator
      tay
; clear carry for addition
      clc
; load LSB multiplier
      lda ms_multipliers, X
; add to current value
      adc tmp1
; store for later
      sta tmp1
; MSB now
      inx
      lda ms_multipliers, X
; preserve carry in case of overflow
      adc tmp2
; store
      sta tmp2
; restore accumulator
      tya
; increase X again
      inx
      bra @convert_loop
; conversion complete
@convert_complete:
      lda tmp1
      ldx tmp2
      jsr delay_internal
@return:
      ply
      plx
      pla
      rts

; POSITIVE C COMPLIANT
; number of seconds in A register
_delay_sec:
; store original value in registers A & X
      pha
      phx
; multiply by 4
      asl
      asl
@outer_loop:
; exit if 0 quarter-seconds left
      cmp #$00
      beq @exit_delay_sec
; store current counter
      pha
; sleep for 250 ms
      lda #$00
      ldx #$e1
      jsr delay_internal
; get previous value of A register
      pla
; decrease by one quarter-second
      dec
; repeat outer loop
      bra @outer_loop
@exit_delay_sec:
; restore original value of A & X registers
      plx
      pla
; return
      rts

_get_cpu_mhz:
      phx
; start VIA cycle counter
      lda #(VIA_ACR_T1_SINGLE_NO_PB7 | VIA_ACR_T2_TIMED | VIA_ACR_SR_DISABLED | VIA_ACR_PB_LATCH_DISABLE | VIA_ACR_PA_LATCH_DISABLE)
      sta VIA1_ACR

; count down from max value
      lda #$ff
      sta VIA1_T1CL
      lda #$ff
      sta VIA1_T1CH

; wait for 2.051 ms
      lda #$d8
      ldx #$01
      jsr delay_internal

; get current state (high latch only, ignore the low one)
      sec
      lda #$00
      sbc VIA1_T1CH

; just a precaution - add two before division to eliminate rounding error
      clc
      adc #$02

; MHz count in 5 most significant bits, so divide by 8
      lsr
      lsr
      lsr

; restore X register
      plx
      rts

; INTERNAL
delay_internal:
      sta DUART_W_CTPL
      stx DUART_W_CTPU
      lda DUART_R_START
@wait:
      lda DUART_R_ISR
      and #%00001000
      beq @wait
      lda DUART_R_STOP
      rts


      .segment "RODATA"
ms_multipliers:
      .byte $e6, $00, $cd, $01, $9a, $03, $33, $07,$66, $0e, $cd, $1c, $9a, $39, $33, $73

TIMER_DRIVER_STRING:
      .asciiz "CPU"