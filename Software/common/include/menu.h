#ifndef __MENU_H
#define __MENU_H

typedef struct _menuitem
{
  unsigned char* cmd;
  unsigned char argc;
  unsigned char* desc;
  void (*function)(char tokens_buffer[]);
  unsigned char size;
} menuitem;

extern void __fastcall__ run_menu(menuitem menu[], const char prompt[]);
extern void __fastcall__ setup_menuitem(menuitem* item, const char cmd[], const unsigned char argc, 
                                        const char desc[], void (*function)(char tokens_buffer[]));

#endif