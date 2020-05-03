#ifndef __UTILS_H
#define __UTILS_H

extern void __fastcall__ delay_ms(const unsigned char ms);
extern void __fastcall__ delay_sec(const unsigned char sec);
extern void __fastcall__ convert_to_hex(const unsigned char c, unsigned char buffer[]);
extern void __fastcall__ convert_hex_to_dec(const unsigned char hex[], unsigned char buffer[]);

#endif