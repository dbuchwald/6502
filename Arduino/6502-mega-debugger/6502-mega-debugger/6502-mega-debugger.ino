#include <stdio.h>
#include <avr/io.h>

#define ADDR_BUS_MSB_DDR   DDRC
#define ADDR_BUS_MSB_PORT  PORTC
#define ADDR_BUS_MSB_PIN   PINC

#define ADDR_BUS_LSB_DDR   DDRA
#define ADDR_BUS_LSB_PORT  PORTA
#define ADDR_BUS_LSB_PIN   PINA

#define DATA_BUS_DDR       DDRL
#define DATA_BUS_PORT      PORTL
#define DATA_BUS_PIN       PINL

#define CONTROL_DDR        DDRB
#define CONTROL_PORT       PORTB
#define CONTROL_PIN        PINB

#define CLOCK_PIN_DDR      DDB3
#define CLOCK_PIN_PORT     PORTB3
#define RW_PIN_DDR         DDB2
#define RW_PIN_PORT        PORTB2
#define RW_PIN_PIN         PINB2

// Helper functions
void initPorts(void);
void defineBreakpoint(void);
void listBreakpoints(void);
void deleteBreakpoint(void);
void disableBreakpoint(void);
void singleStep(void);
void goLoop(void);
void runLoop(void);
void showHelp(void);
int processUserInput(void);
void dumpBuffer(void);

void uart_init(unsigned int baud);

void uart_print(const char string[]);
void uart_putchar(char c);
char uart_getchar(void);
int uart_available(void);

// circular buffer size
#define BUFFER_SIZE 256
// circular buffer index
unsigned int bufferIndex;
// actual buffer
unsigned char addrMSB[BUFFER_SIZE];
unsigned char addrLSB[BUFFER_SIZE];
unsigned char data[BUFFER_SIZE];
// could be optimized
unsigned char cycleParams[BUFFER_SIZE];
// current read values
unsigned char currentAddrMSB;
unsigned char currentAddrLSB;
unsigned char currentData;
unsigned char currentCycleParams;

char textBuffer[64];

int main(void)
{
  initPorts();
  uart_init(57600);

  // Init variables
  bufferIndex = 0;

  // start by pulling clock line low
  CONTROL_PORT &= ~_BV(CLOCK_PIN_PORT);

  // start user interface shell
  startShell();

  uart_print("Done!\n");

  return 0;
}

void initPorts(void) {
  // Init port direction registers
  // port inputs for Address Bus
  ADDR_BUS_MSB_DDR = 0x00;
  ADDR_BUS_LSB_DDR = 0x00;
  // Enable all pull-ups
  ADDR_BUS_MSB_PORT = 0xff;
  ADDR_BUS_LSB_PORT = 0xff;
  // port input for Data Bus
  DATA_BUS_DDR = 0x00;
  // Enable pull-ups
  DATA_BUS_PORT = 0xff;
  // pin D4 is clock output
  CONTROL_DDR |= _BV(CLOCK_PIN_DDR);
  // pin D5 is R/W input
  CONTROL_DDR &= ~_BV(RW_PIN_DDR);
  // enable pull-up on D5
  CONTROL_PORT |= _BV(RW_PIN_PORT);
}

void startShell(void) {
  char command;
  // Say hello
  uart_print("Welcome to BE6502 advanced debugger program\n");
  showHelp();
  while (1) {
    uart_print("Debug>");
    while (1) {
      command = uart_getchar();
      switch (command) {
        case 'a':
        case 'A':
          defineBreakpoint();
          break;
        case 'l':
        case 'L':
          listBreakpoints();
          break;
        case 'd':
        case 'D':
          deleteBreakpoint();
          break;
        case 'i':
        case 'I':
          disableBreakpoint();
          break;
        case 's':
        case 'S':
          singleStep();
          break;
        case 'g':
        case 'G':
          goLoop();
          break;
        case 'r':
        case 'R':
          runLoop();
          dumpBuffer();
          break;
        case 'h':
        case 'H':
          showHelp();
          break;
        default:
          uart_print("\n");
          uart_print("Invalid command, press h for help\n");
          break;
      }
    }
  }
}

void defineBreakpoint(void) {
}
void listBreakpoints(void) {
}
void deleteBreakpoint(void) {
}
void disableBreakpoint(void) {
}

