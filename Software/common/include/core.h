#ifndef __CORE_H
#define __CORE_H

extern void __fastcall__ register_user_break(void (*user_break_handler)(void));
extern void __fastcall__ deregister_user_break(void);
extern void __fastcall__ register_user_irq(void (*user_irq_handler)(void));
extern void __fastcall__ deregister_user_irq(void);

#endif