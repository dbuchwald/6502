#include <stdio.h>
#include <avr/io.h>
#include <util/delay_basic.h>
#include <util/delay.h>
#include "28c256.h"
#include "pinout.h"

#define ROM_OFFSET   0x8000
#define WAIT_CYCLES  0x4000

void writeSingleByteInternal(const uint16_t address, const uint8_t data);
uint8_t waitForWriteEnd(const uint8_t data);

// assumes bus is already under our control
uint8_t readSingleByte(const uint16_t address) {
  uint8_t addr_msb = (address >> 8);
  uint8_t addr_lsb = (address & 0xff);
  uint8_t data;

  CONTROL_POUT &= ~CLK_BIT;

  ADDRMSB_POUT = addr_msb;
  ADDRLSB_POUT = addr_lsb;
  DATA_DDR     = ALL_INPUT;
  DATA_POUT    = ALL_PULL_UP;

  CONTROL_POUT |= RW_BIT;
  CONTROL_POUT |= CLK_BIT;

  _delay_loop_1(1);

  data = DATA_PIN;

  CONTROL_POUT &= ~CLK_BIT;

  return data;
}

// assumes bus is already under our control
void writeSingleByteInternal(const uint16_t address, const uint8_t data) {
  uint8_t addr_msb = (address >> 8);
  uint8_t addr_lsb = (address & 0xff);

  CONTROL_POUT &= ~(CLK_BIT | RW_BIT);
  
  ADDRMSB_POUT = addr_msb;
  ADDRLSB_POUT = addr_lsb;
  DATA_DDR     = ALL_OUTPUT;
  
  CONTROL_POUT |= CLK_BIT;
  
  DATA_POUT = data;

  _delay_loop_1(1);

  CONTROL_POUT &= ~CLK_BIT;
}

uint8_t writeSingleByte(const uint16_t address, const uint8_t data) {
  writeSingleByteInternal(address, data);
  return waitForWriteEnd(data);
}

// assumes bus is already under our control
uint8_t writePage(const uint16_t address, uint8_t* data_ptr) {
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
  return waitForWriteEnd(*(--data_ptr));
}

// assumes address bus is already set up to last write
uint8_t waitForWriteEnd(const uint8_t data) {
  uint8_t poll_value;

  // data is input
  DATA_DDR  = ALL_INPUT;
  // enable pull-ups
  DATA_POUT = ALL_PULL_UP;
  // toggle read mode
  CONTROL_POUT |= RW_BIT;

  // keep reading the data
  for (int i=0; i<WAIT_CYCLES; i++) {
    CONTROL_POUT |= CLK_BIT;
    _delay_loop_1(1);
    poll_value = DATA_PIN;
    CONTROL_POUT &= ~CLK_BIT;
    if (poll_value == data) {
      return 1;
    }
  }
  return 0;
}

void disableDataProtection(void) {
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0x80);
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0x20);
  _delay_ms(10);
}

void enableDataProtection(void) {
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
  writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
  writeSingleByteInternal(0x5555+ROM_OFFSET, 0xa0);
  _delay_ms(10);
}
