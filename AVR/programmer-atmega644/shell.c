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
/*
void writeEEPROM(void);
void writeEEPROMPage(void);
void receive(void);
*/
void flashEEPROM(void);
void zeroEEPROM(void);
void eraseEEPROM(void);

uint8_t packet_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size);
uint8_t upload_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size);

void runShell(void) {
  unsigned char keep_going=1;
  printf("Welcome to ATmega644PA programmer\n");
  displayHelp();
  while (keep_going) {
    printf("Prg >");
    unsigned char c = getc(stdin);
    printf("\n");
    switch (c) {
      case 0x0d:
        break;
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
/*
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
*/
      case 'f':
      case 'F':
        flashEEPROM();
        break;
      case 'z':
      case 'Z':
        zeroEEPROM();
        break;
      case 'r':
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
/*
  printf(" [w]rite - write data to EEPROM\n");
  printf(" [p]age write - write page of data\n");
  printf(" [r]eceive - receive file using XMODEM protocol\n");
*/
  printf(" [f]lash - write EEPROM with bin file sent over XMODEM protocol\n");
  printf(" [z]ero - fill EEPROM with nulls\n");
  printf(" e[r]ase - erase EEPROM using 6-byte code\n");
  printf(" [h]elp - display this information\n");
  printf(" [q]uit - leave shell\n");
}

void dumpEEPROM(void) {
  uint8_t line_buf[17];
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
      // copy printable characters into line buffer
      if (data < 0x20 || data >= 0x7f) {
        line_buf[item]='.';
      } else {
        line_buf[item]=data;
      }
      line_buf[16]=0x00;
    }
    printf(" |%s|\n", line_buf);
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
/*
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

  if (result) {
    printf(" - File received successfully\n");
  } else {
    printf(" - File receive failed\n");
  }
}
*/
void flashEEPROM(void) {
  printf("Preparing to flash EEPROM\n");
  assumeBusControl();
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
  printf("done!\n");
}

uint8_t packet_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size) {
  return 1;
}

uint8_t upload_callback(uint16_t packet_no, uint8_t *buffer, uint16_t size) {
  uint16_t address = 0x8000 + packet_no * size;
  for (uint8_t page_no=0; page_no<(size >> 6); page_no++) {
    writePage(address+(page_no << 6), buffer+(page_no << 6));
  }
  return 1;
}

void zeroEEPROM(void) {
  uint16_t address=0x8000;
  uint8_t new_data[64];
  uint8_t result;
  for (uint8_t i=0; i<64; i++) {
    new_data[i] = 0x00;
  }
  printf("Filling EEPROM with nulls\n");
  assumeBusControl();
  printf(" - Disabling write protection...");
  disableDataProtection();
  printf("done!\n");
  printf(" - Erasing EEPROM...");
  for (uint16_t offset=0x0000; offset<0x8000; offset+=64) {
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
  printf("done!\n");
  returnBusControl();
}

void eraseEEPROM(void) {
  uint8_t result;
  printf("Filling EEPROM with 0xff\n");
  assumeBusControl();
  // printf(" - Disabling write protection...");
  // disableDataProtection();
  // printf("done!\n");
  printf(" - Erasing EEPROM...");
  result=eraseChip();
  if (result == WRITE_OK) {
    printf("done!\n");
  } else {
    printf("failed!\n");
  }
  // printf(" - Enabling data protection...");
  // enableDataProtection();
  // printf("done!\n");
  returnBusControl();
}
