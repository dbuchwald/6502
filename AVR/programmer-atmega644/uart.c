#include <avr/io.h>
#include <stdio.h>

void uart_init(unsigned long baud)
{
  unsigned int ubrr;
  ubrr = (((F_CPU / (baud * 16UL))) - 1);
  UBRR0H = (unsigned char)(ubrr >> 8);
  UBRR0L = (unsigned char)ubrr;

  UCSR0C = _BV(UCSZ01) | _BV(UCSZ00); /* 8-bit data, async, no parity, 1 stop bit */
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);   /* Enable RX and TX */
}

int uart_putchar(char c, FILE *stream)
{
  if (c == '\n')
  {
    uart_putchar('\r', stream);
  }
  loop_until_bit_is_set(UCSR0A, UDRE0);
  UDR0 = c;
  return 0;
}

int uart_getchar(FILE *stream)
{
  loop_until_bit_is_set(UCSR0A, RXC0);
  return UDR0;
}
