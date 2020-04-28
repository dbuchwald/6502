#ifndef __PARSE_H
#define __PARSE_H

#define PARSE_SUCCESS 1
#define PARSE_FAILED  0

extern unsigned char __fastcall__ parse_onoff(unsigned char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_hex_byte(unsigned char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_hex_word(unsigned char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_dec_word(unsigned char token[], unsigned char buffer[]);

#endif