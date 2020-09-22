#include <stdio.h>
#include <ctype.h>
#include <util/delay.h>
#include "28c256.h"
#include "xmodem.h"
#include "db6502.h"
#include "core.h"
#include "programmer_shell.h"

#define LINE_LENGTH 16

static void displayHelp(void);
static void dumpEEPROM(void);
static void showSDPStatus(void);
static void enableSDP(void);
static void disableSDP(void);
static void flashEEPROM(void);
static void zeroEEPROM(void);
static void eraseEEPROM(void);

static uint8_t upload_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size);

void runProgrammerShell(void) {
  unsigned char keep_going=1;
  printf("Welcome to ATmega644PA programmer\n");
  displayHelp();
  while (keep_going) {
    printf("Prg >");
    unsigned char c = getc(stdin);
    printf("\n");
    switch (toupper(c)) {
      case 0x0d:
        break;
      case 'H':
        displayHelp();
        break;
      case 'Q':
        keep_going=0;
        break;
      case 'D':
        dumpEEPROM();
        break;
      case 'S':
        showSDPStatus();
        break;
      case 'E':
        enableSDP();
        break;
      case 'I':
        disableSDP();
        break;
      case 'F':
        flashEEPROM();
        break;
      case 'Z':
        zeroEEPROM();
        break;
      case 'R':
        eraseEEPROM();
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
  printf(" [f]lash - write EEPROM with bin file sent over XMODEM protocol\n");
  printf(" [z]ero - fill EEPROM with nulls (0x00)\n");
  printf(" e[r]ase - erase EEPROM using 6-byte code (writes 0xff to each cell)\n");
  printf(" [h]elp - display this information\n");
  printf(" [q]uit - leave shell\n");
}

void dumpEEPROM(void) {
  uint8_t last_line_data[LINE_LENGTH];
  uint8_t line_data[LINE_LENGTH];
  uint8_t print_line;
  uint8_t previous_print_line;
  uint8_t item;
  printf("Dumping EEPROM contents:\n");
  assumeBusControl();
  uint16_t line_start=ROM_START;
  for (uint16_t line=0; line<(ROM_SIZE / LINE_LENGTH); line++) {
    for (item=0; item<LINE_LENGTH; item++) {
      line_data[item] = readSingleByte(line_start+item);
    }
    print_line = 1;
    if (line>0) {
      for (item=0; item<LINE_LENGTH; item++) {
        if (line_data[item] != last_line_data[item]) {
          break;
        }
      }
      if (item == LINE_LENGTH) {
        print_line=0;
      }
    }
    if (print_line) {
      printf("%08x  ", line_start);
      for (item=0; item<LINE_LENGTH; item++) {
        printf("%02x ", line_data[item]);
        last_line_data[item]=line_data[item];
        if ((item & 0x07) == 7) {
          printf(" ");
        }
      }
      printf("|");
      for (item=0; item<LINE_LENGTH; item++) {
        if (line_data[item] < 0x20 || line_data[item] >= 0x7f) {
          printf(".");
        } else {
          printf("%c", line_data[item]);
        }
      }
      printf("|\n");
    } else {
      if (previous_print_line) {
        printf("*\n");
      }
    }
    previous_print_line=print_line;

    line_start+=LINE_LENGTH;
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

void flashEEPROM(void) {
  uint32_t start, end;
  uint8_t secs, millis;
  printf("Preparing to flash EEPROM\n");
  start = getSystemTime();
  assumeBusControl();
  printf(" - Erasing EEPROM...");
  if (eraseChip() == WRITE_OK) {
    printf("done!\n");
  } else {
    printf("failed!\n");
    return;
  }
  printf(" - disabling SDP...");
  disableDataProtection();
  printf("done!\n");
  printf(" - ready to receive file, initiate file transfer now...\n");
  uint8_t result = receiveFile(&upload_callback);
  if (result) {
    printf(" - File received and uploaded successfully\n");
  } else {
    printf(" - File receive and/or upload failed\n");
  }
  printf(" - enabling SDP...");
  enableDataProtection();
  returnBusControl();
  end = getSystemTime();
  secs = (end-start)/50;
  millis = ((end-start) % 50) * 2;
  printf("done, took: %d:%02d secs!\n", secs, millis);
}

uint8_t upload_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size) {
  uint16_t address = ROM_START + packet_no * size;
  for (uint8_t page_no=0; page_no<(size / PAGE_SIZE); page_no++) {
    writePage(address+(page_no * PAGE_SIZE), buffer+(page_no * PAGE_SIZE));
  }
  return 1;
}

void zeroEEPROM(void) {
  uint16_t address=ROM_START;
  uint8_t new_data[PAGE_SIZE];
  uint8_t result;
  uint32_t start, end;
  uint8_t secs, millis;
  for (uint8_t i=0; i<PAGE_SIZE; i++) {
    new_data[i] = 0x00;
  }
  printf("Filling EEPROM with nulls\n");
  start = getSystemTime();
  assumeBusControl();
  printf(" - Disabling write protection...");
  disableDataProtection();
  printf("done!\n");
  printf(" - Erasing EEPROM...");
  for (uint16_t offset=0x0000; offset<ROM_SIZE; offset+=PAGE_SIZE) {
    result = writePage(address+offset, new_data);
    if (result != WRITE_OK) {
      printf("failed!\n");
      break;
    }
  }
  if (result == WRITE_OK) {
    printf("done!\n");
  }
  printf(" - Enabling data protection...");
  enableDataProtection();
  returnBusControl();
  end = getSystemTime();
  secs = (end-start)/50;
  millis = ((end-start) % 50) * 2;
  printf("done, took: %d:%02d secs!\n", secs, millis);
}

void eraseEEPROM(void) {
  uint8_t result;
  printf("Erasing EEPROM with 0xff\n");
  assumeBusControl();
  printf(" - Erasing EEPROM...");
  result=eraseChip();
  if (result == WRITE_OK) {
    printf("done!\n");
  } else {
    printf("failed!\n");
  }
  returnBusControl();
}
