#include "utils.h"
#include "menu.h"
#include "tty.h"
#include "string.h"
#include "parse.h"

static menuitem menu[3];

void process_cmenu(unsigned char tokens_buffer[] __attribute__((unused))) {
  tty_writeln("Menu item activated!");
}

void process_caddr(unsigned char tokens_buffer[]) {
  unsigned char address[2];
  if (parse_hex_word(strgettoken(tokens_buffer, 1), address)) {
    tty_write("Parsed successfully: 0x");
    tty_write_hex(address[1]);
    tty_write_hex(address[0]);
    tty_send_newline();
  } else {
    tty_writeln("Unable to parse address");
  }
}

void process_cdec(unsigned char tokens_buffer[]) {
  unsigned char address[2];
  if (parse_dec_word(strgettoken(tokens_buffer, 1), address)) {
    tty_write("Parsed successfully: 0x");
    tty_write_hex(address[1]);
    tty_write_hex(address[0]);
    tty_send_newline();
  } else {
    tty_writeln("Unable to parse address");
  }
}

void main(void) {
  setup_menuitem(&(menu[0]), "CMENU", 1, "CMENU - Sample C menu entry", &process_cmenu);
  setup_menuitem(&(menu[1]), "CADDR", 2, "CADDR xxxx - Parameterized entry", &process_caddr);
  setup_menuitem(&(menu[2]), "CDEC",  2, "CDEC xxxx - Parameterized entry", &process_cdec);
  setup_menuitem(&(menu[3]), 0x0000, 0, 0x0000, 0x0000);

  run_menu(menu, "OS/1 C Menu>");
}