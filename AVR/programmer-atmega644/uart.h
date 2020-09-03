#ifndef __UART_H__DEFINED
#define __UART_H__DEFINED

#define UART_NO_DATA        0x00
#define UART_DATA_AVAILABLE 0x01

int uart_putchar(char c, FILE *stream);
int uart_getchar(FILE *stream);

void uart_send(char c);
char uart_recv(void);
uint8_t uart_peek(void);

void uart_init();

#endif /* __UART_H__DEFINED */