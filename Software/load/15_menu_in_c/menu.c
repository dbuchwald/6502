#include "utils.h"
#include "menu.h"
#include "tty.h"

static menuitem menu[2];

void process_cmenu(unsigned char tokens_buffer[]) {
  tty_writeln("Menu item activated!");
}

void main(void) {
  menu[0].cmd="CMENU";
  menu[0].argc=1;
  menu[0].desc="CMENU - Sample C Menu entry";
  menu[0].function=&process_cmenu;
  menu[0].size = sizeof(menu[0]);
  menu[1].cmd=0x000;

  run_menu(menu, "OS/1 C Menu>");
}