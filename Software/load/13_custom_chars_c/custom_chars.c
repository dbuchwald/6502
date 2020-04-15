#include "blink.h"
#include "lcd.h"
#include "utils.h"

#define CHAR_MOUTH_OPEN 0x00
#define CHAR_MOUTH_CLOSED 0x01

static const unsigned char open_mouth_map[]   = {0b00001110, 
                                                 0b00011111, 
                                                 0b00010101, 
                                                 0b00011111, 
                                                 0b00010001, 
                                                 0b00001110, 
                                                 0b00000000,
                                                 0b00000000};

static const unsigned char closed_mouth_map[] = {0b00001110, 
                                                 0b00011111, 
                                                 0b00010101, 
                                                 0b00011111, 
                                                 0b00011111, 
                                                 0b00000000, 
                                                 0b00000000, 
                                                 0b00000000};

static unsigned char counter = 0;

void main(void) {
  blink_init();
  blink_led(BLINK_LED_ON);
  delay_ms(250);
  blink_led(BLINK_LED_OFF);

  lcd_clear();

  lcd_define_char(CHAR_MOUTH_OPEN, open_mouth_map);
  lcd_define_char(CHAR_MOUTH_CLOSED, closed_mouth_map);

  lcd_set_position(5, 1);
  lcd_print("Blah blah");

  counter=0;

  while (counter<10) {

    lcd_set_position(3, 1);
    lcd_print_char(CHAR_MOUTH_OPEN);

    delay_ms(200);

    lcd_set_position(3, 1);
    lcd_print_char(CHAR_MOUTH_CLOSED);

    delay_ms(150);

    ++counter;
  }

  lcd_clear();
}