// POV toy demo framework //
// ------- Preamble -------- //
#include <avr/io.h> 
#include <util/delay.h>
// -------- Functions --------- //
void POVDisplay(uint8_t oneByte) { 
  PORTB = oneByte;
  _delay_ms(2);
}

int main(void) {
  DDRB = 0xff;
  while (1) {
    POVDisplay(0b00001110);
    POVDisplay(0b00011000);
    POVDisplay(0b10111101);
    POVDisplay(0b01110110);
    POVDisplay(0b00111100);
    POVDisplay(0b00111100);
    POVDisplay(0b00111100);
    POVDisplay(0b01110110);
    POVDisplay(0b10111101);
    POVDisplay(0b00011000);
    POVDisplay(0b00001110);
    PORTB = 0; 
    _delay_ms(10);
  }
  return (0); 
}