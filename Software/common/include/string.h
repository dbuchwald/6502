#ifndef __STRING_H
#define __STRING_H

extern void __fastcall__ strcopy(const unsigned char input[], unsigned char output[]);
extern unsigned char __fastcall__ strcompare(const unsigned char string1[], const unsigned char string2[]);
extern unsigned char __fastcall__ strlength(const unsigned char string[]);
extern void __fastcall__ strtoupper(unsigned char string[]);
extern void __fastcall__ strtolower(unsigned char string[]);
extern void __fastcall__ strtriml(unsigned char string[]);
extern void __fastcall__ strtrimr(unsigned char string[]);
extern unsigned char __fastcall__ strtokenize(const unsigned char string[], unsigned char buffer[]);
extern unsigned char* __fastcall__ strgettoken(const unsigned char tokens_buffer[], unsigned char n);

#endif __STRING_H