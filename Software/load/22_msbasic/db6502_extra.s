      .include "acia.inc"

.segment "CODE"
ISCNTC:
          jmp MONISCNTC
;!!! *used*to* run into "STOP"

init:
      stz EXITFLAG

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

  jsr _acia_is_data_available
  ; skip, no data available at this point
  cmp #(ACIA_NO_DATA_AVAILABLE)
  beq NoDataIn
  jsr _acia_read_byte
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
	.byte	"Cold [C] or warm [W] start?",$0D,$0A,$00

LOAD:
	RTS
	
SAVE:
	RTS

.segment "STARTUP"
  jmp init

.segment "SYSRAM"
TXTBUFFER:
  .res 64