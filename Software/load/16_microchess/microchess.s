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

INIT_STATE   = $cc
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

; zeropage variables

        .zeropage
        .res 1
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
source_field: 
        .res 1
target_field: 
        .res 1
field_index:  
        .res 1
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

; Start with board init
microchess:
        lda #$00
        sta REV
        jsr reset_board

; Initialize second stack
        cld
        ldx #(SP2_TOP_PTR)
        stx SP2

; Run the chess
        jsr draw_board
        run_menu #chess_menu, #chess_prompt
        rts

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
        jsr _tty_send_newline
        writeln_tty #unable_to_parse_move
        bra @done
@invalid_field:
        writeln_tty #invalid_field_id
        bra @done
@done:
        jsr draw_board
        rts

check_field_number:
        phy
        tay
        and #$f0
        cmp #$80
        bcs @invalid
        tya
        and #$0f
        cmp #$08
        bcs @invalid
        sec
        bra @done
@invalid:
        clc
@done:
        tya
        ply
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
        lda #(INIT_STATE)
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
        ; Reverse display flags for correct move display
        sec
        lda #$77
        sbc DIS2
        sta DIS2
        sec
        lda #$77
        sbc DIS3
        sta DIS3

        lda DIS1
        cmp #$10
        bcs @reduce
        clc
        adc #$10
        sta DIS1
        bra @done
@reduce:
        sec
        sbc #$10
        sta DIS1
        bra @done
@done:
        rts

user_move:
        lda source_field
        sta DIS2
        ; find piece on this field
        jsr find_piece
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
        writeln_tty #no_piece_on_given_field
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
        jsr _tty_send_newline
        jsr draw_last_move
        jsr _tty_send_newline
        rts

draw_field:
        write_tty #pipe_string
        lda field_index
        ; check if there is any piece on it
        jsr find_piece
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
; Returns piece index in X or FF if not
find_piece:
        ldx #(BOARD_SIZE-1)
@find_piece_loop:
        cmp BOARD,x
        beq @found_match
        dex
        bpl @find_piece_loop
@found_match:
        rts

draw_last_move:
        ldx DIS1
        cpx #(INIT_STATE)
        bne @not_initial_state
        write_tty #initial_state_label
        jmp @done
; Get piece color
@not_initial_state:
        lda REV
        beq @no_reverse
        lda cpl+16,x
        bne @reverse
@no_reverse:
        lda cpl,x
@reverse:
        cmp #('B')
        beq @black
        write_tty #white_label
        bra @piece
@black:
        write_tty #black_label
@piece:
        ldx DIS1
        lda cph,x
        cmp #('K')
        bne @not_king
        write_tty #king_label
        jmp @move
@not_king:
        cmp #('Q')
        bne @not_queen
        write_tty #queen_label
        jmp @move
@not_queen:
        cmp #('C')
        bne @not_rook
        write_tty #rook_label
        jmp @move
@not_rook:
        cmp #('B')
        bne @not_bishop
        write_tty #bishop_label
        jmp @move
@not_bishop:
        cmp #('R')
        bne @not_knight
        write_tty #knight_label
        jmp @move
@not_knight:
        write_tty #pawn_label
        jmp @move
@move:
        write_tty #moved_label
        lda DIS2
        jsr _tty_write_hex
        write_tty #to_label
        lda DIS3
        jsr _tty_write_hex
        bra @done
@done:
        jsr _tty_send_newline
        rts

;---------------------------;
; ORIGINAL CODE STARTS HERE ;
;                           ;
; JUST GAME LOGIC REMAINS   ;
; UI HAS BEEN REWRITTEN     ;
;---------------------------;

;		
;       THE ROUTINE JANUS DIRECTS THE
;       ANALYSIS BY DETERMINING WHAT
;       SHOULD OCCUR AFTER EACH MOVE
;       GENERATED BY GNM
;		
;		
;
JANUS:
        ldx STATE
        bmi NOCOUNT
;		
;       THIS ROUTINE COUNTS OCCURRENCES
;       IT DEPENDS UPON STATE TO INDEX
;       THE CORRECT COUNTERS
;		
COUNTS:
        lda PIECE
        beq OVER
        cpx #$08
        bne OVER
        cmp BMAXP
        beq XRT
;
OVER:
        inc MOB,x
        cmp #$01
        bne NOQ
        inc MOB,x
