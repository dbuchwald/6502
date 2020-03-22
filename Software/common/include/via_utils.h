#ifndef __VIA_UTILS_H
#define __VIA_UTILS_H

extern void via1_init();
extern void via2_init();

extern void __fastcall__ via1_output_portb(char value);
extern void __fastcall__ via2_output_portb(char value);

#endif
