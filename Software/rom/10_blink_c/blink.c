#include "via_utils.h"

int main() {
  via2_set_register(VIA_REGISTER_DDRB, 0xff);

  while (1) {
    via2_set_register(VIA_REGISTER_PORTB, 0x55);
    via2_set_register(VIA_REGISTER_PORTB, 0xaa);
  }

  return 0;
}