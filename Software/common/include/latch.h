#ifndef __LATCH_H
#define __LATCH_H

#define LQ0_FLAG   0b00000001
#define LQ1_FLAG   0b00000010
#define LQ2_FLAG   0b00000100
#define LQ3_FLAG   0b00001000
#define LQ4_FLAG   0b00010000
#define LQ5_FLAG   0b00100000
#define LQ6_FLAG   0b01000000
#define EXRAM_FLAG 0b10000000

extern void __fastcall__ latch_init(void);
extern void __fastcall__ latch_write(unsigned char value, unsigned char mask);
extern void __fastcall__ latch_set(unsigned char mask);
extern void __fastcall__ latch_reset(unsigned char mask);
extern unsigned char __fastcall__ latch_get(void);

#endif
