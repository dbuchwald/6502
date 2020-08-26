#include <stdio.h>
#include <util/delay.h>
#include "main.h"
#include "28c256.h"
#include "xmodem.h"
#include "uart.h"

void displayHelp(void);
void dumpEEPROM(void);
void showSDPStatus(void);
void enableSDP(void);
void disableSDP(void);
void writeEEPROM(void);
void writeEEPROMPage(void);
void receive(void);

uint8_t packet_callback(uint8_t packet_no, uint8_t *buffer, uint16_t size);

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
      case 's':
      case 'S':
        showSDPStatus();
        break;
      case 'e':
      case 'E':
        enableSDP();
        break;
      case 'i':
      case 'I':
        disableSDP();
        break;
      case 'w':
      case 'W':
        writeEEPROM();
        break;
      case 'p':
      case 'P':
        writeEEPROMPage();
        break;
      case 'r':
      case 'R':
        receive();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [d]ump - dump EEPROM contents\n");
  printf(" [s]how - display current SDP status\n");
  printf(" [e]nable - enable data protection\n");
  printf(" d[i]sable - disable data protection\n");
  printf(" [w]rite - write data to EEPROM\n");
  printf(" [p]age write - write page of data\n");
  printf(" [r]eceive - receive file using XMODEM protocol\n");
  printf(" [h]elp - display this information\n");
  printf(" [q]uit - leave shell\n");
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

void showSDPStatus(void) {
  uint8_t status;
  printf("Checking SDP status\n");
  assumeBusControl();
  status = checkDataProtection();
  switch (status) {
    case SDP_DISABLED:
      printf(" - Software data protection is disabled\n");
      break;
    case SDP_ENABLED:
      printf(" - Software data protection is enabled\n");
      break;
    case SDP_FAILED:
      printf(" - Software data protection check failed! Please verify EEPROM state!\n");
      break;
    default:
      printf(" - Unknown error occurred!\n");
  }
  returnBusControl();
}

void enableSDP(void) {
  uint8_t status;
  printf("Enabling Software Data Protection\n");
  assumeBusControl();
  status = enableDataProtection();
  switch (status) {
    case SDP_DISABLED:
      printf(" - Software data protection is still disabled!\n");
      break;
    case SDP_ENABLED:
      printf(" - Software data protection successfully enabled\n");
      break;
    case SDP_FAILED:
      printf(" - Software data protection check failed! Please verify EEPROM state!\n");
      break;
    default:
      printf(" - Unknown error occurred!\n");
      break;
  }
  returnBusControl();
}

void disableSDP(void) {
  uint8_t status;
  printf("Disabling Software Data Protection\n");
  assumeBusControl();
  status = disableDataProtection();
  switch (status) {
    case SDP_DISABLED:
      printf(" - Software data protection successfully disabled!\n");
      break;
    case SDP_ENABLED:
      printf(" - Software data protection still enabled!\n");
      break;
    case SDP_FAILED:
      printf(" - Software data protection check failed! Please verify EEPROM state!\n");
      break;
    default:
      printf(" - Unknown error occurred!\n");
      break;
  }
  returnBusControl();
}

void writeEEPROM(void) {
  uint16_t address=0x8000;
  uint8_t old_data, new_data, result;
  printf("Writing data to EEPROM\n");
  assumeBusControl();
  printf(" - Reading data at location %04x\n", address);
  old_data = readSingleByte(address);
  new_data = ~old_data;
  printf(" - Data read: %02x\n", old_data);
  printf(" - Disabling write protection\n");
  disableDataProtection();
  printf(" - Writing %02x to location %04x\n", new_data, address);
  result = writeSingleByte(address, new_data);
  if (result == WRITE_OK) {
    printf(" - Data written successfully\n");
  } else {
    printf(" - Write has failed\n");
  }
  printf(" - Enabling write protection\n");
  enableDataProtection();
  printf(" - Reading data again\n");
  new_data = readSingleByte(address);
  printf(" - Data read: %02x\n", new_data);
  printf(" - Testing data protection by writing %02x\n", ~new_data);
  result = writeSingleByte(address, ~new_data);
  if (result == WRITE_FAIL) {
    printf(" - Write seems to have failed\n");
  } 
  new_data = readSingleByte(address);
  printf(" - Data read: %02x\n", new_data);
  returnBusControl();
}

void writeEEPROMPage(void) {
  uint16_t address=0x8000;
  uint8_t old_data, result;
  uint8_t new_data[64];
  printf("Writing page data to EEPROM\n");
  assumeBusControl();
  printf(" - Reading data at location %04x\n", address);
  old_data = readSingleByte(address);
  printf(" - Data read: %02x\n", old_data);
  for (uint8_t i=0; i<64; i++) {
    new_data[i] = ~old_data;
  }
  printf(" - Disabling write protection\n");
  disableDataProtection();
  printf(" - Writing %02x at location %04x\n", new_data[0], address);
  result = writePage(address, new_data);
  if (result == WRITE_OK) {
    printf(" - Data written successfully\n");
  } else {
    printf(" - Write has failed\n");
  }
  printf(" - Enabling write protection\n");
  enableDataProtection();
  printf(" - Reading data again\n");
  new_data[0] = readSingleByte(address);
  printf(" - Data read: %02x\n", new_data[0]);
  printf(" - Testing data protection by writing %02x\n", (~new_data[0]) & 0xff);
  result = writeSingleByte(address, ~new_data[0]);
   if (result == WRITE_FAIL) {
    printf(" - Write seems to have failed\n");
  } 
  new_data[0] = readSingleByte(address);
  printf(" - Data read: %02x\n", new_data[0]);
  returnBusControl();
}

void receive(void) {
  printf("Preparing to receive file, initiate file transfer now...\n");
  uint8_t result = receiveFile(&packet_callback);
  uint8_t data_remaining;
  do {
    data_remaining=0;
    _delay_ms(10);
    while (uart_peek() == UART_DATA_AVAILABLE) {
      data_remaining=1;
      uart_recv();
    }
  } while (data_remaining);

  if (result) {
    printf(" - File received successfully\n");
  } else {
    printf(" - File receive failed\n");
  }
}

uint8_t packet_callback(uint8_t packet_no, uint8_t *buffer, uint16_t size) {
  return 1;
}
