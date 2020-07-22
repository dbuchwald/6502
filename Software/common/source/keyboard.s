      .include "via.inc"
      .include "via_const.inc"
      .include "zeropage.inc"
      .include "sys_const.inc"
      .include "sysram_map.inc"

      .include "utils.inc"
      .export _keyboard_init
      .export _handle_keyboard_irq
      .export _keyboard_is_connected
      .export _keyboard_is_data_available
      .export _keyboard_read_char

KEYBOARD_NOT_CONNECTED     = $00
KEYBOARD_CONNECTED         = $01

KEYBOARD_NO_DATA_AVAILABLE = $00
KEYBOARD_DATA_AVAILABLE    = $01

      .code

; POSITIVE C COMPLIANT
; No parameters taken
; No registers changed
; No output values
_keyboard_init:
      pha
      ; Check if keyboard status makes sense (would suggest soft reboot)
      lda keyboard_conn
      cmp #$00
      beq @probably_reset
      cmp #$80
      beq @probably_reset
      ; Assume keyboard is disconnected otherwise
      lda #$00
      sta keyboard_conn
@probably_reset:
      ; Reset buffer pointers
      stz keyboard_rptr
      stz keyboard_wptr
      ; VIA1 PORTA is all input
      stz VIA1_DDRA
      ; Init PORTA
      stz VIA1_PORTA
      ; Setup read handshake on VIA2 CA1/CA2
      ; Clear CA1/CA2 flags first
      lda VIA1_PCR
      and #$0f
      ; Enable read handshake
      ora #(VIA_PCR_CA1_INTERRUPT_NEGATIVE | VIA_PCR_CA2_OUTPUT_PULSE | VIA_PCR_CB1_INTERRUPT_NEGATIVE | VIA_PCR_CB2_OUTPUT_HIGH)
      sta VIA1_PCR
      ; Enable interrupt from VIA2 on CA1 (Data ready)
      lda #(VIA_IER_SET_FLAGS | VIA_IER_CA1_FLAG)
      sta VIA1_IER
      ; Restore state of A register
      pla
      rts

; TENTATIVE C COMPLIANT
; Writes data to keyboard buffer and updates pointers
; All registers preserved
_handle_keyboard_irq:
      pha
      ; Read code from keyboard controller
      lda VIA1_PORTA
      ; Handle connection signal
      cmp #$ff
      beq @keyboard_connected
      ; Handle disconnection signal
      cmp #$fe
      beq @keyboard_disconnected
      ; Handle system break signal
      cmp #$18
      beq @system_break_request
      ; Handle regular scancode
      ; Preserve X register
      phx
      ; Load current pointer
      ldx keyboard_wptr
      ; Store character
      sta keyboard_buffer,x
      ; Increase pointer
      inx
      ; Check if overflow
      cpx #(KEYBOARD_BUFFER_SIZE)
      bne @store_new_pointer
      ; Move to beginning then
      ldx #$00
      ; Update pointer value
@store_new_pointer:
      stx keyboard_wptr
      ; Restore X register
      plx
      ; Handling completed
      bra @handling_done
      ; Store keyboard flag
@keyboard_connected:
      lda #$80
      sta keyboard_conn
      ; Handling completed
      bra @handling_done
      ; Store keyboard flag
@keyboard_disconnected:
      stz keyboard_conn
      bra @handling_done
@system_break_request:
      lda #$80
      sta system_break_flag
@handling_done:
      ; Restore A register
      pla
      ; Done, return
      rts

; POSITIVE C COMPLIANT - return value in A
; Returns connection status in A
; 1 - connected
; 0 - disconnected
_keyboard_is_connected:
      bit keyboard_conn
      bmi @keyboard_connected
      lda #(KEYBOARD_NOT_CONNECTED)
      rts
@keyboard_connected:
      lda #(KEYBOARD_CONNECTED)
      rts

; POSITIVE C COMPLIANT - return value in A
; Returns status in A
; 1 - new characters available
; 0 - no new characters available
_keyboard_is_data_available:
      lda keyboard_wptr
      cmp keyboard_rptr
      beq @no_data
      lda #(KEYBOARD_DATA_AVAILABLE)
      rts
@no_data:
      lda #(KEYBOARD_NO_DATA_AVAILABLE)
      rts

; POSITIVE C COMPLIANT
; Returns single scancode in A register
; No other registers affected
_keyboard_read_char:
      ; Preserve X register
      phx
      ; Compare pointers
      ldx keyboard_rptr
      cpx keyboard_wptr
      bne @read_data
      ; No data
      lda #$00
      plx
      rts
@read_data:
      lda keyboard_buffer,x
      inx
      ; Check if overflow
      cpx #(KEYBOARD_BUFFER_SIZE)
      bne @store_new_pointer
      ; Move to beginning then
      ldx #$00
      ; Update pointer value
@store_new_pointer:
      stx keyboard_rptr
      ; Restore X register
      plx
      ; Handling completed
      rts

