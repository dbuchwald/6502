#include <stdio.h>
#include <avr/io.h>
#include <util/delay.h>
#include "main.h"
#include "uart.h"

#define ADDRMSB_DDR  DDRC
#define ADDRLSB_DDR  DDRA
#define DATA_DDR     DDRB
#define CONTROL_DDR  DDRD

#define ADDRMSB_POUT PORTC
#define ADDRLSB_POUT PORTA
#define DATA_POUT    PORTB
#define CONTROL_POUT PORTD

#define ADDRMSB_PIN  PINC
#define ADDRLSB_PIN  PINA
#define DATA_PIN     PINB
#define CONTROL_PIN  PIND

#define SR_DAT       _BV(PD2)
#define SR_CLK       _BV(PD3)
#define SR_OUT       _BV(PD4)

#define CLK_BIT      _BV(PD5)
#define RW_BIT       _BV(PD6)
#define SYNC_BIT     _BV(PD7)

#define CLKSEL_BIT   _BV(0)
#define BE_BIT       _BV(1)
#define RDY_BIT      _BV(2)
#define RESET_BIT    _BV(7)

#define BAUD_RATE    115200
#define ROM_OFFSET   0x8000

#define ALL_INPUT    0x00
#define ALL_OUTPUT   0xff
#define ALL_PULL_UP  0xff

static uint8_t control_register;

int main(void)
{
  initSystem();

  return 0;
}

void initSystem(void) {
  // init data direction registers
  // shift register is all output
  CONTROL_DDR  |= (SR_DAT | SR_CLK | SR_OUT);
  // master clock, rw and sync all input
  CONTROL_DDR  &= ~(CLK_BIT | RW_BIT | SYNC_BIT);
  // enable pull-ups on input bits
  CONTROL_POUT |= (CLK_BIT | RW_BIT | SYNC_BIT);
  // address and data buses are all input
  ADDRMSB_DDR  = ALL_INPUT;
  ADDRLSB_DDR  = ALL_INPUT;
  DATA_DDR     = ALL_INPUT;
  // enable pull-ups on inputs
  ADDRMSB_POUT = ALL_PULL_UP;
  ADDRLSB_POUT = ALL_PULL_UP;
  DATA_POUT    = ALL_PULL_UP;

  // shift out default state of control register
  control_register = 0x00;
  updateControlRegister();

  // init serial interface
  uart_init(BAUD_RATE);

  // redirect standard output
  stdout = &uart_output;
  stdin = &uart_input;
}

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

void assumeBusControl(void) {
  // start by stopping clock and 
  control_register |= CLKSEL_BIT | BE_BIT | RDY_BIT;
  updateControlRegister();
  // master clock and rw are output now
  CONTROL_DDR  |= (CLK_BIT | RW_BIT);
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
  control_register &= ~(CLKSEL_BIT | BE_BIT | RDY_BIT);
  updateControlRegister();
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

void updateControlRegister(void) {
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