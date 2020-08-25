#include <stdio.h>
#include <avr/io.h>
#include <util/delay_basic.h>
#include <util/delay.h>
#include "28c256.h"
#include "pinout.h"

#define ROM_OFFSET   0x8000
#define WAIT_CYCLES  0x4000
// defined in chip datasheet
#define TOGGLE_BIT    _BV(6)

void writeSingleByteInternal(const uint16_t address, const uint8_t data);
uint8_t waitForWriteEnd();

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
  return waitForWriteEnd();
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
    // no delay needed here, probably thanks to the dereference operation above
    CONTROL_POUT &= ~CLK_BIT;
  }
  // keep polling until write complete
  return waitForWriteEnd();
}

// assumes address bus is already set up to last write
uint8_t waitForWriteEnd() {
  uint8_t toggle_old, toggle_new;

  // data is input
  DATA_DDR  = ALL_INPUT;
  // enable pull-ups
  DATA_POUT = ALL_PULL_UP;
  // toggle read mode
  CONTROL_POUT |= RW_BIT;

  // read first value
  CONTROL_POUT |= CLK_BIT;
  _delay_loop_1(1);
  // read byte on location 6 (toggle bit operation indicating write in progress)
  toggle_old = DATA_PIN & TOGGLE_BIT;
  CONTROL_POUT &= ~CLK_BIT;

  // keep reading the data
  for (int i=0; i<WAIT_CYCLES; i++) {
    CONTROL_POUT |= CLK_BIT;
    _delay_loop_1(1);
    toggle_new = DATA_PIN & TOGGLE_BIT;
    CONTROL_POUT &= ~CLK_BIT;
    if (toggle_old == toggle_new) {
      return WRITE_OK;
    } else {
      toggle_old = toggle_new;
    }
  }
  return WRITE_FAIL;
}

uint8_t disableDataProtection(void) {
  uint8_t status = checkDataProtection();
  if (status == SDP_ENABLED) {
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
    writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0x80);
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
    writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0x20);
    waitForWriteEnd();
    return checkDataProtection();
  } 
  return status;
}

uint8_t enableDataProtection(void) {
  uint8_t status = checkDataProtection();
  if (status == SDP_DISABLED) {
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0xaa);
    writeSingleByteInternal(0x2aaa+ROM_OFFSET, 0x55);
    writeSingleByteInternal(0x5555+ROM_OFFSET, 0xa0);
    waitForWriteEnd();
    return checkDataProtection();
  }
  return status;
}

uint8_t checkDataProtection(void) {
  uint8_t old_value, new_value;
  // read old value (to restore it later if SDP is disabled)
  old_value = readSingleByte(ROM_OFFSET);
  new_value = ~old_value;
  // try to write new value
  if (writeSingleByte(ROM_OFFSET, new_value) == WRITE_FAIL) {
    // write operation failed - result uncertain here!
    return SDP_FAILED;
  }
  // check if the value has changed or not
  new_value = readSingleByte(ROM_OFFSET);
  if (new_value == old_value) {
    // no change, so SDP is enabled
    return SDP_ENABLED;
  } else {
    // data changed, so SDP must be disabled
    // start with writing the original value first
    if (writeSingleByte(ROM_OFFSET, old_value) == WRITE_FAIL) {
      // write operation failed - result uncertain here!
      return SDP_FAILED;
    }
    // data restored to original value
    return SDP_DISABLED;
  }
}