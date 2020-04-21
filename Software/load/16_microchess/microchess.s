        .setcpu "65C02"
        .include "zeropage.inc"
        .include "acia.inc"
        .include "utils.inc"
        .include "tty.inc"
        .include "parse.inc"
        .include "string.inc"
        .include "menu.inc"
        .include "macros.inc"

;***********************************************************************
;
;  MicroChess (c) 1996-2002 Peter Jennings, peterj@benlo.com 
;
;***********************************************************************
; I have been given permission to distribute this program by the
; author and copyright holder, Peter Jennings.  Please get his 
; permission if you wish to re-distribute a modified copy of 
; this file to others.  He specifically requested that his 
; copyright notice be included in the source and binary images.
; Thanks! 
;
; modified by Daryl Rictor to work over a serial terminal connection, August 2002.
;
; ported to OS/1 by Dawid Buchwald, Apr 2020
;

; Constants

BUFFER_SIZE = $10

OPENING_MOVE = $1b
BOARD_SIZE   = $20
SP2_TOP_PTR  = $a8

COLUMNS_COUNT = $08
BOARD_END     = $80

NO_MATCH_FOUND = $FF

USER_CMD_RESET   = $01
USER_CMD_REVERSE = $02
USER_CMD_MOVE    = $04
USER_CMD_NOMOVE  = $08
USER_CMD_QUIT    = $10

; page zero variables
;

        .zeropage
BOARD:  .res 16 
BK:     .res 16
PIECE:  .res 1
SQUARE: .res 1 
SP2:    .res 1
SP1:    .res 1
INCHEK: .res 1
STATE:  .res 1
MOVEN:  .res 1 
REV:    .res 1
user_command: .res 1
source_field: .res 1
target_field: .res 1
field_index:  .res 1
OMOVE:  .res 1
WCAP0:  .res 1 
COUNT:  
BCAP2:  .res 1
WCAP2:  .res 1 
BCAP1:  .res 1 
WCAP1:  .res 1 
BCAP0:  .res 1
MOB: 
BMOB:   .res 1 
MAXC:
BMAXC:  .res 1 
CC:
BMCC:   .res 1
PCAP:
BMAXP:  .res 2 
XMAXC:  .res 3
WMOB:   .res 1 
WMAXC:  .res 1 
WCC:    .res 1 
WMAXP:  .res 1
PMOB:   .res 1 
PMAXC:  .res 1 
PCC:    .res 1
PCP:    .res 1 
OLDKY:  .res 8
DIS1: 
BESTP:  .res 1
DIS2:
BESTV:  .res 1 
DIS3:
BESTM:  .res 1
temp:   .res 1

        .code

init_chess:
        lda #$00
        sta REV
        jsr reset_board

main_loop:
        cld
        ldx #(SP2_TOP_PTR)
        stx SP2

; TODO: Use menu instead
        run_menu #chess_menu, #chess_prompt
        rts
;         jsr draw_board
; @read_input_loop:
;         jsr read_user_input

;         lda user_command
;         cmp #(USER_CMD_RESET)
;         beq @reset_board
;         cmp #(USER_CMD_REVERSE)
;         beq @reverse_board
;         cmp #(USER_CMD_MOVE)
;         beq @user_move
;         cmp #(USER_CMD_NOMOVE)
;         beq @user_no_move
;         cmp #(USER_CMD_QUIT)
;         beq @user_quit
;         jmp @read_input_loop
; @reset_board:
;         jsr reset_board
;         jmp main_loop
; @reverse_board:
;         jsr reverse_board
;         jmp main_loop
; @user_move:
;         jsr user_move
;         jmp main_loop
; @user_no_move:
;         jsr user_no_move
;         jmp main_loop
; @user_quit:
;         rts

read_user_input:
        ; tty_read_line #entry_buffer, BUFFER_SIZE
        ; strtokenize #entry_buffer
        ; strgettoken #entry_buffer, 0
        ; copy_ptr ptr1, token_pointer
        ; strtoupper token_pointer

process_board:
        jsr draw_board
        rts

process_reset:
        jsr reset_board
        jsr draw_board
        rts

process_reverse:
        jsr reverse_board
        jsr draw_board
        rts

process_go:
        jsr calculate_next_move
        jsr draw_board
        rts

process_move:
        sta tokens_pointer
        stx tokens_pointer+1
        ; parse tokens
        strgettoken tokens_pointer, 1
        copy_ptr ptr1, param_pointer
        parse_hex_byte param_pointer
        bcs @good_first_parse
        jmp @parse_error
@good_first_parse:
        jsr check_field_number
        bcs @good_first_field
        jmp @invalid_field
@good_first_field:
        sta source_field
        strgettoken tokens_pointer, 2
        copy_ptr ptr1, param_pointer
        strtoupper param_pointer
        strcompare param_pointer, #to_token
        cmp #$00
        bne @parse_error
        strgettoken tokens_pointer, 3
        copy_ptr ptr1, param_pointer
        parse_hex_byte param_pointer
        bcc @parse_error
        jsr check_field_number
        bcc @invalid_field
        sta target_field
        jsr user_move
        bra @done
@parse_error:
        writeln_tty #unable_to_parse_move
        bra @done
@invalid_field:
        writeln_tty #invalid_field_id
        bra @done
@done:
        jsr draw_board
        rts

check_field_number:
        pha
        pha
        and #$f0
        cmp #$80
        bcs @invalid
        pla
        and #$0f
        cmp #$08
        bcs @invalid
        sec
        bra @done
@invalid:
        clc
@done:
        pla
        rts

reset_board:
        lda #$00
        sta REV
        ldx #(BOARD_SIZE-1)
@board_setup_loop:
        lda board_layout,x
        sta BOARD,x
        dex
        bpl @board_setup_loop
        ldx #(OPENING_MOVE)
        stx OMOVE
        lda #$cc
        sta DIS1
        sta DIS2
        sta DIS3
        rts

reverse_board:
        ldx #$0f
@reverse_loop:
        sec
        ldy BK,x
        lda #$77
        sbc BOARD,x
        sta BK,x
        sty BOARD,x
        sec
        lda #$77
        sbc BOARD,x
        sta BOARD,x
        dex
        bpl @reverse_loop
        ; REV = 1 - REV 
        ; (REV = !REV)
        sec
        lda #$01
        sbc REV
        sta REV
        rts

user_move:
        lda source_field
        sta DIS2
        ; find figure on this field
        jsr find_figure
        cpx #(NO_MATCH_FOUND)
        beq @error
        stx DIS1
        stx PIECE
        lda target_field
        sta DIS3
        sta SQUARE
        ; execute standard function
        jsr MOVE
        bra @done
@error:
        writeln_tty #no_figure_on_given_field
@done:
        rts

calculate_next_move:
        jsr GO
        rts

draw_board:
        ; start with copyright banner
        jsr _tty_send_newline
        writeln_tty #copyright_banner
        jsr _tty_send_newline
        jsr draw_column_labels
        ; draw row border
        jsr draw_board_line
        ; draw all fields (indexed by field_index)
        stz field_index
@field_loop:
        jsr draw_field
        inc field_index
        lda field_index
        and #$08
        beq @field_loop
