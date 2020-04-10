#include "blink.h"
#include "acia.h"

#define CHAR_MOUTH_OPEN 0x00
#define CHAR_MOUTH_CLOSED 0x01

static char open_mouth_map[] = {0b00001110, 0b00011111, 0b00010101, 0b00011111, 0b00010001, 0b00001110, 0b00000000, 0b00000000};
static char closed_mouth_map[] = {0b00001110, 0b00011111, 0b00010101, 0b00011111, 0b000111111, 0b00000000, 0b00000000, 0b00000000};

extern void lcd_clear();
extern void __fastcall__ __near__ lcd_define_char(register char code, char* char_map);
extern void __fastcall__ tty_write(const char* string);
extern void __fastcall__ lcd_print_char(char c);
extern void __fastcall__ delay_ms(char c);
extern void __fastcall__ lcd_set_position(register char a, register char x, register char y);

static char counter = 0;
static const char blahmsg[] = "Blah blah";

void main(void) {
  unsigned char c;
  blink_init();
  blink_led(BLINK_LED_ON);
  delay_ms(250);
  blink_led(BLINK_LED_OFF);

  acia_write_string(blahmsg);

  while (!acia_is_data_available()) {}

  strobe_led();

  c = acia_read_byte();

  acia_write_byte(c);
  
  // lcd_clear();
  // lcd_define_char(CHAR_MOUTH_OPEN, open_mouth_map);
  // lcd_define_char(CHAR_MOUTH_CLOSED, closed_mouth_map);
  // lcd_set_position(0, 5, 1);
  // tty_write(blahmsg);
  // while (counter<10) {
  //   lcd_set_position(0, 3, 1);
  //   lcd_print_char(CHAR_MOUTH_OPEN);
  //   delay_ms(200);
  //   lcd_set_position(0, 3, 1);
  //   lcd_print_char(CHAR_MOUTH_CLOSED);
  //   delay_ms(150);
  //   ++counter;
  // }
  // lcd_clear();
}

        