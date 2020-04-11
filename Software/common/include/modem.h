#ifndef __MODEM_H
#define __MODEM_H

#define MODEM_RECEIVE_FAILED    0
#define MODEM_RECEIVE_SUCCESS   1
#define MODEM_RECEIVE_CANCELLED 2

extern unsigned char __fastcall__ modem_send(void);
extern unsigned char __fastcall__ modem_receive(void);

#endif