;
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
;
LESS:
        clc
        php
        adc CC,x
        sta CC,x
        plp
;
NOCAP:
        cpx #$04
        beq ON4
        bmi TREE
XRT:
        rts
;		
;      GENERATE FURTHER MOVES FOR COUNT
;      AND ANALYSIS	
;		
ON4:
        lda XMAXC
        sta WCAP0
        lda #$00
        sta STATE
        jsr MOVE
        jsr REVERSE
        jsr GNMZ
        jsr REVERSE
;
        lda #$08
        sta STATE
;
        jsr UMOVE
;
        jmp STRATGY
NOCOUNT:
        cpx #$f9
        bne TREE
;		
;      DETERMINE IF THE KING CAN BE
;      TAKEN, USED BY CHKCHK
;		
        lda BK
        cmp SQUARE
        bne RETJ
        lda #$00
        sta INCHEK
RETJ:
        rts
;		
;      IF A PIECE HAS BEEN CAPTURED BY
;      A TRIAL MOVE, GENERATE REPLIES &
;      EVALUATE THE EXCHANGE GAIN/LOSS
;		
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
;		
;      GENERATE ALL MOVES FOR ONE
;      SIDE, CALL JANUS AFTER EACH
;      ONE FOR NEXT STE?
;		
;
GNMZ:
        ldx #$10
GNMX:
        lda #$00
CLEAR:
        sta COUNT,x
        dex
        bpl CLEAR
;
GNM:
        lda #$10
        sta PIECE
NEWP:
        dec PIECE
        bpl NEX
        rts
;
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
;
KING:
        jsr SNGMV
        bne KING
        beq NEWP
QUEEN:
        jsr LINE
        bne QUEEN
        beq NEWP
;
ROOK:
        ldx #$04
        stx MOVEN
AGNR:
        jsr LINE
        bne AGNR
        beq NEWP
;
BISHOP:
        jsr LINE
        lda MOVEN
        cmp #$04
        bne BISHOP
        beq NEWP
;
KNIGHT:
        ldx #$10
        stx MOVEN
AGNN:
        jsr SNGMV
        lda MOVEN
        cmp #$08
        bne AGNN
        beq NEWP
;
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
;		
;      CALCULATE SINGLE STEP MOVES
;      FOR K,N	
;		
SNGMV:
        jsr CMOVE
        bmi ILL1
        jsr JANUS
ILL1:
        jsr RESET
        dec MOVEN
        rts
;		
;     CALCULATE ALL MOVES DOWN A
;     STRAIGHT LINE FOR Q,B,R
;		
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
;		
;      EXCHANGE SIDES FOR REPLY
;      ANALYSIS	
;		
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
;		
;        CMOVE CALCULATES THE TO SQUARE
;        USING SQUARE AND THE MOVE
;       TABLE  FLAGS SET AS FOLLOWS:
;       N#NAME?	MOVE
;       V#NAME?	(LEGAL UNLESS IN CR)
;       C#NAME?	BECAUSE OF CHECK
;       [MY &THANKS TO JIM BUTTERFIELD
;        WHO WROTE THIS MORE EFFICIENT
;        VERSION OF CMOVE)
;		
CMOVE:
        lda SQUARE
        ldx MOVEN
        clc
        adc MOVEX,x
        sta SQUARE
        and #$88
        bne ILLEGAL
        lda SQUARE
;
        ldx #$20
LOOP:
        dex
        bmi NO
        cmp BOARD,x
        bne LOOP
;
        cpx #$10
        bmi ILLEGAL
;
        lda #$7f
        adc #$01
        bvs SPX
;
NO:
        clv
;
SPX:
        lda STATE
        bmi RETL
        cmp #$08
        bpl RETL
;			
;        CHKCHK REVERSES SIDES
;       AND LOOKS FOR A KING
;       CAPTURE TO INDICATE
;       ILLEGAL MOVE BECAUSE OF
;       CHECK  SINCE THIS IS
;       TIME CONSUMING, IT IS NOT
;       ALWAYS DONE	
;		
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
;
RETL:
        clc
        lda #$00
        rts
;
ILLEGAL:
        lda #$ff
        clc
        clv
        rts
;		
;       REPLACE PIECE ON CORRECT SQUARE
;		
RESET:
        ldx PIECE
        lda BOARD,x
        sta SQUARE
        rts
