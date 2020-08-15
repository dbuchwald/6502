#include <stdio.h>
#include <avr/io.h>
#include "28c256.h"
#include "pinout.h"

#define ROM_OFFSET   0x8000

// assumes bus is already under our control
uint8_t readSingleByte(const uint16_t address) {
  uint8_t addr_msb = (address >> 8);
  uint8_t addr_lsb = (address & 0xff);
  uint8_t data;

  ADDRMSB_POUT = addr_msb;
  ADDRLSB_POUT = addr_lsb;
  DATA_DDR     = ALL_INPUT;
  DATA_POUT    = ALL_PULL_UP;

  CONTROL_POUT &= ~CLK_BIT;
  CONTROL_POUT |= RW_BIT;
  CONTROL_POUT |= CLK_BIT;

  data = DATA_PIN;

  CONTROL_POUT &= ~CLK_BIT;

  return data;
}

// assumes bus is already under our control
void writeSingleByte(const uint16_t address, const uint8_t data) {
  uint8_t addr_msb = (address >> 8);
  uint8_t addr_lsb = (address & 0xff);

  ADDRMSB_POUT = addr_msb;
  ADDRLSB_POUT = addr_lsb;
  DATA_DDR     = ALL_OUTPUT;
  CONTROL_POUT &= ~(CLK_BIT | RW_BIT);
  CONTROL_POUT |= CLK_BIT;
  DATA_POUT = data;
  // TODO: Delay? Shouldn't be needed
  CONTROL_POUT &= ~CLK_BIT;
}

// assumes bus is already under our control
void writePage(const uint16_t address, uint8_t* data_ptr) {
  uint8_t page_msb = (address >> 8);
  uint8_t page_lsb = (address & 0xc0);

  ADDRMSB_POUT = page_msb;
  DATA_DDR     = ALL_OUTPUT;

  CONTROL_POUT &= ~(CLK_BIT | RW_BIT);
  for (uint8_t page_offset=0; page_offset<64; page_offset++) {
    ADDRLSB_POUT = page_lsb | page_offset;
    CONTROL_POUT |= CLK_BIT;
    DATA_POUT = *data_ptr++;
    // TODO: Delay? Shouldn't be needed
    CONTROL_POUT &= ~CLK_BIT;
  }
  // keep polling until write complete
  waitForWriteEnd(*(--data_ptr));
}

// assumes address bus is already set up to last write
void waitForWriteEnd(const uint8_t data) {
  uint8_t poll_value;

  // data is input
  DATA_DDR  = ALL_INPUT;
  // enable pull-ups
  DATA_POUT = ALL_PULL_UP;
  // toggle read mode
  CONTROL_POUT |= RW_BIT;

  // keep reading the data
  do {
    CONTROL_POUT |= CLK_BIT;
    // TODO: some delay might be necessary
    poll_value = DATA_PIN;
    CONTROL_POUT &= ~CLK_BIT;
  } while (poll_value != data);
}

void disableDataProtection(void) {
  writeSingleByte(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByte(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByte(0x5555+ROM_OFFSET, 0x80);
  writeSingleByte(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByte(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByte(0x5555+ROM_OFFSET, 0x20);
}

void enableDataProtection(void) {
  writeSingleByte(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByte(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByte(0x5555+ROM_OFFSET, 0xa0);
}

