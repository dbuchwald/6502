#include <stdio.h>
#include <ctype.h>
#include <util/delay.h>
#include "main_shell.h"
#include "programmer_shell.h"
#include "monitor_shell.h"

#define LINE_LENGTH 16

static void displayHelp(void);

void runMainShell(void) {
  unsigned char keep_going=1;
  printf("Welcome to DB6502 supervisor\n");
  displayHelp();
  while (keep_going) {
    printf("DB6502 >");
    unsigned char c = getc(stdin);
    printf("\n");
    switch (toupper(c)) {
      case 0x0d:
        break;
      case 'H':
        displayHelp();
        break;
      case 'M':
        runMonitorShell();
        break;
      case 'P':
        runProgrammerShell();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [m]onitor - run debugger/monitor application\n");
  printf(" [p]rogrammer - run EEPROM programmer application\n");
}
