#include <stdio.h>
#include "main.h"
#include "28c256.h"

void displayHelp(void);
void dumpEEPROM(void);

void runShell(void) {
  unsigned char keep_going=1;
  printf("Welcome to ATmega644PA programmer\n");
  displayHelp();
  while (keep_going) {
    unsigned char c = getc(stdin);
    switch (c) {
      case 'h':
      case 'H':
        displayHelp();
        break;
      case 'q':
      case 'Q':
        keep_going=0;
        break;
      case 'd':
      case 'D':
        dumpEEPROM();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [d]ump - dump EEPROM contents\n");
  printf(" [h]elp - display this information\n");
}

void dumpEEPROM(void) {
  printf("Dumping EEPROM contents:\n");
  assumeBusControl();
  uint16_t line_start=0x8000;
  for (uint16_t line=0; line<(0x8000 >> 4); line++) {
    printf("%08x  ", line_start);
    for (uint8_t item=0; item<16; item++) {
      uint8_t data = readSingleByte(line_start+item);
      printf("%02x ", data);
      if (item == 7) {
        printf(" ");
      }
    }
    printf("\n");
    line_start+=16;
  }
  returnBusControl();
}