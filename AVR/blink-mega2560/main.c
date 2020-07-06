#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    // Configure PB5 as an output using the Port B Data Direction Register (DDRB)
    DDRB |= _BV(DDB7);

    // Loop forever
    while (1)
    {
        // Toggle PB5 using the Port B Input Pin Register (PINB)
        PINB = _BV(PINB7);

        // Wait 500ms
        _delay_ms(500);
    }
}