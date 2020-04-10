#ifndef __ACIA_H
#define __ACIA_H

#define ACIA_DATA_AVAILABLE    1
#define ACIA_NO_DATA_AVAILABLE 0

extern void __fastcall__ acia_init(void);
extern unsigned char __fastcall__ acia_is_data_available(void);
extern unsigned char __fastcall__ acia_read_byte(void);
extern void __fastcall__ acia_write_byte(const unsigned char c);
extern void __fastcall__ acia_write_string(const unsigned char string[]);

#endif