;
GENRM:
        jsr MOVE
GENR2:
        jsr REVERSE
        jsr GNM
RUM:
        jsr REVERSE
;		
;       ROUTINE TO UNMAKE A MOVE MADE BY
;	  MOVE
;		
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
;		
;       THIS ROUTINE MOVES PIECE
;       TO SQUARE, PARAMETERS
;       ARE SAVED IN A STACK TO UNMAKE
;       THE MOVE LATER
;		
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
;			
;       CONTINUATION OF SUB STRATGY
;       -CHECKS FOR CHECK OR CHECKMATE
;       AND ASSIGNS VALUE TO MOVE
;		
CKMATE:
        ldy BMAXC
        cpx POINTS
        bne NOCHEK
        lda #$00
        beq RETV
;
NOCHEK:
        ldx BMOB
        bne RETV
        ldx WMAXP
        bne RETV
        lda #$ff
;
RETV:
        ldx #$04
        stx STATE
;		
;       THE VALUE OF THE MOVE (IN ACCU)
;       IS COMPARED TO THE BEST MOVE AND
;       REPLACES IT IF IT IS BETTER
;		
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
;		
;       MAIN PROGRAM TO PLAY CHESS
;       PLAY FROM OPENING OR THINK
;		
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
;
END:
        lda #$ff
        sta OMOVE
NOOPEN:
        jsr _tty_send_newline
        write_tty #calculating_label
        ldx #$0c
        stx STATE
        stx BESTV
        ldx #$14
        jsr GNMX
;		
        ldx #$04
        stx STATE
        jsr GNMZ
;
;	MOVES
;		
        ldx BESTV
        cpx #$0f
        bcc MATE
;
MV2:
        ldx BESTP
        lda BOARD,x
        sta BESTV
        stx PIECE
        lda BESTM
        sta SQUARE
        jsr MOVE
        rts
;
MATE:
        lda #$ff
        rts

;		
;       THE FOLLOWING SUBROUTINE ASSIGNS
;       A VALUE TO THE MOVE UNDER
;       CONSIDERATION AND RETURNS IT IN
;	THE ACCUMULATOR
;		

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
;
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
;
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

MOVEX:  
        .byte $00, $F0, $FF, $01, $10, $11, $0F, $EF, $F1
        .byte $DF, $E1, $EE, $F2, $12, $0E, $1F, $21

POINTS:
        .byte $0B, $0A, $06, $06, $04, $04, $04, $04
		    .byte $02, $02, $02, $02, $02, $02, $02, $02

OPNING: 
        .byte $99, $25, $0B, $25, $01, $00, $33, $25
        .byte	$07, $36, $34, $0D, $34, $34, $0E, $52
        .byte $25, $0D, $45, $35, $04, $55, $22, $06
        .byte	$43, $33, $0F, $CC

cpl:    .byte "WWWWWWWWWWWWWWWWBBBBBBBBBBBBBBBBWWWWWWWWWWWWWWWW"
cph:    .byte "KQCCBBRRPPPPPPPPKQCCBBRRPPPPPPPP"
        .byte $00

black_label:
        .asciiz "Black "
white_label:
        .asciiz "White "
king_label:
        .asciiz "King "
queen_label:
        .asciiz "Queen "
knight_label:
        .asciiz "Knight "
bishop_label:
        .asciiz "Bishop "
rook_label:
        .asciiz "Rook "
pawn_label:
        .asciiz "Pawn "
moved_label:
        .asciiz "moved from "
to_label:
        .asciiz " to "
initial_state_label:
        .asciiz "Initial board state. Type HELP for list of commands."
calculating_label:
        .asciiz "Calculating next move"

copyright_banner:
        .asciiz "MicroChess (c) 1996-2002 Peter Jennings, peterj@benlo.com"

double_space_string:
        .asciiz "  "
pipe_string:
        .asciiz "|"
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
        .asciiz "MOVE xx TO yy - move piece from field xx to yy"
go_cmd:
        .asciiz "GO"
go_desc:
        .asciiz "GO - let the computer decide next move"
to_token:
        .asciiz "TO"
unable_to_parse_move:
        .asciiz "Unable to parse move, check and enter again"
no_piece_on_given_field:
        .asciiz "Unable to move - there is no piece on this field"
invalid_field_id:
        .asciiz "Unable to move - invalid field identifier (should be [0-7][0-7])"