@print_row_number:
        write_tty #pipe_string
        lda field_index
        ; just row number, filter out column (8)
        and #$70
        jsr _tty_write_hex
        jsr _tty_send_newline
        jsr draw_board_line
        ; start next row
        clc
        lda field_index
        adc #($10 - COLUMNS_COUNT)
        sta field_index
        cmp #(BOARD_END)
        beq @end_of_board
        bra @field_loop
@end_of_board:
        jsr draw_column_labels
        rts

draw_field:
        write_tty #pipe_string
        lda field_index
        ; check if there is any figure on it
        jsr find_figure
        cpx #(NO_MATCH_FOUND)
        bne @match_found
@empty_field:
        lda field_index
        and #$01
        sta temp
        lda field_index
        lsr
        lsr
        lsr
        lsr
        and #$01
        clc
        adc temp
        and #$01
        bne @spaces_field
@asterisks_field:
        write_tty #asterisks_string
        bra @done
@spaces_field:
        write_tty #double_space_string
        bra @done
@match_found:
        lda REV
        beq @no_reverse
        lda cpl+16,x
        bne @reverse
@no_reverse:
        lda cpl,x
@reverse:
        jsr _tty_send_character
        lda cph,x
        jsr _tty_send_character
@done:
        rts

_tty_send_character:
        sta single_char_string
        write_tty #single_char_string
        rts

draw_column_labels:
        ldx #$00
@column_loop:
        write_tty #pipe_string
        txa
        jsr _tty_write_hex
        inx
        cpx #(COLUMNS_COUNT)
        bne @column_loop
        write_tty #pipe_string
        jsr _tty_send_newline
        rts

draw_board_line:
        ldx #$00
@column_loop:
        write_tty #column_border
        inx
        cpx #(COLUMNS_COUNT+1)
        bne @column_loop
        jsr _tty_send_newline
        rts

; Assumes field in A
; Returns figure index in X or FF if not
find_figure:
        ldx #(BOARD_SIZE-1)
@find_figure_loop:
        cmp BOARD,x
        beq @found_match
        dex
        bpl @find_figure_loop
@found_match:
        rts

; ;		*=$1000			; load into RAM @ $1000-$15FF

; ; 		LDA     #$00		; REVERSE TOGGLE
; ; 		STA     REV
; ;     JSR     Init_6551
; ; CHESS		CLD			; INITIALIZE
; ; 		LDX	#$FF		; TWO STACKS
; ; 		TXS	
; ; 		LDX	#$C8
; ; 		STX	SP2
;         lda #$00
;         sta REV
; CHESS:
;         cld
;         ldx #$a8
;         stx SP2
; ;;		
; ;;      ROUTINES TO LIGHT LED
; ;;      DISPLAY AND GET KEY
; ;;      FROM KEYBOARD
; ;;		
; ; OUT		JSR	pout		; DISPLAY AND
; ; 		JSR	KIN		; GET INPUT   *** my routine waits for a keypress
; OUT:
;         jsr POUT
;         jsr KIN
;         jsr _acia_write_byte
; ;;		CMP	OLDKY		; KEY IN ACC  *** no need to debounce
; ;;		BEQ	OUT		; (DEBOUNCE)
; ;;		STA	OLDKY
; ;;		
; ; 		CMP	#$43		; [C]
; ; 		BNE	NOSET		; SET UP
; ; 		LDX	#$1F		; BOARD
; ; WHSET		LDA	SETW,X		; FROM
; ; 		STA	BOARD,X		; SETW
; ; 		DEX	
; ; 		BPL	WHSET
; ; 		LDX	#$1B		; *ADDED
; ; 		STX	OMOVE		; INITS TO $FF
; ; 		LDA	#$CC		; Display CCC
; ; 		BNE	CLDSP
;         cmp #('C')
;         bne NOSET
;         ldx #$1f
; WHSET:
;         lda SETW,x
;         sta BOARD,x
;         dex
;         bpl WHSET
;         ldx #$1b
;         stx OMOVE
;         lda #$cc
;         bne CLDSP

; ; ;		
; ; NOSET		CMP	#$45		; [E]
; ; 		BNE	NOREV		; REVERSE
; ; 		JSR	REVERSE        	; BOARD IS
; ; 		SEC
; ; 		LDA	#$01
; ; 		SBC	REV
; ; 		STA	REV		; TOGGLE REV FLAG
; ; 		LDA	#$EE            ; IS
; ; 		BNE	CLDSP
; NOSET:
;         cmp #('E')
;         bne NOREV
;         jsr REVERSE
;         sec
;         lda #$01
;         sbc REV
;         sta REV
;         lda #$ee
;         bne CLDSP
; ; ;		
; ; NOREV		CMP	#$40			; [P]
; ; 		BNE	NOGO           	; PLAY CHESS
; ; 		JSR	GO
; ; CLDSP		STA	DIS1          	; DISPLAY
; ; 		STA	DIS2         	; ACROSS
; ; 		STA	DIS3          	; DISPLAY
; ; 		BNE	CHESS
; NOREV:
;         cmp #('P')
;         bne NOGO
;         jsr GO
; CLDSP:
;         sta DIS1
;         sta DIS2
;         sta DIS3
;         bne CHESS
; ; ;		
; ; NOGO		CMP	#$0D            ; [Enter]
; ; 		BNE	NOMV          	; MOVE MAN
; ; 		JSR	MOVE          	; AS ENTERED
; ; 		JMP	DISP
; ; NOMV		CMP     #$41		; [Q] ***Added to allow game exit***
; ; 		BEQ     DONE		; quit the game, exit back to system.  
; ; 		JMP	INPUT		; process move
; ; DONE		JMP     $FF00		; *** MUST set this to YOUR OS starting address
; NOGO:
;         cmp #('F')
;         bne NOMV
;         jsr MOVE
;         jmp DISP
; NOMV:
;         cmp #('Q')
;         beq DONE
;         jmp INPUT
; DONE:
;         rts
; ;		
; ;       THE ROUTINE JANUS DIRECTS THE
; ;       ANALYSIS BY DETERMINING WHAT
; ;       SHOULD OCCUR AFTER EACH MOVE
; ;       GENERATED BY GNM
; ;		
; ;		
; ;
; JANUS		LDX	STATE
; 		BMI	NOCOUNT
JANUS:
        ldx STATE
        bmi NOCOUNT
; ;		
; ;       THIS ROUTINE COUNTS OCCURRENCES
; ;       IT DEPENDS UPON STATE TO INDEX
; ;       THE CORRECT COUNTERS
; ;		
; COUNTS		LDA	PIECE
; 		BEQ	OVER           	; IF STATE=8
; 		CPX 	#$08           	; DO NOT COUNT
; 		BNE	OVER          	; BLK MAX CAP
; 		CMP	BMAXP        	; MOVES FOR
; 		BEQ	XRT           	; WHITE
COUNTS:
        lda PIECE
        beq OVER
        cpx #$08
        bne OVER
        cmp BMAXP
        beq XRT
; ; 		
; OVER		INC	MOB,X          	; MOBILITY
; 		CMP 	#$01           	;  + QUEEN
; 		BNE	NOQ           	; FOR TWO
; 		INC	MOB,X
OVER:
        inc MOB,x
        cmp #$01
        bne NOQ
        inc MOB,x
