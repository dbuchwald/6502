#include <avr/io.h>
#include <stdio.h>
#include "uart.h"

#define BAUD 230400
#include <util/setbaud.h>

void uart_init()
{
  UBRR0H = UBRRH_VALUE;
  UBRR0L = UBRRL_VALUE;
  #if USE_2X
  UCSR0A |= (1 << U2X0);
  #else
  UCSR0A &= ~(1 << U2X0);
  #endif

  UCSR0C = _BV(UCSZ01) | _BV(UCSZ00); /* 8-bit data, async, no parity, 1 stop bit */
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);   /* Enable RX and TX */
}

int uart_putchar(char c, FILE *stream)
{
  if (c == '\n')
  {
    uart_putchar('\r', stream);
  }
  uart_send(c);
  return 0;
}

int uart_getchar(FILE *stream)
{
  return uart_recv();
}

void uart_send(char c) {
  loop_until_bit_is_set(UCSR0A, UDRE0);
  UDR0 = c;
}

char uart_recv(void) {
  loop_until_bit_is_set(UCSR0A, RXC0);
  return UDR0;  
}

uint8_t uart_peek(void) {
  if (UCSR0A & _BV(RXC0)) {
    return UART_DATA_AVAILABLE;
  }
  return UART_NO_DATA;
}
