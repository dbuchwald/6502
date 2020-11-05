#include <stdio.h>
#include <ctype.h>
#include <avr/io.h>
#include <util/delay.h>
#include "db6502.h"
#include "opcodes.h"
#include "pinout.h"
#include "core.h"
#include "uart.h"
#include "monitor_shell.h"
#include "escape_codes.h"

#define LINE_LENGTH 16
#define BUFFER_SIZE 256

#define LAST_CYCLES_COUNT 64
#define LAST_INSTRUCTIONS_COUNT 16

// use CLK_BIT as uninitialized flag in buffer
#define UNINITIALIZED CLK_BIT

typedef struct {
  uint8_t addrMSB;
  uint8_t addrLSB;
  uint8_t data;
  uint8_t ctrl;
} cpu_cycle;

typedef struct {
  cpu_cycle cycles[BUFFER_SIZE];
  uint8_t   write_ptr;
} cycle_buffer;

static void displayHelp(void);
static void singleStep(cycle_buffer* buffer);
static void singleInstruction(cycle_buffer* buffer);
static void cycleStack(cycle_buffer* buffer);
static void instructionsStack(cycle_buffer* buffer);
static void goSlow(cycle_buffer* buffer);
static void goFast(cycle_buffer* buffer);
static void reset6502(cycle_buffer* buffer);

static void toggleClock(cycle_buffer* buffer);
static void toggleBusEnable();
static void toggleReady();
static void toggleWSDisable();

static void initBuffer(cycle_buffer* buffer);
static uint8_t getOneCycleToBuffer(cycle_buffer* buffer);
static void renderLastCycles(cycle_buffer* buffer, uint8_t count);
static void renderLastInstructions(cycle_buffer* buffer, uint8_t count);
static void renderOpcode(cycle_buffer* buffer, uint8_t* pointer);

static void renderSingleCycle(cpu_cycle* cycle_ptr);

static uint8_t clock_state=0;

