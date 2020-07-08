#include <avr/io.h>
#include <stdio.h>

void uart_init()
{
    unsigned int ubrr;
    ubrr = (((F_CPU / (115200UL * 16UL))) - 1);
    UBRRH = (unsigned char)(ubrr >> 8);
    UBRRL = (unsigned char)ubrr;

    // This is extremaly important - writing to UCSRC will overwrite
    // UBRRH unless URSEL bit is set in the value
    // Honestly WTF?!
    UCSRC = _BV(URSEL) | _BV(UCSZ1) | _BV(UCSZ0); /* 8-bit data */
    UCSRB = _BV(RXEN) | _BV(TXEN);                /* Enable RX and TX */
}

int uart_putchar(char c, FILE *stream)
{
    if (c == '\n')
    {
        uart_putchar('\r', stream);
    }
    loop_until_bit_is_set(UCSRA, UDRE);
    UDR = c;
    return 0;
}

int uart_getchar(FILE *stream)
{
    loop_until_bit_is_set(UCSRA, RXC);
    return UDR;
}
