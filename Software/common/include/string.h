#ifndef __STRING_H
#define __STRING_H

extern void __fastcall__ strcopy(const char input[], char output[]);
extern unsigned char __fastcall__ strcompare(const char string1[], const char string2[]);
extern unsigned char __fastcall__ strlength(const char string[]);
extern void __fastcall__ strtoupper(char string[]);
extern void __fastcall__ strtolower(char string[]);
extern void __fastcall__ strtriml(char string[]);
extern void __fastcall__ strtrimr(char string[]);
extern unsigned char __fastcall__ strtokenize(const char string[], unsigned char buffer[]);
extern char* __fastcall__ strgettoken(const char tokens_buffer[], unsigned char n);

#endif __STRING_H