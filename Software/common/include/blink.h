#ifndef __BLINK_H
#define __BLINK_H

#define BLINK_LED_ON 1
#define BLINK_LED_OFF 0

extern void __fastcall__ blink_init(void);
extern void __fastcall__ blink_led(unsigned char on);
extern void __fastcall__ strobe_led(void);

#endif
