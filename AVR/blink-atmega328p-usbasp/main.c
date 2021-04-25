#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    // Configure PB5 as an output using the Port B Data Direction Register (DDRB)
    DDRB |= _BV(DDB0);

    // Loop forever
    while (1)
    {
        // Set PB5 high using the Port B Data Register (PORTB)
        PORTB |= _BV(PORTB0);

        // Wait 500ms
        _delay_ms(200);

        // Set PB5 low using the Port B Data Register (PORTB)
        PORTB &= ~_BV(PORTB0);

        // Wait 500ms
        _delay_ms(200);
    }
}