void runMonitorShell(void) {
  cycle_buffer cpu_buffer;
  unsigned char keep_going=1;
  uint8_t control_register;
  initBuffer(&cpu_buffer);
  // take control of system clock
  updateControlRegister(CLKSEL_BIT, CLKSEL_BIT);
  printf("Welcome to DB6502 monitor/debugger\n");
  displayHelp();
  while (keep_going) {
    control_register = getControlRegister(); 
    printf("Debugger [z|x|g|f|r|b|n|m|h|q] <CLK: %c |BE: %c |RDY: %c |WSDIS: %c >", 
           clock_state ? '1' : '0',
           control_register & BE_BIT ? '0' : '1',
           control_register & RDY_BIT ? '0' : '1',
           control_register & WSDIS_BIT ? '1' : '0');
    unsigned char c = getc(stdin);
    printf(ESCAPE_CLEAR_LINE);
    switch (toupper(c)) {
      case 0x0d:
        break;
      case 'H':
        displayHelp();
        break;
      case 'Q':
        keep_going=0;
        break;
      case 'Z':
        singleStep(&cpu_buffer);
        break;
      case 'X':
        singleInstruction(&cpu_buffer);
        break;
      case 'A':
        cycleStack(&cpu_buffer);
        break;
      case 'S':
        instructionsStack(&cpu_buffer);
        break;
      case 'G':
        goSlow(&cpu_buffer);
        break;
      case 'F':
        goFast(&cpu_buffer);
        break;
      case 'R':
        reset6502(&cpu_buffer);
        break;
      case 'B':
        toggleClock(&cpu_buffer);
        break;
      case 'N':
        toggleBusEnable();
        break;
      case 'M':
        toggleReady();
        break;
      case 'W':
        toggleWSDisable();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
  // return control to 6502
  returnBusControl();
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [z] single step - execute single clock cycle of 6502\n");
  printf(" [x] single instruction - execute single instruction of 6502\n");
  printf(" [a] cycle stack trace - display 6502 stack trace (raw cycles)\n");
  printf(" [s] instruction stack trace - display 6502 stack trace (instructions)\n");
  printf(" [g]o slow - keep running and dumping bus to serial; press any key to stop\n");
  printf(" go [f]ast - run as fast as possible, without dumping bus data to serial\n");
  printf(" [b] toggle clock line high/low - for fine CPU control\n");
  printf(" [n] toggle BE line high/low - for fine CPU control\n");
  printf(" [m] toggle RDY line high/low - for fine CPU control\n");
  printf(" [w] toggle Wait State disable line high/low\n");
  printf(" [r]eset - reset 6502 and its peripherals\n");
  printf(" [h]elp - display this information\n");
  printf(" [q]uit - leave shell\n");
}

static void singleStep(cycle_buffer* buffer) {
  getOneCycleToBuffer(buffer);
  renderLastCycles(buffer, 1);
}

static void singleInstruction(cycle_buffer* buffer) {
  while (!getOneCycleToBuffer(buffer));
  renderLastInstructions(buffer, 1);
}

static void cycleStack(cycle_buffer* buffer) {
  printf("Printing last cycle stack:\n");
  renderLastCycles(buffer, LAST_CYCLES_COUNT);
}

static void instructionsStack(cycle_buffer* buffer) {
  printf("Printing last instructions stack:\n");
  renderLastInstructions(buffer, LAST_INSTRUCTIONS_COUNT);
}

static void goSlow(cycle_buffer* buffer) {
  while (1) {
    getOneCycleToBuffer(buffer);
    renderLastCycles(buffer, 1);
    if (uart_peek() == UART_DATA_AVAILABLE) {
      getc(stdin);
      return;
    }
  }
}

static void goFast(cycle_buffer* buffer) {
  while (1) {
    getOneCycleToBuffer(buffer);
    if (uart_peek() == UART_DATA_AVAILABLE) {
      getc(stdin);
      return;
    }
  }
}

static void initBuffer(cycle_buffer* buffer) {
  buffer->write_ptr = 0;
  do {
    buffer->cycles[buffer->write_ptr].addrMSB = 0;
    buffer->cycles[buffer->write_ptr].addrLSB = 0;
    buffer->cycles[buffer->write_ptr].data = 0;
    buffer->cycles[buffer->write_ptr].ctrl = UNINITIALIZED; // indicates that this is uninitialized entry
    buffer->write_ptr++;
  } while (buffer->write_ptr);
}

// returns 0 if regular cycle or non-zero if opcode fetch
static uint8_t getOneCycleToBuffer(cycle_buffer* buffer) {
  cpu_cycle* cycle_ptr = &(buffer->cycles[buffer->write_ptr]);

  // raise the clock
  CONTROL_POUT |= CLK_BIT;
  clock_state = 1;
  // read the busses
  cycle_ptr->addrLSB = ADDRLSB_PIN;
  cycle_ptr->addrMSB = ADDRMSB_PIN;
  cycle_ptr->data    = DATA_PIN;
  cycle_ptr->ctrl    = CONTROL_PIN & (RW_BIT | SYNC_BIT);
  // lower the clock
  CONTROL_POUT &= ~CLK_BIT;
  clock_state = 0;
  buffer->write_ptr++;
  return cycle_ptr->ctrl & SYNC_BIT;
}

static void renderLastCycles(cycle_buffer* buffer, uint8_t count) {
  uint8_t wptr = buffer->write_ptr;
  uint8_t wptr_orig = wptr;
  wptr = wptr - count;
  while (wptr!=wptr_orig) {
    cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
    renderSingleCycle(cycle_ptr);
    wptr++;
  }
}

// moves pointer to beginning of previous cycle
static void findPrevCycle(cycle_buffer* buffer, uint8_t* pointer) {
  uint8_t wptr = *pointer;
  uint8_t wptr_orig = wptr;
  cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
  cpu_cycle* old_ptr   = cycle_ptr;
  do {
    wptr--;
    cycle_ptr = &(buffer->cycles[wptr]);
  } while (old_ptr->addrLSB == cycle_ptr->addrLSB &&
           old_ptr->addrMSB == cycle_ptr->addrMSB &&
           old_ptr->data    == cycle_ptr->data    &&
           old_ptr->ctrl    == cycle_ptr->ctrl    &&
           wptr             != wptr_orig);
  *pointer = wptr;
}

// moves pointer to beginning of next cycle
static void findNextCycle(cycle_buffer* buffer, uint8_t* pointer) {
  uint8_t wptr = *pointer;
  uint8_t wptr_orig = wptr;
  cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
  cpu_cycle* old_ptr   = cycle_ptr;
  do {
    wptr++;
    cycle_ptr = &(buffer->cycles[wptr]);
  } while (old_ptr->addrLSB == cycle_ptr->addrLSB &&
           old_ptr->addrMSB == cycle_ptr->addrMSB &&
           old_ptr->data    == cycle_ptr->data    &&
           old_ptr->ctrl    == cycle_ptr->ctrl    &&
           wptr             != wptr_orig);
  *pointer = wptr;
}


static void renderLastInstructions(cycle_buffer* buffer, uint8_t count) {
  uint8_t wptr = buffer->write_ptr-1;
  cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
  uint8_t wptr_orig;
  uint8_t found = 0;

  // start by finding first byte of last instruction
  while (!(cycle_ptr->ctrl & (SYNC_BIT | UNINITIALIZED))) {
    findPrevCycle(buffer, &wptr);
    cycle_ptr = &(buffer->cycles[wptr]);
  }

  // no previous instruction found
  if (cycle_ptr->ctrl & UNINITIALIZED) {
    return;
  }

  // set original position of the wptr to current one (pointing to beginning of last instruction)
  findPrevCycle(buffer, &wptr);
  findNextCycle(buffer, &wptr);
  wptr_orig=wptr;

  // keep counting previous instructions
  while (count) {
    findPrevCycle(buffer, &wptr);
    cycle_ptr = &(buffer->cycles[wptr]);
    if (cycle_ptr->ctrl & SYNC_BIT) {
      count--;
      found++;
    }
    // exit if we reached uninitialized data, no more instructions will be found
    if (cycle_ptr->ctrl & UNINITIALIZED) {
      // fast forward to next next instruction
      while (wptr!=wptr_orig && !(cycle_ptr->ctrl & SYNC_BIT)) {
        findNextCycle(buffer, &wptr);
        cycle_ptr = &(buffer->cycles[wptr]);
      }
      count=0;
    }
  }

  // to display correctly we need at least one instruction
  if (!found) {
    return;
  }

  while (wptr!=wptr_orig) {
    cycle_ptr = &(buffer->cycles[wptr]);
    if (!(cycle_ptr->ctrl & UNINITIALIZED)) {
      renderOpcode(buffer, &wptr);
    } else {
      findNextCycle(buffer, &wptr);
    }
  }
}

static void renderOpcode(cycle_buffer* buffer, uint8_t* pointer) {
  uint8_t wptr = *pointer;
  cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
  char serial_buffer[64];
  char operand[10];
  char opcode_text[6];
  uint8_t addrMSB = cycle_ptr->addrMSB;
  uint8_t addrLSB = cycle_ptr->addrLSB;
  unsigned int relAddress;
  uint8_t opcode = cycle_ptr->data;
  uint8_t opLSB=0;
  uint8_t opMSB=0;
  uint8_t opcode_bytes = getOpcodeBytes(opcode);
  if (opcode_bytes >= 2) {
    findNextCycle(buffer, &wptr);
    cycle_ptr = &(buffer->cycles[wptr]);
    opLSB = cycle_ptr->data;
  }
  if (opcode_bytes == 3) {
    findNextCycle(buffer, &wptr);
    cycle_ptr = &(buffer->cycles[wptr]);
    opMSB = cycle_ptr->data;
  }  
  uint8_t addrMode = getAddressMode(opcode);
  switch (addrMode) {
  case ACCUMULATOR:
    sprintf(operand, "A");
    break;
  case ABSOLUTE:
    sprintf(operand, " $%02x%02x", opMSB, opLSB);
    break;
  case ABSOLUTE_X:
    sprintf(operand, " $%02x%02x,X", opMSB, opLSB);
    break;
  case ABSOLUTE_Y:
    sprintf(operand, " $%02x%02x,Y", opMSB, opLSB);
    break;
  case IMMEDIATE:
    sprintf(operand, " #$%02x", opLSB);
    break;
  case IMPLIED:
    operand[0]=0;
    break;
  case X_INDIRECT:
    sprintf(operand, " ($%02x,X)", opLSB);
    break;
  case INDIRECT_Y:
    sprintf(operand, " ($%02x),Y", opLSB);
    break;
  case RELATIVE:
    if (opLSB>=0x80) {
      relAddress=((addrMSB-1) << 8) + addrLSB + opLSB + 1;
    } else {
      relAddress=(addrMSB << 8) + addrLSB + opLSB + 1;
    }
    sprintf(operand, " $%04x", relAddress);
    break;
  case ZEROPAGE:
    sprintf(operand, " $%02x", opLSB);
    break;
  case ZEROPAGE_X:
    sprintf(operand, " $%02x,X", opLSB);
    break;
  case ZEROPAGE_Y:
    sprintf(operand, " $%02x,Y", opLSB);
    break;
  case ZEROPAGE_R:
    sprintf(operand, " $%02x,$xxxx", opLSB);
    break;
  case ZEROPAGE_I:
    sprintf(operand, " ($%02x)", opLSB);
    break;
  case INDIRECT:
    sprintf(operand, " ($%02x%02x)", opMSB, opLSB);
    break;
  case INDIRECT_X:
    sprintf(operand, " ($%02x%02x,X)", opMSB, opLSB);
    break;
  }
  getOpcodeText(opcode_text, opcode);
  sprintf(serial_buffer, "  %s%02x%02x %s%s%s\n", ESCAPE_FORMAT_BOLD, 
                                                  addrMSB, 
                                                  addrLSB, 
                                                  opcode_text, 
                                                  operand,
                                                  ESCAPE_FORMAT_CLEAR);
  printf(serial_buffer);
  findNextCycle(buffer, &wptr);
  cycle_ptr = &(buffer->cycles[wptr]);
  while (!(cycle_ptr->ctrl & (SYNC_BIT | UNINITIALIZED))) {
    renderSingleCycle(cycle_ptr);
    findNextCycle(buffer, &wptr);
    cycle_ptr = &(buffer->cycles[wptr]);
  }
  *pointer = wptr;
}

static void renderSingleCycle(cpu_cycle* cycle_ptr) {
  char serial_buffer[64];
  if (!(cycle_ptr->ctrl & UNINITIALIZED)) {
    sprintf(serial_buffer, "  %02x%02x: %c %02x %c\n", cycle_ptr->addrMSB, 
                                                       cycle_ptr->addrLSB, 
                                                       cycle_ptr->ctrl & RW_BIT ? 'r' : 'W', 
                                                       cycle_ptr->data,
                                                       cycle_ptr->ctrl & SYNC_BIT ? 'S' : ' ');
    printf(serial_buffer);
  }
}

static void reset6502(cycle_buffer* buffer) {
  printf("Resetting 6502 and peripherals...");
  resetSystem();
  initBuffer(buffer);
  printf("done.\n");
}

static void toggleClock(cycle_buffer* buffer) {
  char serial_buffer[64];

  // read busses first (before clock transition)
  uint8_t addrLSB = ADDRLSB_PIN;
  uint8_t addrMSB = ADDRMSB_PIN;
  uint8_t data    = DATA_PIN;
  uint8_t ctrl    = CONTROL_PIN & (RW_BIT | SYNC_BIT);

  //print the data to output
  sprintf(serial_buffer, "  %02x%02x: %c %02x %c <%c>\n", addrMSB, 
                                                          addrLSB, 
                                                          ctrl & RW_BIT ? 'r' : 'W', 
                                                          data,
                                                          ctrl & SYNC_BIT ? 'S' : ' ',
                                                          clock_state ? 'H' : 'l');
  printf(serial_buffer);

  if (clock_state == 0) {
    // raise the clock
    CONTROL_POUT |= CLK_BIT;
    clock_state = 1;
  } else {
    // save cycle to buffer (PHI2 high)
    cpu_cycle* cycle_ptr = &(buffer->cycles[buffer->write_ptr]);

    cycle_ptr->addrLSB = addrLSB;
    cycle_ptr->addrMSB = addrMSB;
    cycle_ptr->data    = data;
    cycle_ptr->ctrl    = ctrl;
    // lower the clock
    CONTROL_POUT &= ~CLK_BIT;
    clock_state = 0;
    buffer->write_ptr++;
  }
}

static void toggleBusEnable() {
  uint8_t control_register = getControlRegister();

  if (control_register & BE_BIT) {
    updateControlRegister(0x00, BE_BIT);
  } else {
    updateControlRegister(BE_BIT, BE_BIT);
  }
}

static void toggleReady() {
  uint8_t control_register = getControlRegister();

  if (control_register & RDY_BIT) {
    updateControlRegister(0x00, RDY_BIT);
  } else {
    updateControlRegister(RDY_BIT, RDY_BIT);
  }
}

static void toggleWSDisable() {
  uint8_t control_register = getControlRegister();

  if (control_register & WSDIS_BIT) {
    updateControlRegister(0x00, WSDIS_BIT);
  } else {
    updateControlRegister(WSDIS_BIT, WSDIS_BIT);
  }
}
