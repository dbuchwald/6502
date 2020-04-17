#include "utils.h"
#include "menu.h"
#include "tty.h"
#include "string.h"
#include "parse.h"

static menuitem menu[3];

void process_cmenu(unsigned char[]) {
  tty_writeln("Menu item activated!");
}

void process_caddr(unsigned char tokens_buffer[]) {
  unsigned char address[2];
  if (parse_hex_word(strgettoken(tokens_buffer, 1), address)) {
    tty_write("Parsed successfully: 0x");
    tty_write_hex(address[0]);
    tty_write_hex(address[1]);
    tty_send_newline();
  } else {
    tty_writeln("Unable to parse address");
  }
}

void main(void) {
  menu[0].cmd="CMENU";
  menu[0].argc=1;
  menu[0].desc="CMENU - Sample C Menu entry";
  menu[0].function=&process_cmenu;
  menu[0].size = sizeof(menu[0]);
  menu[1].cmd="CADDR";
  menu[1].argc=2;
  menu[1].desc="CADDR xxxx - Parameterized entry";
  menu[1].function=&process_caddr;
  menu[1].size = sizeof(menu[0]);
  menu[2].cmd=0x000;

  run_menu(menu, "OS/1 C Menu>");
}