; ;		
; NOQ		BVC	NOCAP
; 		LDY	#$0F           	; CALCULATE
; 		LDA	SQUARE       	; POINTS
; ELOOP		CMP	BK,Y           	; CAPTURED
; 		BEQ	FOUN          	; BY THIS
; 		DEY			; MOVE
; 		BPL	ELOOP
; FOUN		LDA	POINTS,Y
; 		CMP	MAXC,X
; 		BCC	LESS          	; SAVE IF
; 		STY	PCAP,X         	; BEST THIS
; 		STA	MAXC,X         	; STATE
NOQ:
        bvc NOCAP
        ldy #$0f
        lda SQUARE
ELOOP:
        cmp BK,y
        beq FOUN
        dey
        bpl ELOOP
FOUN:
        lda POINTS,y
        cmp MAXC,x
        bcc LESS
        sty PCAP,x
        sta MAXC,x
; ;		
; LESS		CLC	
; 		PHP			; ADD TO
; 		ADC	CC,X           	; CAPTURE
; 		STA	CC,X           	; COUNTS
; 		PLP	
LESS:
        clc
        php
        adc CC,x
        sta CC,x
        plp
; ;		
; NOCAP		CPX	#$04
; 		BEQ	ON4
; 		BMI	TREE          	;(=00 ONLY)
; XRT		RTS	
NOCAP:
        cpx #$04
        beq ON4
        bmi TREE
XRT:
        rts
; ;		
; ;      GENERATE FURTHER MOVES FOR COUNT
; ;      AND ANALYSIS	
; ;		
; ON4		LDA	XMAXC        	; SAVE ACTUAL 
; 		STA	WCAP0         	; CAPTURE
; 		LDA	#$00           	; STATE=0
; 		STA	STATE
; 		JSR	MOVE          	; GENERATE
; 		JSR	REVERSE       	; IMMEDIATE
; 		JSR	GNMZ         	; REPLY MOVES  
; 		JSR	REVERSE
ON4:
        lda XMAXC
        sta WCAP0
        lda #$00
        sta STATE
        jsr MOVE
        jsr REVERSE
        jsr GNMZ
        jsr REVERSE
; ;		
; 		LDA	#$08       	; STATE=8
; 		STA	STATE        	; GENERATE
        lda #$08
        sta STATE
; ;		JSR	OHM          	; CONTINUATION
; 		JSR	UMOVE         	; MOVES
        jsr UMOVE
; ;		
; 		JMP	STRATGY       	; FINAL EVALUATION
; NOCOUNT	CPX	#$F9
; 		BNE	TREE
        jmp STRATGY
NOCOUNT:
        cpx #$f9
        bne TREE
; ;		
; ;      DETERMINE IF THE KING CAN BE
; ;      TAKEN, USED BY CHKCHK
; ;		
; 		LDA	BK           	; IS KING
; 		CMP	SQUARE       	; IN CHECK?
; 		BNE	RETJ          	; SET INCHEK=0
; 		LDA	#$00           	; IF IT IS
; 		STA	INCHEK
; RETJ		RTS
        lda BK
        cmp SQUARE
        bne RETJ
        lda #$00
        sta INCHEK
RETJ:
        rts
; ;		
; ;      IF A PIECE HAS BEEN CAPTURED BY
; ;      A TRIAL MOVE, GENERATE REPLIES &
; ;      EVALUATE THE EXCHANGE GAIN/LOSS
; ;		
; TREE		BVC	RETJ          	; NO CAP
; 		LDY	#$07           	; (PIECES)
; 		LDA	SQUARE
; LOOPX		CMP	BK,Y
; 		BEQ	FOUNX
; 		DEY	
; 		BEQ	RETJ          	; (KING)
; 		BPL	LOOPX         	; SAVE
; FOUNX		LDA	POINTS,Y       	; BEST CAP
; 		CMP	BCAP0,X        	; AT THIS
; 		BCC	NOMAX         	; LEVEL
; 		STA	BCAP0,X
; NOMAX		DEC	STATE
; 		LDA	#$FB           	; IF STATE=FB
; 		CMP	STATE        	; TIME TO TURN
; 		BEQ	UPTREE        	; AROUND
; 		JSR	GENRM         	; GENERATE FURTHER
; UPTREE		INC	STATE        	; CAPTURES
; 		RTS	
TREE:
        bvc RETJ
        ldy #$07
        lda SQUARE
LOOPX:
        beq FOUNX
        dey
        beq RETJ
        bpl LOOPX
FOUNX:
        lda POINTS,y
        cmp BCAP0,x
        bcc NOMAX
        sta BCAP0,x
NOMAX:
        dec STATE
        lda #$fb
        cmp STATE
        beq UPTREE
        jsr GENRM
UPTREE:
        inc STATE
        rts
; ; ;		
; ; ;      THE PLAYER'S MOVE IS INPUT
; ; ;		
; ; INPUT		CMP	#$08           	; NOT A LEGAL
; ; 		BCS	ERROR      	; SQUARE #
; ; 		JSR	DISMV
; ; DISP		LDX	#$1F
; ; SEARCH		LDA	BOARD,X
; ; 		CMP	DIS2
; ; 		BEQ	HERE          	; DISPLAY
; ; 		DEX			; PIECE AT    
; ; 		BPL	SEARCH        	; FROM
; ; HERE		STX	DIS1         	; SQUARE
; ; 		STX	PIECE
; ; ERROR		JMP	CHESS
; INPUT:
;         cmp #$08
;         bcs ERROR
;         jsr DISMV
; DISP:
;         ldx #$1f
; SEARCH:
;         lda BOARD,x
;         cmp DIS2
;         beq HERE
;         dex
;         bpl SEARCH
; HERE:
;         stx DIS1
;         stx PIECE
; ERROR:
;         jmp CHESS
; ;		
; ;      GENERATE ALL MOVES FOR ONE
; ;      SIDE, CALL JANUS AFTER EACH
; ;      ONE FOR NEXT STE?
; ;		
; ;
; GNMZ		LDX	#$10            ; CLEAR
; GNMX		LDA	#$00            ; COUNTERS
; CLEAR		STA	COUNT,X
; 		DEX	
; 		BPL	CLEAR
GNMZ:
        ldx #$10
GNMX:
        lda #$00
CLEAR:
        sta COUNT,x
        dex
        bpl CLEAR
; ;		
; GNM		LDA	#$10            ; SET UP
; 		STA	PIECE        	; PIECE
; NEWP		DEC	PIECE        	; NEW PIECE
; 		BPL	NEX           	; ALL DONE?
; 		RTS			; #NAME?
GNM:
        lda #$10
        sta PIECE
NEWP:
        dec PIECE
        bpl NEX
        rts
; ;		
; NEX		JSR	RESET        	; READY
; 		LDY	PIECE        	; GET PIECE
; 		LDX	#$08
; 		STX	MOVEN        	; COMMON START
; 		CPY	#$08            ; WHAT IS IT?
; 		BPL	PAWN          	; PAWN
; 		CPY	#$06
; 		BPL	KNIGHT        	; KNIGHT
; 		CPY	#$04
; 		BPL	BISHOP       	; BISHOP
; 		CPY	#$01
; 		BEQ	QUEEN         	; QUEEN
; 		BPL	ROOK          	; ROOK
NEX:
        jsr RESET
        ldy PIECE
        ldx #$08
        stx MOVEN
        cpy #$08
        bpl PAWN
        cpy #$06
        bpl KNIGHT
        cpy #$04
        bpl BISHOP
        cpy #$01
        beq QUEEN
        bpl ROOK
