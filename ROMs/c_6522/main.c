#include "via.h"

int main() {
  via1_init();

  while (1) {
    via1_output_portb(0x55);
    via1_output_portb(0xaa);
  }

  return 0;
}