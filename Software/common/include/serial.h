#ifndef __SERIAL_H
#define __SERIAL_H

#define SERIAL_DATA_AVAILABLE    1
#define SERIAL_NO_DATA_AVAILABLE 0

extern void __fastcall__ serial_init(const unsigned char channel);
extern unsigned char __fastcall__ serial_is_data_available(const unsigned char channel);
extern unsigned char __fastcall__ serial_read_byte(const unsigned char channel);
extern void __fastcall__ serial_write_byte(const unsigned char channel, const unsigned char c);
extern void __fastcall__ serial_write_string(const unsigned char channel, const unsigned char string[]);

#endif