; ;		
; KING		JSR	SNGMV         	; MUST BE KING!
; 		BNE	KING          	; MOVES
; 		BEQ	NEWP          	; 8 TO 1
; QUEEN		JSR	LINE
; 		BNE	QUEEN         	; MOVES
; 		BEQ	NEWP          	; 8 TO 1
KING:
        jsr SNGMV
        bne KING
        beq NEWP
QUEEN:
        jsr LINE
        bne QUEEN
        beq NEWP
; ;		
; ROOK		LDX	#$04
; 		STX	MOVEN        	; MOVES
; AGNR		JSR	LINE          	; 4 TO 1
; 		BNE	AGNR
; 		BEQ	NEWP
ROOK:
        ldx #$04
        stx MOVEN
AGNR:
        jsr LINE
        bne AGNR
        beq NEWP
; ;		
; BISHOP		JSR	LINE
; 		LDA	MOVEN        	; MOVES
; 		CMP	#$04           	; 8 TO 5
; 		BNE	BISHOP
; 		BEQ	NEWP
BISHOP:
        jsr LINE
        lda MOVEN
        cmp #$04
        bne BISHOP
        beq NEWP
; ;		
; KNIGHT		LDX	#$10
; 		STX	MOVEN        	; MOVES
; AGNN		JSR	SNGMV         	; 16 TO 9
; 		LDA	MOVEN
; 		CMP	#$08
; 		BNE	AGNN
; 		BEQ	NEWP
KNIGHT:
        ldx #$10
        stx MOVEN
AGNN:
        jsr SNGMV
        lda MOVEN
        cmp #$08
        bne AGNN
        beq NEWP
; ;		
; PAWN		LDX	#$06
; 		STX	MOVEN
; P1		JSR	CMOVE         	; RIGHT CAP?
; 		BVC	P2
; 		BMI	P2
; 		JSR	JANUS         	; YES
; P2		JSR	RESET
; 		DEC	MOVEN        	; LEFT CAP?
; 		LDA	MOVEN
; 		CMP	#$05
; 		BEQ	P1
; P3		JSR	CMOVE         	; AHEAD
; 		BVS	NEWP          	; ILLEGAL
; 		BMI	NEWP
; 		JSR	JANUS
; 		LDA	SQUARE       	; GETS TO
; 		AND	#$F0           	; 3RD RANK?
; 		CMP	#$20
; 		BEQ	P3            	; DO DOUBLE
; 		JMP	NEWP
PAWN:
        ldx #$06
        stx MOVEN
P1:
        jsr CMOVE
        bvc P2
        bmi P2
        jsr JANUS
P2:
        jsr RESET
        dec MOVEN
        lda MOVEN
        cmp #$05
        beq P1
P3:
        jsr CMOVE
        bvs NEWP
        bmi NEWP
        jsr JANUS
        lda SQUARE
        and #$f0
        cmp #$20
        beq P3
        jmp NEWP
; ;		
; ;      CALCULATE SINGLE STEP MOVES
; ;      FOR K,N	
; ;		
; SNGMV		JSR	CMOVE        	; CALC MOVE
; 		BMI	ILL1           	; -IF LEGAL
; 		JSR	JANUS           ; -EVALUATE
; ILL1		JSR	RESET
; 		DEC	MOVEN
; 		RTS	
SNGMV:
        jsr CMOVE
        bmi ILL1
        jsr JANUS
ILL1:
        jsr RESET
        dec MOVEN
        rts
; ;		
; ;     CALCULATE ALL MOVES DOWN A
; ;     STRAIGHT LINE FOR Q,B,R
; ;		
; LINE		JSR	CMOVE         	; CALC MOVE
; 		BCC	OVL            	; NO CHK
; 		BVC	LINE		; NOCAP       
; OVL		BMI	ILL             ; RETURN
; 		PHP	
; 		JSR	JANUS         	; EVALUATE POSN
; 		PLP	
; 		BVC	LINE          	; NOT A CAP
; ILL		JSR	RESET         	; LINE STOPPED
; 		DEC	MOVEN         	; NEXT DIR
; 		RTS	
LINE:
        jsr CMOVE
        bcc OVL
        bvc LINE
OVL:
        bmi ILL
        php
        jsr JANUS
        plp
        bvc LINE
ILL:
        jsr RESET
        dec MOVEN
        rts
; ;		
; ;      EXCHANGE SIDES FOR REPLY
; ;      ANALYSIS	
; ;		
; REVERSE		LDX	#$0F
; ETC		SEC	
; 		LDY	BK,X           	; SUBTRACT
; 		LDA 	#$77           	; POSITION
; 		SBC  	BOARD,X        	; FROM 77
; 		STA  	BK,X
; 		STY  	BOARD,X         ; AND
; 		SEC	
; 		LDA	#$77           	; EXCHANGE
; 		SBC 	BOARD,X        	; PIECES
; 		STA  	BOARD,X
; 		DEX	
; 		BPL   	ETC
; 		RTS	
REVERSE:
        ldx #$0f
ETC:
        sec
        ldy BK,x
        lda #$77
        sbc BOARD,x
        sta BK,x
        sty BOARD,x
        sec
        lda #$77
        sbc BOARD,x
        sta BOARD,x
        dex
        bpl ETC
        rts
; ;		
; ;        CMOVE CALCULATES THE TO SQUARE
; ;        USING SQUARE AND THE MOVE
; ;       TABLE  FLAGS SET AS FOLLOWS:
; ;       N#NAME?	MOVE
; ;       V#NAME?	(LEGAL UNLESS IN CR)
; ;       C#NAME?	BECAUSE OF CHECK
; ;       [MY &THANKS TO JIM BUTTERFIELD
; ;        WHO WROTE THIS MORE EFFICIENT
; ;        VERSION OF CMOVE)
; ;		
; CMOVE		LDA	SQUARE       	; GET SQUARE
; 		LDX	MOVEN       	; MOVE POINTER
; 		CLC	
; 		ADC	MOVEX,X        	; MOVE LIST
; 		STA	SQUARE       	; NEW POS'N
; 		AND	#$88
; 		BNE	ILLEGAL       	; OFF BOARD
; 		LDA	SQUARE
CMOVE:
        lda SQUARE
        ldx MOVEN
        clc
        adc MOVEX,x
        sta SQUARE
        and #$88
        bne ILLEGAL
        lda SQUARE
; ;			
; 		LDX	#$20
; LOOP		DEX			; IS TO
; 		BMI	NO            	; SQUARE
; 		CMP  	BOARD,X        	; OCCUPIED?
; 		BNE   	LOOP
        ldx #$20
LOOP:
        dex
        bmi NO
        cmp BOARD,x
        bne LOOP
; ;			
; 		CPX	#$10            ; BY SELF?
; 		BMI   	ILLEGAL
        cpx #$10
        bmi ILLEGAL
; ;			
; 		LDA	#$7F		; MUST BE CAP!
; 		ADC	#$01            ; SET V FLAG
; 		BVS   	SPX 	        ; (JMP)
        lda #$7f
        adc #$01
        bvs SPX
