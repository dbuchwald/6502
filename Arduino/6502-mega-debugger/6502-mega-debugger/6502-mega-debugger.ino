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
// counter used to check for input
unsigned char cycleCounterForUI;

char textBuffer[64];

int main(void)
{
  initPorts();
  Serial.begin(57600);

  // Init variables
  bufferIndex = 0;
  cycleCounterForUI = 0;

  // start by pulling clock line low
  CONTROL_PORT &= ~_BV(CLOCK_PIN_PORT);

  // start user interface shell
  startShell();

  Serial.println("Done!");
  Serial.flush();

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
  int command;
  // Say hello
  Serial.println("Welcome to BE6502 advanced debugger program");
  showHelp();
  while (1) {
    Serial.print("Debug>");
    Serial.flush();
    while (1) {
      command=Serial.read();
      switch(command) {
        case -1:
          break;
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
          Serial.println("");
          Serial.println("Invalid command, press h for help");
          break;
      }
    }
  }
}

void defineBreakpoint(void) {
}
void listBreakpoints(void){
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
  sprintf(textBuffer, "%02X%02X %c %02X", currentAddrMSB, currentAddrLSB, currentCycleParams & _BV(RW_PIN_PIN) ? 'r' : 'W', currentData);
  Serial.println(textBuffer);
}
void goLoop(void) {
  while(1) {
    singleStep();
    if (Serial.available()) {
      int command=Serial.read();
      if (command == 's' || command=='S') {
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
    ++cycleCounterForUI;
    // execute code only every 256 cycles (to avoid unnecessary slowdown due to constant UART register polling)
    if (!cycleCounterForUI) {
      // check if any data is available in UART input buffer
      if (Serial.available()) {
        if (processUserInput()) {
          return;
        }
      }
    }
  }
}

int processUserInput(void) {
  int command=Serial.read();
  if (command=='s' || command=='S') {
    return 1;
  }
  return 0;
}

void dumpBuffer(void) {
  unsigned int dumpIndex=bufferIndex;
  do {
    ++dumpIndex;    
    if (dumpIndex == BUFFER_SIZE) {
      dumpIndex=0;
    }
    sprintf(textBuffer, "%02X%02X %c %02X", addrMSB[dumpIndex], addrLSB[dumpIndex], cycleParams[dumpIndex] & _BV(RW_PIN_PIN) ? 'r' : 'W', data[dumpIndex]);
    Serial.println(textBuffer);
  } while (dumpIndex != bufferIndex);
}

void showHelp(void) {
  Serial.println("Use following keys while in shell mode:");
  Serial.println("  [a]dd breakpoint - adds new breakpoint");
  Serial.println("  [l]ist breakpoints - list all defined breakpoints");
  Serial.println("  [d]elete breakpoint - delete breakpoint");
  Serial.println("  d[i]sable breakpoint - disable breakpoint temporarily");
  Serial.println("  [s]tep - execute next cycle");
  Serial.println("  [g]o - execute step by step");
  Serial.println("  [r]un program - keep going until next breakpoint");
  Serial.println("  [h]elp - list commands");
  Serial.println("");
}
