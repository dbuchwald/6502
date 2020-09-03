; htasc - set the hi bit on the last byte of a string for termination
; (by Tom Greene)
.macro htasc str
	.repeat	.strlen(str)-1,I
		.byte	.strat(str,I)
	.endrep
	.byte	.strat(str,.strlen(str)-1) | $80
.endmacro

; For every token, a byte gets put into segment "DUMMY".
; This way, we count up with every token. The DUMMY segment
; doesn't get linked into the binary.
.macro init_token_tables
.ifndef DB6502
        .segment "VECTORS"
.else
        .segment "BAS_VEC"
.endif
TOKEN_ADDRESS_TABLE:
.ifndef DB6502
        .segment "KEYWORDS"
.else
        .segment "BAS_KEY"
.endif
TOKEN_NAME_TABLE:
.ifndef DB6502
		.segment "DUMMY"
.else
    .segment "BAS_DUM"
.endif
DUMMY_START:
.endmacro

; optionally define token symbol
; count up token number
.macro define_token token
.ifndef DB6502
        .segment "DUMMY"
.else
        .segment "BAS_DUM"
.endif
		.ifnblank token
			token := <(*-DUMMY_START)+$80
		.endif
		.res 1; count up in any case
.endmacro

; lay down a keyword, optionally define a token symbol
.macro keyword key, token
.ifndef DB6502
		.segment "KEYWORDS"
.else
		.segment "BAS_KEY"
.endif
		htasc	key
		define_token token
.endmacro

; lay down a keyword and an address (RTS style),
; optionally define a token symbol
.macro keyword_rts key, vec, token
.ifndef DB6502
        .segment "VECTORS"
.else
        .segment "BAS_VEC"
.endif
		.word	vec-1
		keyword key, token
.endmacro

; lay down a keyword and an address,
; optionally define a token symbol
.macro keyword_addr key, vec, token
.ifndef DB6502
        .segment "VECTORS"
.else
        .segment "BAS_VEC"
.endif
		.addr	vec
		keyword key, token
.endmacro

.macro count_tokens
.ifndef DB6502
        .segment "DUMMY"
.else
        .segment "BAS_DUM"
.endif
		NUM_TOKENS := <(*-DUMMY_START)
.endmacro

.macro init_error_table
.ifndef DB6502
        .segment "ERROR"
.else
        .segment "BAS_ERR"
.endif
ERROR_MESSAGES:
.endmacro

.macro define_error error, msg
.ifndef DB6502
        .segment "ERROR"
.else
        .segment "BAS_ERR"
.endif
		error := <(*-ERROR_MESSAGES)
		htasc msg
.endmacro

;---------------------------------------------
; set the MSB of every byte of a string
.macro asc80 str
	.repeat	.strlen(str),I
		.byte	.strat(str,I)+$80
	.endrep
.endmacro

