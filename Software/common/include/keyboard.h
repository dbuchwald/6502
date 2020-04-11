#ifndef __KEYBOARD_H
#define __KEYBOARD_H

#define KEYBOARD_NO_DATA_AVAILABLE 0
#define KEYBOARD_DATA_AVAILABLE    1

#define KEYBOARD_NOT_CONNECTED     0
#define KEYBOARD_CONNECTED         1

#define KEY_SPACE        0x20
#define KEY_ENTER        0x0d
#define KEY_ESCAPE       0x1b
#define KEY_BACKSPACE    0x7f
#define KEY_ARROW_UP     0x0b
#define KEY_ARROW_DOWN   0x0a
#define KEY_ARROW_LEFT   0x08
#define KEY_ARROW_RIGHT  0x15
#define KEY_TAB          0x09
#define KEY_PAGE_UP      0x19
#define KEY_PAGE_DOWN    0x1a
#define KEY_CTRL_X       0x18

extern void __fastcall__ keyboard_init(void);
extern unsigned char __fastcall__ keyboard_is_connected(void);
extern unsigned char __fastcall__ keyboard_is_data_available(void);
extern unsigned char __fastcall__ keyboard_read_char(void); 

#endif