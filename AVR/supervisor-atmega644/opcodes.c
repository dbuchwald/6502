#include <stdint.h>
#include "opcodes.h"

const char ADC_OP[] = "adc";
const char AND_OP[] = "and";
const char ASL_OP[] = "asl";
const char BCC_OP[] = "bcc";
const char BCS_OP[] = "bcs";
const char BEQ_OP[] = "beq";
const char BIT_OP[] = "bit";
const char BMI_OP[] = "bmi";
const char BNE_OP[] = "bne";
const char BPL_OP[] = "bpl";
const char BRA_OP[] = "bra";
const char BRK_OP[] = "brk";
const char BVC_OP[] = "bvc";
const char BVS_OP[] = "bvs";
const char CLC_OP[] = "clc";
const char CLD_OP[] = "cld";
const char CLI_OP[] = "cli";
const char CLV_OP[] = "clv";
const char CMP_OP[] = "cmp";
const char CPX_OP[] = "cpx";
const char CPY_OP[] = "cpy";
const char DEC_OP[] = "dec";
const char DEX_OP[] = "dex";
const char DEY_OP[] = "dey";
const char EOR_OP[] = "eor";
const char INC_OP[] = "inc";
const char INX_OP[] = "inx";
const char INY_OP[] = "iny";
const char JMP_OP[] = "jmp";
const char JSR_OP[] = "jsr";
const char LDA_OP[] = "lda";
const char LDX_OP[] = "ldx";
const char LDY_OP[] = "ldy";
const char LSR_OP[] = "lsr";
const char NOP_OP[] = "nop";
const char ORA_OP[] = "ora";
const char PHA_OP[] = "pha";
const char PHP_OP[] = "php";
const char PHX_OP[] = "phx";
const char PHY_OP[] = "phy";
const char PLA_OP[] = "pla";
const char PLP_OP[] = "plp";
const char PLX_OP[] = "plx";
const char PLY_OP[] = "ply";
const char ROL_OP[] = "rol";
const char ROR_OP[] = "ror";
const char RTI_OP[] = "rti";
const char RTS_OP[] = "rts";
const char SBC_OP[] = "sbc";
const char SEC_OP[] = "sec";
const char SED_OP[] = "sed";
const char SEI_OP[] = "sei";
const char STA_OP[] = "sta";
const char STP_OP[] = "stp";
const char STX_OP[] = "stx";
const char STY_OP[] = "sty";
const char STZ_OP[] = "stz";
const char TAX_OP[] = "tax";
const char TAY_OP[] = "tay";
const char TRB_OP[] = "trb";
const char TSB_OP[] = "tsb";
const char TSX_OP[] = "tsx";
const char TXA_OP[] = "txa";
const char TXS_OP[] = "txs";
const char TYA_OP[] = "tya";
const char WAI_OP[] = "wai";
const char RMB0_OP[] = "rmb0";
const char RMB1_OP[] = "rmb1";
const char RMB2_OP[] = "rmb2";
const char RMB3_OP[] = "rmb3";
const char RMB4_OP[] = "rmb4";
const char RMB5_OP[] = "rmb5";
const char RMB6_OP[] = "rmb6";
const char RMB7_OP[] = "rmb7";
const char SMB0_OP[] = "smb0";
const char SMB1_OP[] = "smb1";
const char SMB2_OP[] = "smb2";
const char SMB3_OP[] = "smb3";
const char SMB4_OP[] = "smb4";
const char SMB5_OP[] = "smb5";
const char SMB6_OP[] = "smb6";
const char SMB7_OP[] = "smb7";
const char BBR0_OP[] = "bbr0";
const char BBR1_OP[] = "bbr1";
const char BBR2_OP[] = "bbr2";
const char BBR3_OP[] = "bbr3";
const char BBR4_OP[] = "bbr4";
const char BBR5_OP[] = "bbr5";
const char BBR6_OP[] = "bbr6";
const char BBR7_OP[] = "bbr7";
const char BBS0_OP[] = "bbs0";
const char BBS1_OP[] = "bbs1";
const char BBS2_OP[] = "bbs2";
const char BBS3_OP[] = "bbs3";
const char BBS4_OP[] = "bbs4";
const char BBS5_OP[] = "bbs5";
const char BBS6_OP[] = "bbs6";
const char BBS7_OP[] = "bbs7";

