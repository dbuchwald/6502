        .setcpu "65C02"

        .export opcodes_matrix

ACCUMULATOR = $01
ABSOLUTE    = $02
ABSOLUTE_X  = $03
ABSOLUTE_Y  = $04
IMMEDIATE   = $05
IMPLIED     = $06
X_INDIRECT  = $07
INDIRECT_Y  = $08
RELATIVE    = $09
ZEROPAGE    = $0a
ZEROPAGE_X  = $0b
ZEROPAGE_Y  = $0c
ZEROPAGE_R  = $0d
ZEROPAGE_I  = $0e
INDIRECT    = $0f
INDIRECT_X  = $10

        .macro opcode hex, opcode, address_mode
        .word opcode
        .byte address_mode
        .endmacro

        .segment "RODATA"

ADC_OP: .asciiz "ADC"
AND_OP: .asciiz "AND"
ASL_OP: .asciiz "ASL"
BCC_OP: .asciiz "BCC"
BCS_OP: .asciiz "BCS"
BEQ_OP: .asciiz "BEQ"
BIT_OP: .asciiz "BIT"
BMI_OP: .asciiz "BMI"
BNE_OP: .asciiz "BNE"
BPL_OP: .asciiz "BPL"
BRA_OP: .asciiz "BRA"
BRK_OP: .asciiz "BRK"
BVC_OP: .asciiz "BVC"
BVS_OP: .asciiz "BVS"
CLC_OP: .asciiz "CLC"
CLD_OP: .asciiz "CLD"
CLI_OP: .asciiz "CLI"
CLV_OP: .asciiz "CLV"
CMP_OP: .asciiz "CMP"
CPX_OP: .asciiz "CPX"
CPY_OP: .asciiz "CPY"
DEC_OP: .asciiz "DEC"
DEX_OP: .asciiz "DEX"
DEY_OP: .asciiz "DEY"
EOR_OP: .asciiz "EOR"
INC_OP: .asciiz "INC"
INX_OP: .asciiz "INX"
INY_OP: .asciiz "INY"
JMP_OP: .asciiz "JMP"
JSR_OP: .asciiz "JSR"
LDA_OP: .asciiz "LDA"
LDX_OP: .asciiz "LDX"
LDY_OP: .asciiz "LDY"
LSR_OP: .asciiz "LSR"
NOP_OP: .asciiz "NOP"
ORA_OP: .asciiz "ORA"
PHA_OP: .asciiz "PHA"
PHP_OP: .asciiz "PHP"
PHX_OP: .asciiz "PHX"
PHY_OP: .asciiz "PHY"
PLA_OP: .asciiz "PLA"
PLP_OP: .asciiz "PLP"
PLX_OP: .asciiz "PLX"
PLY_OP: .asciiz "PLY"
ROL_OP: .asciiz "ROL"
ROR_OP: .asciiz "ROR"
RTI_OP: .asciiz "RTI"
RTS_OP: .asciiz "RTS"
SBC_OP: .asciiz "SBC"
SEC_OP: .asciiz "SEC"
SED_OP: .asciiz "SED"
SEI_OP: .asciiz "SEI"
STA_OP: .asciiz "STA"
STP_OP: .asciiz "STP"
STX_OP: .asciiz "STX"
STY_OP: .asciiz "STY"
STZ_OP: .asciiz "STZ"
TAX_OP: .asciiz "TAX"
TAY_OP: .asciiz "TAY"
TRB_OP: .asciiz "TRB"
TSB_OP: .asciiz "TSB"
TSX_OP: .asciiz "TSX"
TXA_OP: .asciiz "TXA"
TXS_OP: .asciiz "TXS"
TYA_OP: .asciiz "TYA"
WAI_OP: .asciiz "WAI"
RMB0_OP: .asciiz "RMB0"
RMB1_OP: .asciiz "RMB1"
RMB2_OP: .asciiz "RMB2"
RMB3_OP: .asciiz "RMB3"
RMB4_OP: .asciiz "RMB4"
RMB5_OP: .asciiz "RMB5"
RMB6_OP: .asciiz "RMB6"
RMB7_OP: .asciiz "RMB7"
SMB0_OP: .asciiz "SMB0"
SMB1_OP: .asciiz "SMB1"
SMB2_OP: .asciiz "SMB2"
SMB3_OP: .asciiz "SMB3"
SMB4_OP: .asciiz "SMB4"
SMB5_OP: .asciiz "SMB5"
SMB6_OP: .asciiz "SMB6"
SMB7_OP: .asciiz "SMB7"
BBR0_OP: .asciiz "BBR0"
BBR1_OP: .asciiz "BBR1"
BBR2_OP: .asciiz "BBR2"
BBR3_OP: .asciiz "BBR3"
BBR4_OP: .asciiz "BBR4"
BBR5_OP: .asciiz "BBR5"
BBR6_OP: .asciiz "BBR6"
BBR7_OP: .asciiz "BBR7"
BBS0_OP: .asciiz "BBS0"
BBS1_OP: .asciiz "BBS1"
BBS2_OP: .asciiz "BBS2"
BBS3_OP: .asciiz "BBS3"
BBS4_OP: .asciiz "BBS4"
BBS5_OP: .asciiz "BBS5"
BBS6_OP: .asciiz "BBS6"
BBS7_OP: .asciiz "BBS7"

