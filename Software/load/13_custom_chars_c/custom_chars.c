#include "blink.h"
#include "acia.h"
#include "keyboard.h"
#include "modem.h"
#include "lcd.h"
#include "utils.h"
#include "tty.h"
#include "string.h"

#define CHAR_MOUTH_OPEN 0x00
#define CHAR_MOUTH_CLOSED 0x01

static char open_mouth_map[] = {0b00001110, 0b00011111, 0b00010101, 0b00011111, 0b00010001, 0b00001110, 0b00000000, 0b00000000};
static char closed_mouth_map[] = {0b00001110, 0b00011111, 0b00010101, 0b00011111, 0b000111111, 0b00000000, 0b00000000, 0b00000000};

static char counter = 0;
static const char blahmsg[] = "Blah blah";
char buffer[32];

void main(void) {
  unsigned char c;
  blink_init();
  blink_led(BLINK_LED_ON);
  delay_ms(250);
  blink_led(BLINK_LED_OFF);

  acia_write_string(blahmsg);

  strcopy(blahmsg, buffer);
  strtoupper(buffer);
  tty_writeln(buffer);

  tty_writeln("abcd, bcd");

  tty_write_hex(strcompare("abcd", "bcd"));

  tty_writeln("bcd, abcd");

  tty_write_hex(strcompare("bcd", "abcd"));

  tty_writeln("abcd, abcd");

  tty_write_hex(strcompare("abcd", "abcd"));

  tty_send_newline();

  tty_write_hex(strtokenize("   get 8000  :   8001    ", buffer));

  tty_writeln(buffer);

  tty_writeln("This is blah too...");
  tty_write_hex(0x8b);
  tty_send_newline();

  while (!acia_is_data_available()) {}

  strobe_led();

  c = acia_read_byte();

  acia_write_byte(c);
  acia_write_byte(0x0a);
  acia_write_byte(0x0d);

  if (keyboard_is_connected() == KEYBOARD_CONNECTED) {
    acia_write_string("Keyboard connected");
  } else {
    acia_write_string("Keyboard not connected");
  }

  acia_write_byte(0x0a);
  acia_write_byte(0x0d);

  while (!keyboard_is_data_available()) {}

  strobe_led();

  c = keyboard_read_char();

  acia_write_byte(c);
  acia_write_byte(0x0a);
  acia_write_byte(0x0d);

  lcd_clear();
  lcd_print("Testing LCD...");
  delay_ms(200);
  lcd_backspace();
  delay_ms(200);
  lcd_backspace();
  delay_ms(200);
  lcd_backspace();
  delay_ms(200);
  lcd_print(" - it works");
  lcd_print_char('!');
  lcd_display_mode(LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_BLINK);
  delay_ms(200);
  lcd_scroll_down();
  delay_ms(200);
  lcd_scroll_down();
  delay_ms(200);
  lcd_scroll_up();
  delay_ms(200);
  lcd_newline();
  delay_ms(200);
  lcd_display_mode(LCD_DM_DISPLAY_ON | LCD_DM_CURSOR_OFF);
  lcd_print("Works as a charm!");
  
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

unsigned char __fastcall__ test_func(const unsigned char input[], unsigned char output[])
{
  unsigned char i=0;
  while (input[i])
  {
    output[i]=input[i];
    ++i;
  }
  output[i]=0;
  return i;
}

