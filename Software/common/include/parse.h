#ifndef __PARSE_H
#define __PARSE_H

#define PARSE_SUCCESS 1
#define PARSE_FAILED  0

extern unsigned char __fastcall__ parse_onoff(char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_hex_byte(char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_hex_word(char token[], unsigned char buffer[]);
extern unsigned char __fastcall__ parse_dec_word(char token[], unsigned char buffer[]);

#endif