opcodes_matrix:
        opcode $00, BRK_OP,  IMPLIED
        opcode $01, ORA_OP,  X_INDIRECT
        opcode $02, NOP_OP,  IMMEDIATE
        opcode $03, NOP_OP,  IMPLIED
        opcode $04, TSB_OP,  ZEROPAGE
        opcode $05, ORA_OP,  ZEROPAGE
        opcode $06, ASL_OP,  ZEROPAGE
        opcode $07, RMB0_OP, ZEROPAGE
        opcode $08, PHP_OP,  IMPLIED
        opcode $09, ORA_OP,  IMMEDIATE
        opcode $0a, ASL_OP,  ACCUMULATOR
        opcode $0b, NOP_OP,  IMPLIED
        opcode $0c, TSB_OP,  ABSOLUTE
        opcode $0d, ORA_OP,  ABSOLUTE
        opcode $0e, ASL_OP,  ABSOLUTE
        opcode $0f, BBR0_OP, ZEROPAGE_R

        opcode $10, BPL_OP,  RELATIVE
        opcode $11, ORA_OP,  INDIRECT_Y
        opcode $12, ORA_OP,  ZEROPAGE_I
        opcode $13, NOP_OP,  IMPLIED
        opcode $14, TRB_OP,  ZEROPAGE
        opcode $15, ORA_OP,  ZEROPAGE_X
        opcode $16, ASL_OP,  ZEROPAGE_X
        opcode $17, RMB1_OP, ZEROPAGE
        opcode $18, CLC_OP,  IMPLIED
        opcode $19, ORA_OP,  ABSOLUTE_Y
        opcode $1a, INC_OP,  ACCUMULATOR
        opcode $1b, NOP_OP,  IMPLIED
        opcode $1c, TRB_OP,  ABSOLUTE
        opcode $1d, ORA_OP,  ABSOLUTE_X
        opcode $1e, ASL_OP,  ABSOLUTE_X
        opcode $1f, BBR1_OP, ZEROPAGE_R

        opcode $20, JSR_OP,  ABSOLUTE
        opcode $21, AND_OP,  X_INDIRECT
        opcode $22, NOP_OP,  IMMEDIATE
        opcode $23, NOP_OP,  IMPLIED
        opcode $24, BIT_OP,  ZEROPAGE
        opcode $25, AND_OP,  ZEROPAGE
        opcode $26, ROL_OP,  ZEROPAGE
        opcode $27, RMB2_OP, ZEROPAGE
        opcode $28, PLP_OP,  IMPLIED
        opcode $29, AND_OP,  IMMEDIATE
        opcode $2a, ROL_OP,  ACCUMULATOR
        opcode $2b, NOP_OP,  IMPLIED
        opcode $2c, BIT_OP,  ABSOLUTE
        opcode $2d, AND_OP,  ABSOLUTE
        opcode $2e, ROL_OP,  ABSOLUTE
        opcode $2f, BBR2_OP, ZEROPAGE_R

        opcode $30, BMI_OP,  RELATIVE
        opcode $31, AND_OP,  INDIRECT_Y
        opcode $32, AND_OP,  ZEROPAGE_I
        opcode $33, NOP_OP,  IMPLIED
        opcode $34, BIT_OP,  ZEROPAGE_X
        opcode $35, AND_OP,  ZEROPAGE_X
        opcode $36, ROL_OP,  ZEROPAGE_X
        opcode $37, RMB3_OP, ZEROPAGE
        opcode $38, SEC_OP,  IMPLIED
        opcode $39, AND_OP,  ABSOLUTE_Y
        opcode $3a, DEC_OP,  ACCUMULATOR
        opcode $3b, NOP_OP,  IMPLIED
        opcode $3c, BIT_OP,  ABSOLUTE_X
        opcode $3d, AND_OP,  ABSOLUTE_X
        opcode $3e, ROL_OP,  ABSOLUTE_X
        opcode $3f, BBR3_OP, ZEROPAGE_R

        opcode $40, RTI_OP,  IMPLIED
        opcode $41, EOR_OP,  X_INDIRECT
        opcode $42, NOP_OP,  IMMEDIATE
        opcode $43, NOP_OP,  IMPLIED
        opcode $44, NOP_OP,  ZEROPAGE
        opcode $45, EOR_OP,  ZEROPAGE
        opcode $46, LSR_OP,  ZEROPAGE
        opcode $47, RMB4_OP, ZEROPAGE
        opcode $48, PHA_OP,  IMPLIED
        opcode $49, EOR_OP,  IMMEDIATE
        opcode $4a, LSR_OP,  ACCUMULATOR
        opcode $4b, NOP_OP,  IMPLIED
        opcode $4c, JMP_OP,  ABSOLUTE
        opcode $4d, EOR_OP,  ABSOLUTE
        opcode $4e, LSR_OP,  ABSOLUTE
        opcode $4f, BBR4_OP, ZEROPAGE_R

        opcode $50, BVC_OP,  RELATIVE
        opcode $51, EOR_OP,  INDIRECT_Y
        opcode $52, EOR_OP,  ZEROPAGE_I
        opcode $53, NOP_OP,  IMPLIED
        opcode $54, NOP_OP,  ZEROPAGE_X
        opcode $55, EOR_OP,  ZEROPAGE_X
        opcode $56, LSR_OP,  ZEROPAGE_X
        opcode $57, RMB5_OP, ZEROPAGE
        opcode $58, CLI_OP,  IMPLIED
        opcode $59, EOR_OP,  ABSOLUTE_Y
        opcode $5a, PHY_OP,  IMPLIED
        opcode $5b, NOP_OP,  IMPLIED
        opcode $5c, NOP_OP,  ABSOLUTE
        opcode $5d, EOR_OP,  ABSOLUTE_X
        opcode $5e, LSR_OP,  ABSOLUTE_X
        opcode $5f, BBR5_OP, ZEROPAGE_R

        opcode $60, RTS_OP,  IMPLIED
        opcode $61, ADC_OP,  X_INDIRECT
        opcode $62, NOP_OP,  IMMEDIATE
        opcode $63, NOP_OP,  IMPLIED
        opcode $64, STZ_OP,  ZEROPAGE
        opcode $65, ADC_OP,  ZEROPAGE
        opcode $66, ROR_OP,  ZEROPAGE
        opcode $67, RMB6_OP, ZEROPAGE
        opcode $68, PLA_OP,  IMPLIED
        opcode $69, ADC_OP,  IMMEDIATE
        opcode $6a, ROR_OP,  ACCUMULATOR
        opcode $6b, NOP_OP,  IMPLIED
        opcode $6c, JMP_OP,  INDIRECT
        opcode $6d, ADC_OP,  ABSOLUTE
        opcode $6e, ROR_OP,  ABSOLUTE
        opcode $6f, BBR6_OP, ZEROPAGE_R

        opcode $70, BVS_OP,  RELATIVE
        opcode $71, ADC_OP,  X_INDIRECT
        opcode $72, ADC_OP,  ZEROPAGE_I
        opcode $73, NOP_OP,  IMPLIED
        opcode $74, STZ_OP,  ZEROPAGE_X
        opcode $75, ADC_OP,  ZEROPAGE_X
        opcode $76, ROR_OP,  ZEROPAGE_X
        opcode $77, RMB7_OP, ZEROPAGE
        opcode $78, SEI_OP,  IMPLIED
        opcode $79, ADC_OP,  ABSOLUTE_Y
        opcode $7a, PLY_OP,  IMPLIED
        opcode $7b, NOP_OP,  IMPLIED
        opcode $7c, JMP_OP,  INDIRECT_X
        opcode $7d, ADC_OP,  ABSOLUTE_X
        opcode $7e, ROR_OP,  ABSOLUTE_X
        opcode $7f, BBR7_OP, ZEROPAGE_R

        opcode $80, BRA_OP,  RELATIVE
        opcode $81, STA_OP,  ZEROPAGE_I
        opcode $82, NOP_OP,  IMMEDIATE
        opcode $83, NOP_OP,  IMPLIED
        opcode $84, STY_OP,  ZEROPAGE
        opcode $85, STA_OP,  ZEROPAGE
        opcode $86, STX_OP,  ZEROPAGE
        opcode $87, SMB0_OP, ZEROPAGE
        opcode $88, DEY_OP,  IMPLIED
        opcode $89, BIT_OP,  IMMEDIATE
        opcode $8a, TXA_OP,  IMPLIED
        opcode $8b, NOP_OP,  IMPLIED
        opcode $8c, STY_OP,  ABSOLUTE
        opcode $8d, STA_OP,  ABSOLUTE
        opcode $8e, STX_OP,  ABSOLUTE
        opcode $8f, BBS0_OP, ZEROPAGE_R

        opcode $90, BCC_OP,  RELATIVE
        opcode $91, STA_OP,  INDIRECT_Y
        opcode $92, STA_OP,  ZEROPAGE_I
        opcode $93, NOP_OP,  IMPLIED
        opcode $94, STY_OP,  ZEROPAGE_X
        opcode $95, STA_OP,  ZEROPAGE_X
        opcode $96, STX_OP,  ZEROPAGE_Y
        opcode $97, SMB1_OP, ZEROPAGE
        opcode $98, TYA_OP,  IMPLIED
        opcode $99, STA_OP,  ABSOLUTE_Y
        opcode $9a, TXS_OP,  IMPLIED
        opcode $9b, NOP_OP,  IMPLIED
        opcode $9c, STZ_OP,  ABSOLUTE
        opcode $9d, STA_OP,  ABSOLUTE_X
        opcode $9e, STZ_OP,  ABSOLUTE_X
        opcode $9f, BBS1_OP, ZEROPAGE_R

        opcode $a0, LDY_OP,  IMMEDIATE
        opcode $a1, LDA_OP,  X_INDIRECT
        opcode $a2, LDX_OP,  IMMEDIATE
        opcode $a3, NOP_OP,  IMPLIED
        opcode $a4, LDY_OP,  ZEROPAGE
        opcode $a5, LDA_OP,  ZEROPAGE
        opcode $a6, LDX_OP,  ZEROPAGE
        opcode $a7, SMB2_OP, ZEROPAGE
        opcode $a8, TAY_OP,  IMPLIED
        opcode $a9, LDA_OP,  IMMEDIATE
        opcode $aa, TAX_OP,  IMPLIED
        opcode $ab, NOP_OP,  IMPLIED
        opcode $ac, LDY_OP,  ABSOLUTE
        opcode $ad, LDA_OP,  ABSOLUTE
        opcode $ae, LDX_OP,  ABSOLUTE
        opcode $af, BBS2_OP, ZEROPAGE_R

        opcode $b0, BCS_OP,  RELATIVE
        opcode $b1, LDA_OP,  INDIRECT_Y
        opcode $b2, LDA_OP,  ZEROPAGE_I
        opcode $b3, NOP_OP,  IMPLIED
        opcode $b4, LDY_OP,  ZEROPAGE_X
        opcode $b5, LDA_OP,  ZEROPAGE_X
        opcode $b6, LDX_OP,  ZEROPAGE_Y
        opcode $b7, SMB3_OP, ZEROPAGE
        opcode $b8, CLV_OP,  IMPLIED
        opcode $b9, LDA_OP,  ABSOLUTE_Y
        opcode $ba, TSX_OP,  IMPLIED
        opcode $bb, NOP_OP,  IMPLIED
        opcode $bc, LDY_OP,  ABSOLUTE_X
        opcode $bd, LDA_OP,  ABSOLUTE_X
        opcode $be, LDX_OP,  ABSOLUTE_Y
        opcode $bf, BBS3_OP, ZEROPAGE_R

        opcode $c0, CPY_OP,  IMMEDIATE
        opcode $c1, CMP_OP,  X_INDIRECT
        opcode $c2, NOP_OP,  IMMEDIATE
        opcode $c3, NOP_OP,  IMPLIED
        opcode $c4, CPY_OP,  ZEROPAGE
        opcode $c5, CMP_OP,  ZEROPAGE
        opcode $c6, DEC_OP,  ZEROPAGE
        opcode $c7, SMB4_OP, ZEROPAGE
        opcode $c8, INY_OP,  IMPLIED
        opcode $c9, CMP_OP,  IMMEDIATE
        opcode $ca, DEX_OP,  IMPLIED
        opcode $cb, WAI_OP,  IMPLIED
        opcode $cc, CPY_OP,  ABSOLUTE
        opcode $cd, CMP_OP,  ABSOLUTE
        opcode $ce, DEC_OP,  ABSOLUTE
        opcode $cf, BBS4_OP, ZEROPAGE_R

        opcode $d0, BNE_OP,  RELATIVE
        opcode $d1, CMP_OP,  INDIRECT_Y
        opcode $d2, CMP_OP,  ZEROPAGE_I
        opcode $d3, NOP_OP,  IMPLIED
        opcode $d4, NOP_OP,  ZEROPAGE_X
        opcode $d5, CMP_OP,  ZEROPAGE_X
        opcode $d6, DEC_OP,  ZEROPAGE_X
        opcode $d7, SMB5_OP, ZEROPAGE
        opcode $d8, CLD_OP,  IMPLIED
        opcode $d9, CMP_OP,  ABSOLUTE_Y
        opcode $da, PHX_OP,  IMPLIED
        opcode $db, STP_OP,  IMPLIED
        opcode $dc, NOP_OP,  ABSOLUTE
        opcode $dd, CMP_OP,  ABSOLUTE_X
        opcode $de, DEC_OP,  ABSOLUTE_X
        opcode $df, BBS5_OP, ZEROPAGE_R

        opcode $e0, CPX_OP,  IMMEDIATE
        opcode $e1, SBC_OP,  X_INDIRECT
        opcode $e2, NOP_OP,  IMMEDIATE
        opcode $e3, NOP_OP,  IMPLIED
        opcode $e4, CPX_OP,  ZEROPAGE
        opcode $e5, SBC_OP,  ZEROPAGE
        opcode $e6, INC_OP,  ZEROPAGE
        opcode $e7, SMB6_OP, ZEROPAGE
        opcode $e8, INX_OP,  IMPLIED
        opcode $e9, SBC_OP,  IMMEDIATE
        opcode $ea, NOP_OP,  IMPLIED
        opcode $eb, NOP_OP,  IMPLIED
        opcode $ec, CPX_OP,  ABSOLUTE
        opcode $ed, SBC_OP,  ABSOLUTE
        opcode $ee, INC_OP,  ABSOLUTE
        opcode $ef, BBS6_OP, ZEROPAGE_R

        opcode $f0, BEQ_OP,  RELATIVE
        opcode $f1, SBC_OP,  INDIRECT_Y
        opcode $f2, SBC_OP,  ZEROPAGE_I
        opcode $f3, NOP_OP,  IMPLIED
        opcode $f4, NOP_OP,  ZEROPAGE_X
        opcode $f5, SBC_OP,  ZEROPAGE_X
        opcode $f6, INC_OP,  ZEROPAGE_X
        opcode $f7, SMB7_OP, ZEROPAGE
        opcode $f8, SED_OP,  IMPLIED
        opcode $f9, SBC_OP,  ABSOLUTE_Y
        opcode $fa, PLX_OP,  IMPLIED
        opcode $fb, NOP_OP,  IMPLIED
        opcode $fc, NOP_OP,  ABSOLUTE
        opcode $fd, SBC_OP,  ABSOLUTE_X
        opcode $fe, INC_OP,  ABSOLUTE_X
        opcode $ff, BBS7_OP, ZEROPAGE_R







