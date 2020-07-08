/*
 * Demonstration on how to redirect stdio to UART. 
 *
 * http://appelsiini.net/2011/simple-usart-with-avr-libc
 *
 * To compile and upload run: make clean; make; make program;
 * Connect to serial with: screen /dev/tty.usbserial-*
 *
 * Copyright 2011 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 */

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

int main(void)
{
    // init serial interface
    uart_init(57600);

    // redirect standard output
    stdout = &uart_output;
    stdin = &uart_input;

    // Init variables
    bufferIndex = 0;

    // Init port direction registers
    // port A and C are inputs for Address Bus
    DDRA = 0x00;
    DDRC = 0x00;
    // port B is input for Data Bus
    DDRB = 0x00;
    // pin D4 is clock output
    DDRD |= _BV(DDD4);
    // pin D5 is R/W input
    DDRD &= ~_BV(DDD5);

    // start by pulling clock line low
    PORTD &= ~_BV(PORTD4);

    while (1)
    {
        // raise clock line high
        PORTD |= _BV(PORTD4);
        // read address and data busses as well as r/W flag
        currentAddrLSB = PORTA;
        currentAddrMSB = PORTC;
        currentData = PORTB;
        currentReadWrite = PORTD & _BV(PORTD5);
        // pull clock line low
        PORTD &= ~_BV(PORTD4);

        //printf("%02X%02X %c %02X\n", currentAddrMSB, currentAddrLSB, currentReadWrite ? 'r' : 'W', currentData);

        //copy current data to buffer
        addrMSB[bufferIndex] = currentAddrMSB;
        addrLSB[bufferIndex] = currentAddrLSB;
        data[bufferIndex] = currentData;
        readWrite[bufferIndex] = currentReadWrite;
        ++bufferIndex;
        if (bufferIndex == BUFFER_SIZE)
        {
            bufferIndex = 0;
        }
    }

    return 0;
}