; ;			
; NO		CLV			; NO CAPTURE
NO:
        clv
; ;			
; SPX		LDA  	STATE         	; SHOULD WE
; 		BMI   	RETL           	; DO THE
; 		CMP	#$08 	        ; CHECK CHECK?
; 		BPL  	RETL
SPX:
        lda STATE
        bmi RETL
        cmp #$08
        bpl RETL
; ;			
; ;        CHKCHK REVERSES SIDES
; ;       AND LOOKS FOR A KING
; ;       CAPTURE TO INDICATE
; ;       ILLEGAL MOVE BECAUSE OF
; ;       CHECK  SINCE THIS IS
; ;       TIME CONSUMING, IT IS NOT
; ;       ALWAYS DONE	
; ;		
; CHKCHK	PHA				; STATE  #392
; 		PHP	
; 		LDA	#$F9
; 		STA	STATE         	; GENERATE
; 		STA	INCHEK        	; ALL REPLY
; 		JSR	MOVE          	; MOVES TO
; 		JSR	REVERSE       	; SEE IF KING
; 		JSR	GNM           	; IS IN
; 		JSR	RUM           	; CHECK
; 		PLP	
; 		PLA	
; 		STA	STATE
; 		LDA	INCHEK
; 		BMI	RETL           	; NO - SAFE
; 		SEC			; YES - IN CHK
; 		LDA	#$FF
; 		RTS
CHKCHK:
        pha
        php
        lda #$f9
        sta STATE
        sta INCHEK
        jsr MOVE
        jsr REVERSE
        jsr GNM
        jsr RUM
        plp
        pla
        sta STATE
        lda INCHEK
        bmi RETL
        sec
        lda #$ff
        rts
; ;		
; RETL		CLC			; LEGAL
; 		LDA	#$00            ; RETURN
; 		RTS	
RETL:
        clc
        lda #$00
        rts
; ;		
; ILLEGAL	LDA	#$FF
; 		CLC			; ILLEGAL
; 		CLV			; RETURN
; 		RTS	
ILLEGAL:
        lda #$ff
        clc
        clv
        rts
; ;		
; ;       REPLACE PIECE ON CORRECT SQUARE
; ;		
; RESET		LDX	PIECE      	; GET LOGAT
; 		LDA	BOARD,X        	; FOR PIECE
; 		STA	SQUARE       	; FROM BOARD
; 		RTS	
RESET:
        ldx PIECE
        lda BOARD,x
        sta SQUARE
        rts
; ;		
; ;		
; ;		
; GENRM		JSR	MOVE          	; MAKE MOVE
; GENR2		JSR	REVERSE      	; REVERSE BOARD
; 		JSR	GNM          	; GENERATE MOVES
; RUM		JSR	REVERSE   	; REVERSE BACK
GENRM:
        jsr MOVE
GENR2:
        jsr REVERSE
        jsr GNM
RUM:
        jsr REVERSE
; ;		
; ;       ROUTINE TO UNMAKE A MOVE MADE BY
; ;	  MOVE
; ;		
; UMOVE		TSX			; UNMAKE MOVE
; 		STX	SP1
; 		LDX	SP2           	; EXCHANGE
; 		TXS			; STACKS
; 		PLA			; MOVEN
; 		STA	MOVEN
; 		PLA			; CAPTURED
; 		STA	PIECE        	; PIECE
; 		TAX	
; 		PLA			; FROM SQUARE
; 		STA	BOARD,X
; 		PLA			; PIECE
; 		TAX	
; 		PLA			; TO SOUARE
; 		STA	SQUARE
; 		STA	BOARD,X
; 		JMP	STRV
UMOVE:
        tsx
        stx SP1
        ldx SP2
        txs
        pla
        sta MOVEN
        pla
        sta PIECE
        tax
        pla
        sta BOARD,x
        pla
        tax
        pla
        sta SQUARE
        sta BOARD,x
        jmp STRV
; ;		
; ;       THIS ROUTINE MOVES PIECE
; ;       TO SQUARE, PARAMETERS
; ;       ARE SAVED IN A STACK TO UNMAKE
; ;       THE MOVE LATER
; ;		
; MOVE		TSX	
; 		STX	SP1          	; SWITCH
; 		LDX	SP2          	; STACKS
; 		TXS	
; 		LDA	SQUARE
; 		PHA			; TO SQUARE
; 		TAY	
; 		LDX	#$1F
; CHECK		CMP	BOARD,X        	; CHECK FOR
; 		BEQ	TAKE          	; CAPTURE
; 		DEX	
; 		BPL	CHECK
; TAKE		LDA	#$CC
; 		STA	BOARD,X
; 		TXA			; CAPTURED
; 		PHA			; PIECE
; 		LDX	PIECE
; 		LDA	BOARD,X
; 		STY	BOARD,X        	; FROM
; 		PHA			; SQUARE
; 		TXA	
; 		PHA			; PIECE
; 		LDA	MOVEN
; 		PHA			; MOVEN
; STRV		TSX	
; 		STX	SP2           	; SWITCH
; 		LDX	SP1           	; STACKS
; 		TXS			; BACK
; 		RTS	
MOVE:
        tsx
        stx SP1
        ldx SP2
        txs
        lda SQUARE
        pha
        tay
        ldx #$1f
CHECK:
        cmp BOARD,x
        beq TAKE
        dex
        bpl CHECK
TAKE:
        lda #$cc
        sta BOARD,x
        txa
        pha
        ldx PIECE
        lda BOARD,x
        sty BOARD,x
        pha
        txa
        pha
        lda MOVEN
        pha
STRV:
        tsx
        stx SP2
        ldx SP1
        txs
        rts
; ;			
; ;       CONTINUATION OF SUB STRATGY
; ;       -CHECKS FOR CHECK OR CHECKMATE
; ;       AND ASSIGNS VALUE TO MOVE
; ;		
; CKMATE	LDY	BMAXC         		; CAN BLK CAP
; 		CPX	POINTS       	; MY KING?
; 		BNE	NOCHEK	
; 		LDA	#$00           	; GULP!
; 		BEQ	RETV          	; DUMB MOVE!
CKMATE:
        ldy BMAXC
        cpx POINTS
        bne NOCHEK
        lda #$00
        beq RETV
; ;		
; NOCHEK	LDX	BMOB         		; IS BLACK
; 		BNE	RETV          	; UNABLE TO
; 		LDX	WMAXP        	; MOVE AND
; 		BNE	RETV          	; KING IN CH?
; 		LDA	#$FF           	; YES! MATE
NOCHEK:
        ldx BMOB
        bne RETV
        ldx WMAXP
        bne RETV
        lda #$ff
; ;		
; RETV		LDX	#$04            ; RESTORE
; 		STX	STATE        	; STATE=4
RETV:
        ldx #$04
        stx STATE
; ;		
; ;       THE VALUE OF THE MOVE (IN ACCU)
; ;       IS COMPARED TO THE BEST MOVE AND
; ;       REPLACES IT IF IT IS BETTER
; ;		
; PUSH		CMP	BESTV         	; IS THIS BEST
; 		BCC	RETP          	; MOVE SO FAR?
; 		BEQ	RETP
; 		STA	BESTV        	; YES!
; 		LDA	PIECE        	; SAVE IT
; 		STA	BESTP
; 		LDA	SQUARE
; 		STA	BESTM        	; FLASH DISPLAY
; RETP		LDA	#"."		; print ... instead of flashing disp
; 		Jmp	syschout	; print . and return
PUSH:
        cmp BESTV
        bcc RETP
        beq RETP
        sta BESTV
        lda PIECE
        sta BESTP
        lda SQUARE
        sta BESTM
