#include "via_utils.h"

int main() {
  via2_init();

  while (1) {
    via2_output_portb(0x55);
    via2_output_portb(0xaa);
  }

  return 0;
}