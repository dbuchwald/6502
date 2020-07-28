      .include "utils.inc"
      .include "lcd.inc"
      .include "core.inc"
      .include "serial.inc"
      .include "keyboard.inc"
      .include "syscalls.inc"
      .include "sys_const.inc"

CHANNEL = CHANNEL0

.segment "CODE"
; ISCNTC:
;         jmp     MONISCNTC
;         nop
;         nop
;         nop
;         nop
;         lsr     a
;         bcc     RET2
;         jsr     GETLN
;         cmp     #$03
ISCNTC:
          jmp MONISCNTC
;!!! *used*to* run into "STOP"

init:

      ldx #$ff
      txs

      jsr _system_init

      write_lcd #ms_basic

      lda #(TTY_CONFIG_INPUT_SERIAL | TTY_CONFIG_INPUT_KEYBOARD | TTY_CONFIG_OUTPUT_SERIAL)
      jsr _tty_init      

; Display startup message
ShowStartMsg:
      writeln_tty #StartupMessage

; Wait for a cold/warm start selection
WaitForKeypress:
	JSR	MONRDKEY
	BCC	WaitForKeypress
	
	AND	#$DF			; Make upper case
	CMP	#'W'			; compare with [W]arm start
	BEQ	WarmStart

	CMP	#'C'			; compare with [C]old start
	BNE	ShowStartMsg

	JMP	COLD_START	; BASIC cold start

WarmStart:
	JMP	RESTART		; BASIC warm start

MONCOUT:
    jsr _tty_send_character
	RTS

MONRDKEY:
  lda #CHANNEL
  jsr _serial_is_data_available
  ; skip, no data available at this point
  cmp #(SERIAL_NO_DATA_AVAILABLE)
  beq NoDataIn
  lda #CHANNEL
  jsr _serial_read_byte
  sec
  rts
NoDataIn:
  clc
	RTS

MONISCNTC:
	JSR	MONRDKEY
	BCC	NotCTRLC ; If no key pressed then exit
	CMP	#3
	BNE	NotCTRLC ; if CTRL-C not pressed then exit
	SEC		; Carry set if control C pressed
	RTS
NotCTRLC:
	CLC		; Carry clear if control C not pressed
	RTS

StartupMessage:
	.byte	$0C,"Cold [C] or warm [W] start?",$0D,$0A,$00

Backspace:
  .byte $1B,"[D ",$1B,"[D",$00

ms_basic:
  .asciiz "Microsoft BASIC"

LOAD:
	RTS
	
SAVE:
	RTS

.segment "VECTORS"

      .word   $0000
      .word   init
      .word   _interrupt_handler