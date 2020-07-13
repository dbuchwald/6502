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
void enableBreakpoint(void);
void disableBreakpoint(void);
void singleStep(void);
void goLoop(void);
void runLoop(void);
void showHelp(void);
void dumpBuffer(void);
unsigned char parseHexAddress(const char buffer[], unsigned char* msb, unsigned char* lsb);

void uart_init(unsigned int baud);

void uart_print(const char string[]);
void uart_putchar(unsigned char c);
unsigned char uart_getchar(void);
unsigned char uart_available(void);

// circular buffer size
#define BUFFER_SIZE 128
// circular buffer index
unsigned char bufferIndex;
// actual buffer
unsigned char addrMSB[BUFFER_SIZE];
unsigned char addrLSB[BUFFER_SIZE];
unsigned char data[BUFFER_SIZE];
// could be optimized
unsigned char cycleParams[BUFFER_SIZE];
// breakpoints
#define MAX_BREAKPOINTS 8
unsigned char breakpointsCount;
unsigned char breakpointsMSB[MAX_BREAKPOINTS];
unsigned char breakpointsLSB[MAX_BREAKPOINTS];
unsigned char breakpointsStatus[MAX_BREAKPOINTS];
unsigned char activeBreakpoints;

#define ADDRESS_BUFFER_SIZE 5

const char serialBackSpace[] = {0x1b,'[','D',' ',0x1b,'[','D',0x00};

char textBuffer[64];

int main(void)
{
  initPorts();
  uart_init(57600);

  // Init variables
  bufferIndex = 0;
  breakpointsCount = 0;
  activeBreakpoints = 0;

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
    command = uart_getchar();
    switch (command) {
      case 'a':
      case 'A':
        uart_print("add\n");
        defineBreakpoint();
        break;
      case 'l':
      case 'L':
        uart_print("list\n");
        listBreakpoints();
        break;
      case 'd':
      case 'D':
        uart_print("delete\n");
        deleteBreakpoint();
        break;
      case 'e':
      case 'E':
        uart_print("enable\n");
        enableBreakpoint();
        break;
      case 'i':
      case 'I':
        uart_print("disable\n");
        disableBreakpoint();
        break;
      case 's':
      case 'S':
        uart_print("step\n");
        singleStep();
        break;
      case 'g':
      case 'G':
        uart_print("go\n");
        goLoop();
        break;
      case 'r':
      case 'R':
        uart_print("run\n");
        runLoop();
        dumpBuffer();
        break;
      case 'h':
      case 'H':
        uart_print("help\n\n");
        showHelp();
        break;
      default:
        uart_print("\n");
        uart_print("Invalid command, press h for help\n");
        break;
    }
  }
}

void defineBreakpoint(void) {
  char addressBuffer[ADDRESS_BUFFER_SIZE];
  unsigned char index=0;
  char keepGoing=1;
  unsigned char breakMSB, breakLSB;
  uart_print("Please enter breakpoint address in hex format:>");
  while (keepGoing) {
    char character=uart_getchar();
    if ((index < ADDRESS_BUFFER_SIZE-1) &&
        ((character>='0' && character<='9') ||
         (character>='a' && character<='f') ||
         (character>='A' && character<='F'))) {
      addressBuffer[index++]=character;
      uart_putchar(character);
    } else {
      switch (character) {
      case 0x1b:
        uart_print("\nEntry cancelled.\n");
        keepGoing=0;
        break;
      case 0x7f:
        if (index>0) {
          addressBuffer[index--]=0x00;
          uart_print(serialBackSpace);
        }
        break;
      case 0x0d:
        uart_print("\n");
        addressBuffer[index]=0x00;
        if (parseHexAddress(addressBuffer, &breakMSB, &breakLSB)) {
          sprintf(textBuffer, "New breakpoint defined at 0x%02x%02x\n", breakMSB, breakLSB);
          uart_print(textBuffer);
          breakpointsMSB[breakpointsCount]=breakMSB;
          breakpointsLSB[breakpointsCount]=breakLSB;
          if (activeBreakpoints<2) {
            breakpointsStatus[breakpointsCount]=1;
            activeBreakpoints++;
          } else {
            breakpointsStatus[breakpointsCount]=0;
          }
          breakpointsCount++;
          keepGoing=0;
        } else {
          uart_print("Unable to parse given address, please try again\nPlease enter breakpoint address in hex format:>");
          index=0;
        }
        break;
      default:
        break;  
      }
    }
  }
}

void listBreakpoints(void) {
  for (unsigned char i=0; i<breakpointsCount; i++) {
    sprintf(textBuffer, "Breakpoint [%d] at 0x%02x%02x %s\n", i, breakpointsMSB[i], breakpointsLSB[i], breakpointsStatus[i] == 0 ? "" : "(Active)");
    uart_print(textBuffer);
  }
}

