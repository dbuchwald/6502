#include <stdio.h>
#include <avr/io.h>
#include "main.h"
#include "uart.h"

// circular buffer size
#define BUFFER_SIZE 64
// circular buffer index
unsigned char bufferIndex;
// actual buffer
unsigned char addrMSB[BUFFER_SIZE];
unsigned char addrLSB[BUFFER_SIZE];
unsigned char data[BUFFER_SIZE];
// could be optimized
unsigned char readWrite[BUFFER_SIZE];
// current read values
unsigned char currentAddrMSB;
unsigned char currentAddrLSB;
unsigned char currentData;
unsigned char currentReadWrite;
// counter used to check for input
unsigned char cycleCounterForUI;

int main(void)
{
    // init serial interface
    uart_init(57600);

    // redirect standard output
    stdout = &uart_output;
    stdin = &uart_input;

    // Init variables
    bufferIndex = 0;
    cycleCounterForUI = 0;

    // Init port direction registers
    // port A and C are inputs for Address Bus
    DDRA = 0x00;
    DDRC = 0x00;
    // Enable all pull-ups
    PORTA = 0xff;
    PORTC = 0xff;
    // port B is input for Data Bus
    DDRB = 0x00;
    // Enable pull-ups
    PORTB = 0xff;
    // pin D4 is clock output
    DDRD |= _BV(DDD4);
    // pin D5 is R/W input
    DDRD &= ~_BV(DDD5);
    // enable pull-up on D5
    PORTD |= _BV(PORTD5);

    // start by pulling clock line low
    PORTD &= ~_BV(PORTD4);

    while (1)
    {
        // raise clock line high
        PORTD |= _BV(PORTD4);
        // read address and data busses as well as r/W flag
        currentAddrLSB = PINA;
        currentAddrMSB = PINC;
        currentData = PINB;
        currentReadWrite = PIND & _BV(PIND5);
        // pull clock line low
        PORTD &= ~_BV(PORTD4);

        //copy current data to buffer
        addrMSB[bufferIndex] = currentAddrMSB;
        addrLSB[bufferIndex] = currentAddrLSB;
        data[bufferIndex] = currentData;
        readWrite[bufferIndex] = currentReadWrite;
        ++bufferIndex;
        if (bufferIndex == BUFFER_SIZE) {
            bufferIndex = 0;
            // for (int i=0; i<BUFFER_SIZE; i++) {
            //     printf("%02X%02X %c %02X\n", addrMSB[i], addrLSB[i], readWrite[i] ? 'r' : 'W', data[i]);
            // }
        }
        ++cycleCounterForUI;
        // execute code only every 256 cycles (to avoid unnecessary slowdown due to constant UART register polling)
        if (!cycleCounterForUI) {
          // check if any data is available in UART input buffer
          if (UCSRA & _BV(RXC)) {
            processUserInput();
          }
        }
    }

    return 0;
}

void processUserInput(void) {
}