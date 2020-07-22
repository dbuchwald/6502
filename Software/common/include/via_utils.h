#ifndef __VIA_UTILS_H
#define __VIA_UTILS_H

// Auxillary Control Register flags
#define VIA_ACR_T1_SINGLE_NO_PB7            0b00000000
#define VIA_ACR_T1_CONT_NO_PB7              0b01000000
#define VIA_ACR_T1_SINGLE_ONE_SHOT_PB7      0b10000000
#define VIA_ACR_T1_CONT_SQUARE_PB7          0b11000000

#define VIA_ACR_T2_TIMED                    0b00000000
#define VIA_ACR_T2_COUNT_PB6                0b00100000

#define VIA_ACR_SR_DISABLED                 0b00000000
#define VIA_ACR_SR_SHIFT_IN_T2              0b00000100
#define VIA_ACR_SR_SHIFT_IN_PHI2            0b00001000
#define VIA_ACR_SR_SHIFT_IN_EXT             0b00001100
#define VIA_ACR_SR_SHIFT_OUT_FREE           0b00010000
#define VIA_ACR_SR_SHIFT_OUT_T2             0b00010100
#define VIA_ACR_SR_SHIFT_OUT_PHI2           0b00011000
#define VIA_ACR_SR_SHIFT_OUT_EXT            0b00011100

#define VIA_ACR_PB_LATCH_DISABLE            0b00000000
#define VIA_ACR_PB_LATCH_ENABLE             0b00000010

#define VIA_ACR_PA_LATCH_DISABLE            0b00000000
#define VIA_ACR_PA_LATCH_ENABLE             0b00000001

// Peripheral Control Register flags
#define VIA_PCR_CA1_INTERRUPT_NEGATIVE      0b00000000
#define VIA_PCR_CA1_INTERRUPT_POSITIVE      0b00000001

#define VIA_PCR_CA2_INPUT_NEG_ACT_EDGE      0b00000000
#define VIA_PCR_CA2_IND_INPUT_NEG_ACT_EDGE  0b00000010
#define VIA_PCR_CA2_INPUT_POS_ACT_EDGE      0b00000100
#define VIA_PCR_CA2_IND_INPUT_POS_ACT_EDGE  0b00000110
#define VIA_PCR_CA2_OUTPUT_HANDSHAKE        0b00001000
#define VIA_PCR_CA2_OUTPUT_PULSE            0b00001010
#define VIA_PCR_CA2_OUTPUT_LOW              0b00001100
#define VIA_PCR_CA2_OUTPUT_HIGH             0b00001110

#define VIA_PCR_CB1_INTERRUPT_NEGATIVE      0b00000000
#define VIA_PCR_CB1_INTERRUPT_POSITIVE      0b00010000

#define VIA_PCR_CB2_INPUT_NEG_ACT_EDGE      0b00000000
#define VIA_PCR_CB2_IND_INPUT_NEG_ACT_EDGE  0b00100000
#define VIA_PCR_CB2_INPUT_POS_ACT_EDGE      0b01000000
#define VIA_PCR_CB2_IND_INPUT_POS_ACT_EDGE  0b01100000
#define VIA_PCR_CB2_OUTPUT_HANDSHAKE        0b10000000
#define VIA_PCR_CB2_OUTPUT_PULSE            0b10100000
#define VIA_PCR_CB2_OUTPUT_LOW              0b11000000
#define VIA_PCR_CB2_OUTPUT_HIGH             0b11100000

// Interrupt Flag Register flags
#define VIA_IFR_CA2_ACTIVE_EDGE             0b00000001
#define VIA_IFR_CA1_ACTIVE_EDGE             0b00000010
#define VIA_IFR_SHIFT_8_BITS                0b00000100
#define VIA_IFR_CB2_ACTIVE_EDGE             0b00001000
#define VIA_IFR_CB1_ACTIVE_EDGE             0b00010000
#define VIA_IFR_TIME_OUT_T2                 0b00100000
#define VIA_IFR_TIME_OUT_T1                 0b01000000
#define VIA_IFR_INTERRUPT                   0b10000000

// Interrupt Enable Register flags
#define VIA_IER_CLEAR_FLAGS                 0b00000000
#define VIA_IER_SET_FLAGS                   0b10000000
#define VIA_IER_TIMER1_FLAG                 0b01000000
#define VIA_IER_TIMER2_FLAG                 0b00100000
#define VIA_IER_CB1_FLAG                    0b00010000
#define VIA_IER_CB2_FLAG                    0b00001000
#define VIA_IER_SHIFT_REGISTER_FLAG         0b00000100
#define VIA_IER_CA1_FLAG                    0b00000010
#define VIA_IER_CA2_FLAG                    0b00000001

#define VIA_REGISTER_PORTB 0x00
#define VIA_REGISTER_PORTA 0x01
#define VIA_REGISTER_DDRB  0x02
#define VIA_REGISTER_DDRA  0x03
#define VIA_REGISTER_T1CL  0x04
#define VIA_REGISTER_T1CH  0x05
#define VIA_REGISTER_T1LL  0x06
#define VIA_REGISTER_T1LH  0x07
#define VIA_REGISTER_T2CL  0x08
#define VIA_REGISTER_T2CH  0x09
#define VIA_REGISTER_SR    0x0a
#define VIA_REGISTER_ACR   0x0b
#define VIA_REGISTER_PCR   0x0c
#define VIA_REGISTER_IFR   0x0d
#define VIA_REGISTER_IER   0x0e
#define VIA_REGISTER_PANH  0x0f

extern unsigned char __fastcall__ via2_get_register(const unsigned char reg);
extern void __fastcall__ via2_set_register(const unsigned char reg, const unsigned char value);

#endif
