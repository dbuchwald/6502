#include <avr/io.h>
#include "db6502.h"
#include "pinout.h"

static uint8_t control_register;

void assumeBusControl(void) {
  // start by stopping clock and 
  updateControlRegister(CLKSEL_BIT | BE_BIT | RDY_BIT, CLKSEL_BIT | BE_BIT | RDY_BIT);
  // master clock and rw are output now
  CONTROL_DDR  |= (CLK_BIT | RW_BIT);
  // lower the clock, we will raise it only when needed
  CONTROL_POUT &= ~CLK_BIT;
  // address and data buses are all output
  ADDRMSB_DDR  = ALL_OUTPUT;
  ADDRLSB_DDR  = ALL_OUTPUT;
  DATA_DDR     = ALL_INPUT;
  // enable pull-up on DATA
  DATA_POUT    = ALL_PULL_UP;
}

void returnBusControl(void) {
  // master clock, rw and sync all input
  CONTROL_DDR  &= ~(CLK_BIT | RW_BIT);
  // enable pull-ups on input bits
  CONTROL_POUT |= (CLK_BIT | RW_BIT);
  // address and data buses are all input
  ADDRMSB_DDR  = ALL_INPUT;
  ADDRLSB_DDR  = ALL_INPUT;
  DATA_DDR     = ALL_INPUT;
  // enable pull-ups on inputs
  ADDRMSB_POUT = ALL_PULL_UP;
  ADDRLSB_POUT = ALL_PULL_UP;
  DATA_POUT    = ALL_PULL_UP;
  // restore clock, BE and RDY operation
  updateControlRegister(0x00, CLKSEL_BIT | BE_BIT | RDY_BIT);
}

void updateControlRegister(const uint8_t value, const uint8_t mask) {
  control_register = (control_register & ~mask) | (value & mask);
  // shift out current state
  uint8_t temp_shift_out=control_register;
  // disable latch and lower clock line
  CONTROL_POUT &= ~(SR_OUT | SR_CLK);
  // loop over bits
  for (uint8_t idx=0; idx<8; idx++) {
    // shift out most significant bit first
    if (temp_shift_out & 0x80) {
      CONTROL_POUT |= SR_DAT; 
    } else {
      CONTROL_POUT &= ~SR_DAT;
    }
    // pulse clock
    CONTROL_POUT |= SR_CLK;
    CONTROL_POUT &= ~SR_CLK;
    // shift left temp value
    temp_shift_out = temp_shift_out << 1;
  }
  // pulse latch 
  CONTROL_POUT |= SR_OUT;
  // TODO: Might need delay
  //delay(1);
  CONTROL_POUT &= ~SR_OUT;
  // TODO: Might need delay
  //delay(1);
}
