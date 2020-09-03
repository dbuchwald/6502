#ifndef __PINOUT_H__DEFINED
#define __PINOUT_H__DEFINED

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

#define ALL_INPUT    0x00
#define ALL_OUTPUT   0xff
#define ALL_PULL_UP  0xff

#endif