RETP:
        lda #('.')
        jsr _tty_send_character
        rts
; ;		
; ;       MAIN PROGRAM TO PLAY CHESS
; ;       PLAY FROM OPENING OR THINK
; ;		
; GO		LDX	OMOVE        	; OPENING?
; 		BMI	NOOPEN          ; -NO   *ADD CHANGE FROM BPL
; 		LDA	DIS3         	; -YES WAS
; 		CMP	OPNING,X        ; OPPONENT'S
; 		BNE	END            	; MOVE OK?
; 		DEX	
; 		LDA	OPNING,X       	; GET NEXT
; 		STA	DIS1         	; CANNED
; 		DEX			; OPENING MOVE
; 		LDA	OPNING,X
; 		STA	DIS3         	; DISPLAY IT
; 		DEX	
; 		STX	OMOVE        	; MOVE IT
; 		BNE	MV2            	; (JMP)
GO:
        ldx OMOVE
        bmi NOOPEN
        lda DIS3
        cmp OPNING,x
        bne END
        dex
        lda OPNING,x
        sta DIS1
        dex
        lda OPNING,x
        sta DIS3
        dex
        stx OMOVE
        bne MV2
; ;			
; END		LDA     #$FF		; *ADD - STOP CANNED MOVES
; 		STA	OMOVE        	; FLAG OPENING
; NOOPEN	LDX	#$0C            	; FINISHED
; 		STX	STATE        	; STATE=C
; 		STX	BESTV        	; CLEAR BESTV
; 		LDX	#$14           	; GENERATE P
; 		JSR	GNMX          	; MOVES
END:
        lda #$ff
        sta OMOVE
NOOPEN:
        ldx #$0c
        stx STATE
        stx BESTV
        ldx #$14
        jsr GNMX
; ;		
; 		LDX	#$04           	; STATE=4
; 		STX	STATE        	; GENERATE AND
; 		JSR	GNMZ          	; TEST AVAILABLE
        ldx #$04
        stx STATE
        jsr GNMZ
; ;
; ;	MOVES
; ;		
; 		LDX	BESTV        	; GET BEST MOVE
; 		CPX	#$0F           	; IF NONE
; 		BCC	MATE          	; OH OH!
        ldx BESTV
        cpx #$0f
        bcc MATE
; ;		
; MV2		LDX	BESTP        	; MOVE
; 		LDA	BOARD,X         ; THE
; 		STA	BESTV        	; BEST
; 		STX	PIECE        	; MOVE
; 		LDA	BESTM
; 		STA	SQUARE       	; AND DISPLAY
; 		JSR	MOVE           	; IT
; 		JMP	CHESS
MV2:
        ldx BESTP
        lda BOARD,x
        sta BESTV
        stx PIECE
        lda BESTM
        sta SQUARE
        jsr MOVE
; rts instead of jmp to chess
;        jmp CHESS
        rts
; ;		
; MATE		LDA	#$FF           	; RESIGN
; 		RTS			; OR STALEMATE
MATE:
        lda #$ff
        rts
; ; ;		
; ; ;       SUBROUTINE TO ENTER THE
; ; ;       PLAYER'S MOVE
; ; ;		
; ; DISMV		LDX	#$04           	; ROTATE
; ; DROL		ASL	DIS3          	; KEY
; ; 		ROL	DIS2         	; INTO
; ; 		DEX			; DISPLAY
; ; 		BNE	DROL		;
; ; 		ORA	DIS3
; ; 		STA	DIS3
; ; 		STA	SQUARE
; ; 		RTS	
; DISMV:
;         ldx #$04
; DROL:
;         asl DIS3
;         rol DIS2
;         dex
;         bne DROL
;         ora DIS3
;         sta DIS3
;         sta SQUARE
;         rts
; ;		
; ;       THE FOLLOWING SUBROUTINE ASSIGNS
; ;       A VALUE TO THE MOVE UNDER
; ;       CONSIDERATION AND RETURNS IT IN
; ;	THE ACCUMULATOR
; ;		

; STRATGY	CLC	
; 		LDA	#$80
; 		ADC	WMOB         	; PARAMETERS
; 		ADC	WMAXC        	; WITH WHEIGHT
; 		ADC	WCC          	; OF O25
; 		ADC	WCAP1
; 		ADC	WCAP2
; 		SEC	
; 		SBC	PMAXC
; 		SBC	PCC
; 		SBC	BCAP0
; 		SBC	BCAP1
; 		SBC	BCAP2
; 		SBC	PMOB
; 		SBC	BMOB
; 		BCS	POS           	; UNDERFLOW
; 		LDA	#$00           	; PREVENTION
STRATGY:
        clc
        lda #$80
        adc WMOB
        adc WMAXC
        adc WCC
        adc WCAP1
        adc WCAP2
        sec
        sbc PMAXC
        sbc PCC
        sbc BCAP0
        sbc BCAP1
        sbc BCAP2
        sbc PMOB
        sbc BMOB
        bcs POS
        lda #$00
; POS		LSR	
; 		CLC			; **************
; 		ADC	#$40
; 		ADC	WMAXC       	; PARAMETERS
; 		ADC	WCC         	; WITH WEIGHT
; 		SEC			; OF 05
; 		SBC	BMAXC
; 		LSR			; **************
; 		CLC	
; 		ADC	#$90
; 		ADC	WCAP0       	; PARAMETERS
; 		ADC	WCAP0       	; WITH WEIGHT
; 		ADC	WCAP0       	; OF 10
; 		ADC	WCAP0
; 		ADC	WCAP1
; 		SEC			; [UNDER OR OVER-
; 		SBC	BMAXC        	; FLOW MAY OCCUR
; 		SBC	BMAXC        	; FROM THIS
; 		SBC	BMCC          	; SECTION]
; 		SBC	BMCC
; 		SBC	BCAP1
POS:
        lsr
        clc
        adc #$40
        adc WMAXC
        adc WCC
        sec
        sbc BMAXC
        lsr
        clc
        adc #$90
        adc WCAP0
        adc WCAP0
        adc WCAP0
        adc WCAP0
        adc WCAP1
        sec
        sbc BMAXC
        sbc BMAXC
        sbc BMCC
        sbc BMCC
        sbc BCAP1
; 		LDX	SQUARE      	; ***************
; 		CPX	#$33
; 		BEQ	POSN         	; POSITION
; 		CPX	#$34           	; BONUS FOR
; 		BEQ	POSN         	; MOVE TO
; 		CPX	#$22           	; CENTRE
; 		BEQ	POSN           	; OR
; 		CPX	#$25           	; OUT OF
; 		BEQ	POSN         	; BACK RANK
; 		LDX	PIECE
; 		BEQ	NOPOSN
; 		LDY	BOARD,X
; 		CPY	#$10
; 		BPL	NOPOSN
; POSN		CLC
; 		ADC	#$02
; NOPOSN	JMP	CKMATE       		; CONTINUE
        ldx SQUARE
        cpx #$33
        beq POSN
        cpx #$34
        beq POSN
        cpx #$22
        beq POSN
        cpx #$25
        beq POSN
        ldx PIECE
        beq NOPOSN
        ldy BOARD,x
        cpy #$10
        bpl NOPOSN
