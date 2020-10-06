#include <stdio.h>
#include <ctype.h>
#include <avr/io.h>
#include <util/delay.h>
#include "db6502.h"
#include "opcodes.h"
#include "pinout.h"
#include "core.h"
#include "uart.h"
#include "monitor_shell.h"

#define LINE_LENGTH 16

static void displayHelp(void);
static void singleStep(void);
static void goSlow(void);
static void goFast(void);
static void reset6502(void);

void runMonitorShell(void) {
  unsigned char keep_going=1;
  printf("Welcome to DB6502 monitor/debugger\n");
  displayHelp();
  while (keep_going) {
    printf("Dbg >");
    unsigned char c = getc(stdin);
    //printf("\n");
    switch (toupper(c)) {
      case 0x0d:
        break;
      case 'H':
        displayHelp();
        break;
      case 'Q':
        keep_going=0;
        break;
      case 'S':
        singleStep();
        break;
      case 'G':
        goSlow();
        break;
      case 'F':
        goFast();
        break;
      case 'R':
        reset6502();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [s]ingle step - execute single clock cycle of 6502\n");
  printf(" [g]o slow - keep running and dumping bus to serial; press any key to stop\n");
  printf(" go [f]ast - run as fast as possible, without dumping bus data to serial\n");
  printf(" [r]eset - reset 6502 and its peripherals\n");
  printf(" [h]elp - display this information\n");
  printf(" [q]uit - leave shell\n");
}

static void singleStep(void) {
  uint8_t addressLSB, addressMSB, data, ctrl;
  char buffer[64];
  char opcodeBuffer[6];
  // raise the clock
  CONTROL_POUT |= CLK_BIT;
  // read the busses
  addressLSB = ADDRLSB_PIN;
  addressMSB = ADDRMSB_PIN;
  data       = DATA_PIN;
  ctrl       = CONTROL_PIN & (RW_BIT | SYNC_BIT);
  if (ctrl & SYNC_BIT) {
    getOpcodeText(opcodeBuffer, data);
  } else {
    opcodeBuffer[0]=0;
  }
  sprintf(buffer, "  %02x%02x: %c %02x %s\n", addressMSB, addressLSB, ctrl & RW_BIT ? 'r' : 'W', data, opcodeBuffer);
  printf(buffer);
  // lower the clock
  CONTROL_POUT &= ~CLK_BIT;
}

static void goSlow(void) {
  uint8_t addressLSB, addressMSB, data, ctrl;
  char buffer[64];
  char opcodeBuffer[6];
  while (1) {
    // raise the clock
    CONTROL_POUT |= CLK_BIT;
    // read the busses
    addressLSB = ADDRLSB_PIN;
    addressMSB = ADDRMSB_PIN;
    data       = DATA_PIN;
    ctrl       = CONTROL_PIN & (RW_BIT | SYNC_BIT);
    if (ctrl & SYNC_BIT) {
      getOpcodeText(opcodeBuffer, data);
    } else {
      opcodeBuffer[0]=0;
    }
    sprintf(buffer, "  %02x%02x: %c %02x %s\n", addressMSB, addressLSB, ctrl & RW_BIT ? 'r' : 'W', data, opcodeBuffer);
    // lower the clock
    CONTROL_POUT &= ~CLK_BIT;
    printf(buffer);
    if (uart_peek() == UART_DATA_AVAILABLE) {
      getc(stdin);
      return;
    }
  }
}

static void goFast(void) {
  while (1) {
    // raise the clock
    CONTROL_POUT |= CLK_BIT;
    // wait a moment
    _delay_loop_1(8);
    // lower the clock
    CONTROL_POUT &= ~CLK_BIT;
    if (uart_peek() == UART_DATA_AVAILABLE) {
      getc(stdin);
      return;
    }
  }
}


static void reset6502(void) {
  printf("Resetting 6502 and peripherals...");
  resetSystem();
  printf("done.\n");
}