void deleteBreakpoint(void) {
  if (breakpointsCount == 0) {
    uart_print("No breakpoints to delete\n");
  } else {
    listBreakpoints();
    uart_print("Select breakpoint using number in brackets or ESC to cancel\n");
    while(1) {
      unsigned char character=uart_getchar();
      if (character>='0' && character<'0'+breakpointsCount) {
        if (breakpointsStatus[character-'0']) {
          activeBreakpoints--;
        }
        for (unsigned char i=character-'0'; i<breakpointsCount-1; i++)
        {
          breakpointsMSB[i]=breakpointsMSB[i+1];
          breakpointsLSB[i]=breakpointsLSB[i+1];
          breakpointsStatus[i]=breakpointsStatus[i+1];
        }
        breakpointsCount--;
        return;
      } else if (character==0x1b) {
        return;
      }
    }
  }
}

void enableBreakpoint(void) {
  if (activeBreakpoints > 1) {
    uart_print("Two breakpoints are already enabled, disable one of them first\n");
  } else {
    listBreakpoints();
    uart_print("Select breakpoint using number in brackets or ESC to cancel\n");
    while(1) {
      unsigned char character=uart_getchar();
      if (character>='0' && character<'0'+breakpointsCount) {
        if (breakpointsStatus[character-'0']) {
          uart_print("Breakpoint already enabled\n");
        } else {
          breakpointsStatus[character-'0']=1;
          activeBreakpoints++;
          return; 
        }
      } else if (character==0x1b) {
        return;
      }
    }
  }
}

void disableBreakpoint(void) {
  if (activeBreakpoints == 0) {
    uart_print("No breakpoints are currently active\n");
  } else {
    listBreakpoints();
    uart_print("Select breakpoint using number in brackets or ESC to cancel\n");
    while(1) {
      unsigned char character=uart_getchar();
      if (character>='0' && character<'0'+breakpointsCount) {
        if (!breakpointsStatus[character-'0']) {
          uart_print("Breakpoint already disabled\n");
        } else {
          breakpointsStatus[character-'0']=0;
          activeBreakpoints--;
          return; 
        }
      } else if (character==0x1b) {
        return;
      }
    }
  }
}

unsigned char parseHexAddress(const char buffer[], unsigned char* msb, unsigned char* lsb) {
  unsigned char digits[4];
  for (unsigned char i=0; i<4; i++) {
    if (buffer[i]>='0' && buffer[i]<='9') {
      digits[i]=buffer[i]-'0';
    } else if (buffer[i]>='a' && buffer[i]<='f') {
      digits[i]=buffer[i]-'a'+10;
    } else if (buffer[i]>='A' && buffer[i]<='F') {
      digits[i]=buffer[i]-'A'+10;
    } else {
      return 0;
    }
  }
  *msb=(digits[0]<<4)+digits[1];
  *lsb=(digits[2]<<4)+digits[3];
  return 1;
}

void singleStep(void) {
  // current read values
  unsigned char currentAddrMSB;
  unsigned char currentAddrLSB;
  unsigned char currentData;
  unsigned char currentCycleParams;
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

void runLoop() {
  unsigned char break0Active=0;
  unsigned char break0MSB=0x00;
  unsigned char break0LSB=0x00;
  unsigned char break1Active=0;
  unsigned char break1MSB=0x00; 
  unsigned char break1LSB=0x00;

  for (unsigned char i=0; i<breakpointsCount; i++) {
    if (breakpointsStatus[i]) {
      if (!break0Active) {
        break0Active=1;
        break0MSB=breakpointsMSB[i];
        break0LSB=breakpointsLSB[i];
      } else {
        break1Active=1;
        break1MSB=breakpointsMSB[i];
        break1LSB=breakpointsMSB[i];
      }
    }
  }
  
  while (1)
  {
    // current read values
    unsigned char currentAddrMSB;
    unsigned char currentAddrLSB;
    unsigned char currentData;
    unsigned char currentCycleParams;

    // raise clock line high
    CONTROL_PORT |= _BV(CLOCK_PIN_PORT);
    // read address and data busses as well as r/W flag
    currentAddrLSB = ADDR_BUS_LSB_PIN;
    currentAddrMSB = ADDR_BUS_MSB_PIN;
    currentData = DATA_BUS_PIN;
    currentCycleParams = CONTROL_PIN & _BV(RW_PIN_PIN);
    // copy current data to buffer
    addrMSB[bufferIndex] = currentAddrMSB;
    addrLSB[bufferIndex] = currentAddrLSB;
    data[bufferIndex] = currentData;
    cycleParams[bufferIndex] = currentCycleParams;
    // pull clock line low
    CONTROL_PORT &= ~_BV(CLOCK_PIN_PORT);
    // test against the breakpoints
    if ((break0Active && currentAddrMSB == break0MSB && currentAddrLSB == break0LSB) || 
        (break1Active && currentAddrMSB == break1MSB && currentAddrLSB == break1LSB)) {
      return;
    }

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
  uart_print("  [e]nable breakpoint - enable breakpoint\n");
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

unsigned char uart_available(void) {
  return UCSR0A & _BV(RXC0);
}

void uart_print(const char string[]) {
  while (*string) {
    uart_putchar(*string);
    string++;
  }
}

void uart_putchar(unsigned char c)
{
  if (c == '\n')
  {
    uart_putchar('\r');
  }
  loop_until_bit_is_set(UCSR0A, UDRE0);
  UDR0 = c;
}

unsigned char uart_getchar()
{
  loop_until_bit_is_set(UCSR0A, RXC0);
  return UDR0;
}