POSN:
        clc
        adc #$02
NOPOSN:
        jmp CKMATE

; ; ;-----------------------------------------------------------------
; ; ; The following routines were added to allow text-based board
; ; ; display over a standard RS-232 port.
; ; ;
; ; POUT        	jsr 	pout9		; print CRLF
; ; 		jsr     pout13		; print copyright
; ; 		JSR	POUT10		; print column labels
; ; 		LDY   	#$00		; init board location
; ; 		JSR	POUT5		; print board horz edge
; ; POUT1		lDA   	#"|"		; print vert edge
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - SPACE
; ; 		LDX   	#$1F
; ; POUT2		TYA			; scan the pieces for a location match
; ;             	CMP	BOARD,X		; match found?
; ;             	BEQ   	POUT4		; yes; print the piece's color and type
; ;             	DEX			; no
; ;             	BPL	POUT2		; if not the last piece, try again
; POUT:
;         jsr POUT9
;         jsr POUT13
;         jsr POUT10
;         ldy #$00
;         jsr POUT5
; POUT1:
;         lda #('|')
;         jsr syschout
;         ldx #$1f
; POUT2:
;         tya
;         cmp BOARD,x
;         beq POUT4
;         dex
;         bpl POUT2
; ; 		tya			; empty square	
; ; 		and	#$01		; odd or even column?				
; ; 		sta   	temp		; save it
; ; 		tya  			; is the row odd or even
; ; 		lsr			; shift column right 4 spaces 
; ; 		lsr			;
; ; 		lsr			;
; ; 		lsr			;
; ; 		and   	#$01		; strip LSB  
; ; 		clc			; 
; ; 		adc   	temp		; combine row & col to determine square color  
; ; 		and   	#$01		; is board square white or blk?
; ; 		bne	pout25 		; white, print space
; ; 		lda   	#"*"		; black, print *
; ; 		.byte	$2c		; used to skip over LDA #$20
;         tya
;         and #$01
;         sta temp
;         tya
;         lsr
;         lsr
;         lsr
;         lsr
;         and #$01
;         clc
;         adc temp
;         and #$01
;         bne POUT25
;         lda #('*')
;         .byte $2c
; ; POUT25		LDA   	#$20		; ASCII space
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - SPACE
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - SPACE
; POUT25:
;         lda #$20
;         jsr syschout
;         jsr syschout
; ; POUT3		INY			; 
; ; 	        TYA			; get row number
; ;             	AND   	#$08		; have we completed the row?	 
; ;             	BEQ   	POUT1		; no, do next column
; ; 		LDA   	#"|"		; yes, put the right edge on
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - |             
; ; 		jsr	pout12		; print row number
; ; 		JSR   	POUT9		; print CRLF
; ;             	JSR   	POUT5		; print bottom edge of board
; ; 		CLC			; 
; ; 		TYA			; 
; ; 		ADC	#$08		; point y to beginning of next row
; ; 		TAY			;
; ; 		CPY   	#$80		; was that the last row?
; ; 		BEQ   	POUT8		; yes, print the LED values
; ; 		BNE   	POUT1		; no, do new row
; POUT3:
;         iny
;         tya
;         and #$08
;         beq POUT1
;         lda #('|')
;         jsr syschout
;         jsr POUT12
;         jsr POUT9
;         jsr POUT5
;         clc
;         tya
;         adc #$08
;         tay
;         cpy #$80
;         beq POUT8
;         bne POUT1
; ; POUT4		LDA   	REV		; print piece's color & type
; ; 		BEQ   	POUT41		;
; ; 		LDA	cpl+16,X	;
; ; 		BNE	POUT42		;
; ; POUT41		LDA   	cpl,x		;
; ; POUT42		JSR	syschout	;
; ; 		lda	cph,x		;
; ; 		jsr   	syschout	; 
; ; 		BNE	POUT3		; branch always
; POUT4:
;         lda REV
;         beq POUT41
;         lda cpl+16,x
;         bne POUT42
; POUT41:
;         lda cpl,x
; POUT42:
;         jsr syschout
;         lda cph,x
;         jsr syschout
;         bne POUT3
; ; POUT5       	TXA			; print "-----...-----<crlf>"
; ; 		PHA
; ; 		LDX	#$19
; ; 		LDA	#"-"
; ; POUT6		JSR   	syschout	; PRINT ONE ASCII CHR - "-"
; ; 		DEX
; ; 		BNE	POUT6
; ; 		PLA
; ; 		TAX
; ; 		JSR	POUT9
; ; 		RTS	 		
; POUT5:
;         txa
;         pha
;         ldx #$19
;         lda #('-')
; POUT6:
;         jsr syschout
;         dex
;         bne POUT6
;         pla
;         tax
;         jsr POUT9
;         rts

; ; POUT8		jsr	pout10		; 
; ; 		LDA   	$FB
; ; 		JSR   	syshexout	; PRINT 1 BYTE AS 2 HEX CHRS	
; ;         	LDA   	#$20
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - SPACE
; ;         	LDA   	$FA
; ; 		JSR   	syshexout	; PRINT 1 BYTE AS 2 HEX CHRS	
; ;         	LDA   	#$20
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - SPACE
; ;         	LDA   	$F9
; ; 		JSR   	syshexout	; PRINT 1 BYTE AS 2 HEX CHRS
; POUT8:
;         jsr POUT10
;         lda DIS1
;         jsr syshexout
;         lda #(' ')
;         jsr syschout
;         lda DIS2
;         jsr syshexout
;         lda #(' ')
;         jsr syschout
;         lda DIS3
;         jsr syshexout

; ; POUT9      	LDA   	#$0D
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - CR
; ;         	LDA   	#$0A
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - LF
; ;                 RTS 
; POUT9:
;         lda #$0d
;         jsr syschout
;         lda #$0a
;         jsr syschout
;         rts

; ; pout10		ldx   	#$00		; print the column labels
; ; POUT11		lda	#$20		; 00 01 02 03 ... 07 <CRLF>
; ; 		jsr   	syschout
; ; 		txa
; ; 		jsr	syshexout
; ; 		INX
; ; 		CPX   	#$08
; ; 		BNE	POUT11
; ; 		BEQ	POUT9
; ; POUT12		TYA
; ; 		and 	#$70
; ; 		JSR 	syshexout
; ; 		rts
; POUT10:
;         ldx #$00
; POUT11:
;         lda #(' ')
;         jsr syschout
;         txa
;         jsr syshexout
;         inx
;         cpx #$08
;         bne POUT11
;         beq POUT9
; POUT12:
;         tya
;         and #$70
;         jsr syshexout
;         rts

; ; Pout13		ldx   	#$00		; Print the copyright banner
; ; Pout14		lda   	banner,x
; ; 		beq   	POUT15
; ; 		jsr   	syschout
; ; 		inx
; ; 		bne   	POUT14
; ; POUT15		rts
; POUT13:
;         ldx #$00
; POUT14:
;         lda banner,x
;         beq POUT15
;         jsr syschout
;         inx
;         bne POUT14
; POUT15:
;         rts         