void singleStep(void) {
  // raise clock line high
  CONTROL_PORT |= _BV(CLOCK_PIN_PORT);
  // read address and data busses as well as r/W flag
  currentAddrLSB = ADDR_BUS_LSB_PIN;
  currentAddrMSB = ADDR_BUS_MSB_PIN;
  currentData = DATA_BUS_PIN;
  currentCycleParams = CONTROL_PIN & _BV(RW_PIN_PIN);
  // pull clock line low
  CONTROL_PORT &= ~_BV(CLOCK_PIN_PORT);
  sprintf(textBuffer, "%02X%02X %c %02X\n", currentAddrMSB, currentAddrLSB, currentCycleParams & _BV(RW_PIN_PIN) ? 'r' : 'W', currentData);
  uart_print(textBuffer);
}
void goLoop(void) {
  while (1) {
    singleStep();
    if (uart_available()) {
      char command = uart_getchar();
      if (command == 's' || command == 'S') {
        return;
      }
    }
  }
}

void runLoop(void) {
  while (1)
  {
    // raise clock line high
    CONTROL_PORT |= _BV(CLOCK_PIN_PORT);
    // read address and data busses as well as r/W flag
    currentAddrLSB = ADDR_BUS_LSB_PIN;
    currentAddrMSB = ADDR_BUS_MSB_PIN;
    currentData = DATA_BUS_PIN;
    currentCycleParams = CONTROL_PIN & _BV(RW_PIN_PIN);
    // pull clock line low
    CONTROL_PORT &= ~_BV(CLOCK_PIN_PORT);

    //copy current data to buffer
    addrMSB[bufferIndex] = currentAddrMSB;
    addrLSB[bufferIndex] = currentAddrLSB;
    data[bufferIndex] = currentData;
    cycleParams[bufferIndex] = currentCycleParams;
    ++bufferIndex;
    if (bufferIndex == BUFFER_SIZE) {
      bufferIndex = 0;
    }

    if (UCSR0A & _BV(RXC0)) {
      char command = UDR0;
      if (command == 's' || command == 'S') {
        return;
      }
    }
  }
}

int processUserInput(void) {
  char command = uart_getchar();
  if (command == 's' || command == 'S') {
    return 1;
  }
  return 0;
}

void dumpBuffer(void) {
  unsigned int dumpIndex = bufferIndex;
  do {
    ++dumpIndex;
    if (dumpIndex == BUFFER_SIZE) {
      dumpIndex = 0;
    }
    sprintf(textBuffer, "%02X%02X %c %02X\n", addrMSB[dumpIndex], addrLSB[dumpIndex], cycleParams[dumpIndex] & _BV(RW_PIN_PIN) ? 'r' : 'W', data[dumpIndex]);
    uart_print(textBuffer);
  } while (dumpIndex != bufferIndex);
}

void showHelp(void) {
  uart_print("Use following keys while in shell mode:\n");
  uart_print("  [a]dd breakpoint - adds new breakpoint\n");
  uart_print("  [l]ist breakpoints - list all defined breakpoints\n");
  uart_print("  [d]elete breakpoint - delete breakpoint\n");
  uart_print("  d[i]sable breakpoint - disable breakpoint temporarily\n");
  uart_print("  [s]tep - execute next cycle\n");
  uart_print("  [g]o - execute step by step\n");
  uart_print("  [r]un program - keep going until next breakpoint\n");
  uart_print("  [h]elp - list commands\n");
  uart_print("\n");
}

void uart_init(unsigned int baud)
{
  unsigned int ubrr;
  ubrr = (((F_CPU / (baud * 16UL))) - 1);
  UBRR0H = (unsigned char)(ubrr >> 8);
  UBRR0L = (unsigned char)ubrr;

  UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);
}

int uart_available(void) {
  return UCSR0A & _BV(RXC0);
}

void uart_print(const char string[]) {
  while (*string) {
    uart_putchar(*string);
    string++;
  }
}

void uart_putchar(char c)
{
  if (c == '\n')
  {
    uart_putchar('\r');
  }
  loop_until_bit_is_set(UCSR0A, UDRE0);
  UDR0 = c;
}

char uart_getchar()
{
  loop_until_bit_is_set(UCSR0A, RXC0);
  return UDR0;
}
