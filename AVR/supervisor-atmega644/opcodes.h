#ifndef __OPCODES_H__DEFINED
#define __OPCODES_H__DEFINED

#define ACCUMULATOR 0x00
#define ABSOLUTE    0x01
#define ABSOLUTE_X  0x02
#define ABSOLUTE_Y  0x03
#define IMMEDIATE   0x04
#define IMPLIED     0x05
#define X_INDIRECT  0x06
#define INDIRECT_Y  0x07
#define RELATIVE    0x08
#define ZEROPAGE    0x09
#define ZEROPAGE_X  0x0a
#define ZEROPAGE_Y  0x0b
#define ZEROPAGE_R  0x0c
#define ZEROPAGE_I  0x0d
#define INDIRECT    0x0e
#define INDIRECT_X  0x0f

void getOpcodeText(char* buffer, const uint8_t opcode);

uint8_t getAddressMode(const uint8_t opcode);

uint8_t getOpcodeBytes(const uint8_t opcode);

#endif /* __OPCODES_H__DEFINED */