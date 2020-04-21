#ifndef __TTY_H
#define __TTY_H

extern void __fastcall__ tty_init(const unsigned char mode);
extern void __fastcall__ tty_write(const unsigned char string[]);
extern void __fastcall__ tty_writeln(const unsigned char string[]);
extern void __fastcall__ tty_write_hex(const unsigned char c);
extern void __fastcall__ tty_send_newline(void);
extern void __fastcall__ tty_read_line(unsigned char buffer[], const unsigned char size);
extern void __fastcall__ tty_send_character(const unsigned char c);

#endif