; ; KIN        	LDA   	#"?"
; ; 		JSR   	syschout	; PRINT ONE ASCII CHR - ?
; ; 		JSR   	syskin		; GET A KEYSTROKE FROM SYSTEM
; ;             	AND   	#$4F            ; MASK 0-7, AND ALPHA'S
; ;             	RTS
; KIN:
;         lda #('?')
;         jsr syschout
;         jsr syskin
;         ;and #$4f
;         rts
; ;
; ; 6551 I/O Support Routines
; ;
; ;
; ; Init_6551      lda   #$1F               ; 19.2K/8/1
; ;                sta   ACIActl            ; control reg 
; ;                lda   #$0B               ; N parity/echo off/rx int off/ dtr active low
; ;                sta   ACIAcmd            ; command reg 
; ;                rts                      ; done
; ;
; ; input chr from ACIA1 (waiting)
; ;
; ; syskin         lda   ACIASta            ; Serial port status             
; ;                and   #$08               ; is recvr full
; ;                beq   syskin             ; no char to get
; ;                Lda   ACIAdat            ; get chr
; ;                RTS                      ;
; syskin:
;         phx
;         phy
; @keep_reading:
;         jsr _acia_read_byte
; ; mapping here
;         cmp #('C')
;         beq @clear
;         cmp #('c')
;         beq @clear
;         cmp #('q')
;         beq @quit
;         cmp #('Q')
;         beq @quit
;         cmp #('p')
;         beq @nogo
;         cmp #('P')
;         beq @nogo
;         cmp #('f')
;         beq @go
;         cmp #('F')
;         beq @go
;         cmp #('0')
;         bcc @keep_reading
;         cmp #('9'+1)
;         bcs @keep_reading
;         sec 
;         sbc #('0')
;         bra @done
; @clear:
;         lda #('C')
;         bra @done
; @quit:
;         lda #('Q')
;         bra @done
; @nogo:
;         lda #('P')
;         bra @done
; @go:
;         lda #('F')
;         bra @done
; @done:
;         ply
;         plx
;         rts
; ;
; ; output to OutPut Port
; ;
; ; syschout       PHA                      ; save registers
; ; ACIA_Out1      lda   ACIASta            ; serial port status
; ;                and   #$10               ; is tx buffer empty
; ;                beq   ACIA_Out1          ; no
; ;                PLA                      ; get chr
; ;                sta   ACIAdat            ; put character to Port
; ;                RTS                      ; done
; syschout:
;         php
;         phx
;         phy
;         jsr _acia_write_byte
;         ply
;         plx
;         plp
;         rts

; ; syshexout      PHA                     ;  prints AA hex digits
; ;                LSR                     ;  MOVE UPPER NIBBLE TO LOWER
; ;                LSR                     ;
; ;                LSR                     ;
; ;                LSR                     ;
; ;                JSR   PrintDig          ;
; ;                PLA                     ;
; ; PrintDig       PHY                     ;  prints A hex nibble (low 4 bits)
; ;                AND   #$0F              ;
; ;                TAY                     ;
; ;                LDA   Hexdigdata,Y      ;
; ;                PLY                     ;
; ;                jmp   syschout          ;
; syshexout:
;         pha
;         phx
;         phy
;         jsr convert_to_hex
;         txa
;         jsr _acia_write_byte
;         tya
;         jsr _acia_write_byte
;         ply
;         plx
;         pla
;         rts

; Hexdigdata	.byte	"0123456789ABCDEF"
banner:		.byte	"MicroChess (c) 1996-2002 Peter Jennings, peterj@benlo.com"
		.byte	$0d, $0a, $00
cpl:		.byte	"WWWWWWWWWWWWWWWWBBBBBBBBBBBBBBBBWWWWWWWWWWWWWWWW"
cph:		.byte	"KQCCBBRRPPPPPPPPKQCCBBRRPPPPPPPP"
		.byte	$00
;
; end of added code
;
; BLOCK DATA
		; *= $1580
SETW:		.byte 	$03, $04, $00, $07, $02, $05, $01, $06
        	.byte 	$10, $17, $11, $16, $12, $15, $14, $13
        	.byte 	$73, $74, $70, $77, $72, $75, $71, $76
	 	.byte	$60, $67, $61, $66, $62, $65, $64, $63

MOVEX:   	.byte 	$00, $F0, $FF, $01, $10, $11, $0F, $EF, $F1
		.byte	$DF, $E1, $EE, $F2, $12, $0E, $1F, $21

POINTS:  	.byte 	$0B, $0A, $06, $06, $04, $04, $04, $04
		.byte 	$02, $02, $02, $02, $02, $02, $02, $02

OPNING:  	.byte 	$99, $25, $0B, $25, $01, $00, $33, $25
		.byte	$07, $36, $34, $0D, $34, $34, $0E, $52
        	.byte 	$25, $0D, $45, $35, $04, $55, $22, $06
		.byte	$43, $33, $0F, $CC

;
;
; end of file
;
        .segment "BSS"

entry_buffer:
        .res BUFFER_SIZE
tokens_pointer:
        .res 2
param_pointer:
        .res 2

        .segment "RODATA"
board_layout:
        .byte $03, $04, $00, $07, $02, $05, $01, $06
        .byte $10, $17, $11, $16, $12, $15, $14, $13
        .byte $73, $74, $70, $77, $72, $75, $71, $76
        .byte $60, $67, $61, $66, $62, $65, $64, $63

copyright_banner:
        .asciiz "MicroChess (c) 1996-2002 Peter Jennings, peterj@benlo.com"

space_string:
        .asciiz " "
double_space_string:
        .asciiz "  "
pipe_string:
        .asciiz "|"
plus_string:
        .asciiz "+"
asterisks_string:
        .asciiz "**"
column_border:
        .asciiz "+--"

chess_menu:
        menuitem board_cmd,   1, board_desc,   process_board
        menuitem reset_cmd,   1, reset_desc,   process_reset
        menuitem reverse_cmd, 1, reverse_desc, process_reverse
        menuitem move_cmd,    4, move_desc,    process_move
        menuitem go_cmd,      1, go_desc,      process_go
        endmenu 

chess_prompt:
        .asciiz "OS/1 MicroChess>"
board_cmd:
        .asciiz "BOARD"
board_desc:
        .asciiz "BOARD - draw board again"
reset_cmd:
        .asciiz "RESET"
reset_desc:
        .asciiz "RESET - restart game"
reverse_cmd:
        .asciiz "REVERSE"
reverse_desc:
        .asciiz "REVERSE - change sides"
move_cmd:
        .asciiz "MOVE"
move_desc:
        .asciiz "MOVE xx TO yy - move figure from field xx to yy"
go_cmd:
        .asciiz "GO"
go_desc:
        .asciiz "GO - let the computer decide next move"
to_token:
        .asciiz "TO"
unable_to_parse_move:
        .asciiz "Unable to parse move, check and enter again"
no_figure_on_given_field:
        .asciiz "Unable to move - there is no figure on this field"
invalid_field_id:
        .asciiz "Unable to move - invalid field identifier (should be [0-7][0-7])"
single_char_string:
        .asciiz " "