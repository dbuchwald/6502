#ifndef __DB6502_H__DEFINED
#define __DB6502_H__DEFINED

void assumeBusControl(void);
void returnBusControl(void);
void resetSystem(void);
uint8_t getControlRegister(void);
void updateControlRegister(const uint8_t value, const uint8_t mask);

#endif /* __DB6502_H__DEFINED */