const char* opcodes[] = {
  BRK_OP, ORA_OP, NOP_OP, NOP_OP, TSB_OP, ORA_OP, ASL_OP, RMB0_OP, PHP_OP, ORA_OP, ASL_OP, NOP_OP, TSB_OP, ORA_OP, ASL_OP, BBR0_OP,
  BPL_OP, ORA_OP, ORA_OP, NOP_OP, TRB_OP, ORA_OP, ASL_OP, RMB1_OP, CLC_OP, ORA_OP, INC_OP, NOP_OP, TRB_OP, ORA_OP, ASL_OP, BBR1_OP,
  JSR_OP, AND_OP, NOP_OP, NOP_OP, BIT_OP, AND_OP, ROL_OP, RMB2_OP, PLP_OP, AND_OP, ROL_OP, NOP_OP, BIT_OP, AND_OP, ROL_OP, BBR2_OP,
  BMI_OP, AND_OP, AND_OP, NOP_OP, BIT_OP, AND_OP, ROL_OP, RMB3_OP, SEC_OP, AND_OP, DEC_OP, NOP_OP, BIT_OP, AND_OP, ROL_OP, BBR3_OP,
  RTI_OP, EOR_OP, NOP_OP, NOP_OP, NOP_OP, EOR_OP, LSR_OP, RMB4_OP, PHA_OP, EOR_OP, LSR_OP, NOP_OP, JMP_OP, EOR_OP, LSR_OP, BBR4_OP,
  BVC_OP, EOR_OP, EOR_OP, NOP_OP, NOP_OP, EOR_OP, LSR_OP, RMB5_OP, CLI_OP, EOR_OP, PHY_OP, NOP_OP, NOP_OP, EOR_OP, LSR_OP, BBR5_OP,
  RTS_OP, ADC_OP, NOP_OP, NOP_OP, STZ_OP, ADC_OP, ROR_OP, RMB6_OP, PLA_OP, ADC_OP, ROR_OP, NOP_OP, JMP_OP, ADC_OP, ROR_OP, BBR6_OP,
  BVS_OP, ADC_OP, ADC_OP, NOP_OP, STZ_OP, ADC_OP, ROR_OP, RMB7_OP, SEI_OP, ADC_OP, PLY_OP, NOP_OP, JMP_OP, ADC_OP, ROR_OP, BBR7_OP,
  BRA_OP, STA_OP, NOP_OP, NOP_OP, STY_OP, STA_OP, STX_OP, SMB0_OP, DEY_OP, BIT_OP, TXA_OP, NOP_OP, STY_OP, STA_OP, STX_OP, BBS0_OP,
  BCC_OP, STA_OP, STA_OP, NOP_OP, STY_OP, STA_OP, STX_OP, SMB1_OP, TYA_OP, STA_OP, TXS_OP, NOP_OP, STZ_OP, STA_OP, STZ_OP, BBS1_OP,
  LDY_OP, LDA_OP, LDX_OP, NOP_OP, LDY_OP, LDA_OP, LDX_OP, SMB2_OP, TAY_OP, LDA_OP, TAX_OP, NOP_OP, LDY_OP, LDA_OP, LDX_OP, BBS2_OP,
  BCS_OP, LDA_OP, LDA_OP, NOP_OP, LDY_OP, LDA_OP, LDX_OP, SMB3_OP, CLV_OP, LDA_OP, TSX_OP, NOP_OP, LDY_OP, LDA_OP, LDX_OP, BBS3_OP,
  CPY_OP, CMP_OP, NOP_OP, NOP_OP, CPY_OP, CMP_OP, DEC_OP, SMB4_OP, INY_OP, CMP_OP, DEX_OP, WAI_OP, CPY_OP, CMP_OP, DEC_OP, BBS4_OP,
  BNE_OP, CMP_OP, CMP_OP, NOP_OP, NOP_OP, CMP_OP, DEC_OP, SMB5_OP, CLD_OP, CMP_OP, PHX_OP, STP_OP, NOP_OP, CMP_OP, DEC_OP, BBS5_OP,
  CPX_OP, SBC_OP, NOP_OP, NOP_OP, CPX_OP, SBC_OP, INC_OP, SMB6_OP, INX_OP, SBC_OP, NOP_OP, NOP_OP, CPX_OP, SBC_OP, INC_OP, BBS6_OP,
  BEQ_OP, SBC_OP, SBC_OP, NOP_OP, NOP_OP, SBC_OP, INC_OP, SMB7_OP, SED_OP, SBC_OP, PLX_OP, NOP_OP, NOP_OP, SBC_OP, INC_OP, BBS7_OP
};

const uint8_t addressModes[] = {
  IMPLIED, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, ACCUMULATOR, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, ACCUMULATOR, IMPLIED, ABSOLUTE, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  ABSOLUTE, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, ACCUMULATOR, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, ACCUMULATOR, IMPLIED, ABSOLUTE_X, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  IMPLIED, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, ACCUMULATOR, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  IMPLIED, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, ACCUMULATOR, IMPLIED, INDIRECT, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, X_INDIRECT, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, INDIRECT_X, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  RELATIVE, ZEROPAGE_I, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_Y, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  IMMEDIATE, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_Y, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, ABSOLUTE_X, ABSOLUTE_X, ABSOLUTE_Y, ZEROPAGE_R,
  IMMEDIATE, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R,
  IMMEDIATE, X_INDIRECT, IMMEDIATE, IMPLIED, ZEROPAGE, ZEROPAGE, ZEROPAGE, ZEROPAGE, IMPLIED, IMMEDIATE, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE, ABSOLUTE, ZEROPAGE_R,
  RELATIVE, INDIRECT_Y, ZEROPAGE_I, IMPLIED, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE_X, ZEROPAGE, IMPLIED, ABSOLUTE_Y, IMPLIED, IMPLIED, ABSOLUTE, ABSOLUTE_X, ABSOLUTE_X, ZEROPAGE_R
};

// how many bytes per instruction (aggregated by addressModes)
const unsigned char modeBytes[] = {
  0, 2, 2, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2
};

const char* getOpcodeText(const uint8_t opcode) {
  return opcodes[opcode];
}

uint8_t getAddressMode(const uint8_t opcode) {
  return addressModes[opcode];
}

uint8_t getOpcodeBytes(const uint8_t opcode) {
  return modeBytes[addressModes[opcode]];
}

