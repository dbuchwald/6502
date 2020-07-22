#include "blink.h"
#include "utils.h"
#include "via_utils.h"
#include "core.h"

void user_irq_handler(void);

unsigned char irq_counter=0;

void main(void) {
  irq_counter=0;

  register_user_irq(user_irq_handler);

  via2_set_register(VIA_REGISTER_ACR, VIA_ACR_T1_CONT_NO_PB7 | VIA_ACR_T2_TIMED | VIA_ACR_SR_DISABLED | VIA_ACR_PB_LATCH_DISABLE | VIA_ACR_PA_LATCH_DISABLE);
  via2_set_register(VIA_REGISTER_IER, VIA_IER_SET_FLAGS | VIA_IER_TIMER1_FLAG);
  via2_set_register(VIA_REGISTER_T1CL, 250);
  via2_set_register(VIA_REGISTER_T1CH, 200);

  delay_sec(5);

  via2_set_register(VIA_REGISTER_IER, VIA_IER_CLEAR_FLAGS | VIA_IER_TIMER1_FLAG);
}

void user_irq_handler(void) {
  unsigned char ifr = via2_get_register(VIA_REGISTER_IFR);
  if (ifr & 0x80) {
    via2_get_register(VIA_REGISTER_T1CL);
    if (!(++irq_counter)) {
      strobe_led();
    }
  }
}