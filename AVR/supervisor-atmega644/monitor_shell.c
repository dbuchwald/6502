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

#define LINE_LENGTH 16
#define BUFFER_SIZE 256

typedef struct {
  uint8_t addrMSB;
  uint8_t addrLSB;
  uint8_t data;
  uint8_t ctrl;
} cpu_cycle;

typedef struct {
  cpu_cycle cycles[BUFFER_SIZE];
  uint8_t   read_ptr;
  uint8_t   write_ptr;
} cycle_buffer;

static void displayHelp(void);
static void singleStep(cycle_buffer* buffer);
static void singleInstruction(cycle_buffer* buffer);
static void cycleStack(cycle_buffer* buffer);
static void instructionsStack(cycle_buffer* buffer);
static void goSlow(cycle_buffer* buffer);
static void goFast(void);
static void reset6502(void);

static void initBuffer(cycle_buffer* buffer);
static uint8_t getOneCycleToBuffer(cycle_buffer* buffer);
static void renderLastCycles(cycle_buffer* buffer, uint8_t count);
static void renderLastInstructions(cycle_buffer* buffer, uint8_t count);
static void renderOpcode(cycle_buffer* buffer, uint8_t* pointer);

void runMonitorShell(void) {
  cycle_buffer cpu_buffer;
  unsigned char keep_going=1;
  initBuffer(&cpu_buffer);
  printf("Welcome to DB6502 monitor/debugger\n");
  displayHelp();
  while (keep_going) {
    printf("Debugger [z|x|g|f|h|q]");
    unsigned char c = getc(stdin);
    printf("\x1B[2K\r");
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
        goFast();
        break;
      case 'R':
        reset6502();
        break;
      default:
        printf("ERROR: Unrecognized command %c [%02x], type 'h' for help...\n", c, c);
    }
  }
}

void displayHelp(void) {
  printf("Please select one of the options:\n");
  printf(" [z] single step - execute single clock cycle of 6502\n");
  printf(" [x] single instruction - execute single instruction of 6502\n");
  printf(" [a] cycle stack trace - display 6502 stack trace (raw cycles)\n");
  printf(" [s] instruction stack trace - display 6502 stack trace (instructions)\n");
  printf(" [g]o slow - keep running and dumping bus to serial; press any key to stop\n");
  printf(" go [f]ast - run as fast as possible, without dumping bus data to serial\n");
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
  renderLastCycles(buffer, 16);
}

static void instructionsStack(cycle_buffer* buffer) {
  printf("Printing last instructions stack:\n");
  renderLastInstructions(buffer, 16);
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

static void goFast(void) {
  while (1) {
    // raise the clock
    CONTROL_POUT |= CLK_BIT;
    // wait a moment
    _delay_loop_1(8);
    // lower the clock
    CONTROL_POUT &= ~CLK_BIT;
    if (uart_peek() == UART_DATA_AVAILABLE) {
      getc(stdin);
      return;
    }
  }
}

static void initBuffer(cycle_buffer* buffer) {
  buffer->write_ptr = 0;
  buffer->read_ptr = 0;
  do {
    buffer->cycles[buffer->write_ptr].addrMSB = 0;
    buffer->cycles[buffer->write_ptr].addrLSB = 0;
    buffer->cycles[buffer->write_ptr].data = 0;
    buffer->cycles[buffer->write_ptr].ctrl = CLK_BIT; // indicates that this is uninitialized entry
    buffer->write_ptr++;
  } while (buffer->write_ptr);
}

// returns 0 if regular cycle or non-zero if opcode fetch
static uint8_t getOneCycleToBuffer(cycle_buffer* buffer) {
  cpu_cycle* cycle_ptr = &(buffer->cycles[buffer->write_ptr]);

  // raise the clock
  CONTROL_POUT |= CLK_BIT;
  // read the busses
  cycle_ptr->addrLSB = ADDRLSB_PIN;
  cycle_ptr->addrMSB = ADDRMSB_PIN;
  cycle_ptr->data    = DATA_PIN;
  cycle_ptr->ctrl    = CONTROL_PIN & (RW_BIT | SYNC_BIT);
  // lower the clock
  CONTROL_POUT &= ~CLK_BIT;
  buffer->write_ptr++;
  return cycle_ptr->ctrl & SYNC_BIT;
}

static void renderLastCycles(cycle_buffer* buffer, uint8_t count) {
  uint8_t wptr = buffer->write_ptr;
  uint8_t wptr_orig = wptr;
  char serial_buffer[64];
  wptr = wptr - count;
  while (wptr!=wptr_orig) {
    cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
    if (!(cycle_ptr->ctrl & CLK_BIT)) {
      sprintf(serial_buffer, "  %02x%02x: %c %02x %c\n", cycle_ptr->addrMSB, 
                                                         cycle_ptr->addrLSB, 
                                                         cycle_ptr->ctrl & RW_BIT ? 'r' : 'W', 
                                                         cycle_ptr->data,
                                                         cycle_ptr->ctrl & SYNC_BIT ? 'S' : ' ');
      printf(serial_buffer);
    }
    wptr++;
  }
}

static void renderLastInstructions(cycle_buffer* buffer, uint8_t count) {
  uint8_t wptr = buffer->write_ptr;
  uint8_t wptr_orig = wptr;
  // count is incremented, as we want full instructions from the buffer
  count++;
  while (count) {
    wptr--;
    cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
    if (cycle_ptr->ctrl & SYNC_BIT) {
      count--;
    }
    // exit if we reached uninitialized data, no more instructions will be found
    if (cycle_ptr->ctrl & CLK_BIT) {
      // fast forward to next next instruction
      while (wptr!=wptr_orig && !(cycle_ptr->ctrl & SYNC_BIT)) {
        wptr++;
        cycle_ptr = &(buffer->cycles[wptr]);
      }
      count=0;
    }
  }

  while (wptr!=wptr_orig) {
    cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
    if (!(cycle_ptr->ctrl & CLK_BIT)) {
      renderOpcode(buffer, &wptr);
    }
    wptr++;
  }
}

static void renderOpcode(cycle_buffer* buffer, uint8_t* pointer) {
  uint8_t wptr = *pointer;
  cpu_cycle* cycle_ptr = &(buffer->cycles[wptr]);
  char serial_buffer[64];
  char operand[8];
  char opcode_text[8];
  uint8_t addrMSB = cycle_ptr->addrMSB;
  uint8_t addrLSB = cycle_ptr->addrLSB;
  unsigned int relAddress;
  uint8_t opcode = cycle_ptr->data;
  uint8_t opLSB = buffer->cycles[wptr+1].data;
  uint8_t opMSB = buffer->cycles[wptr+2].data;
  uint8_t addrMode = getAddressMode(opcode);
  switch (addrMode) {
  case ACCUMULATOR:
    sprintf(operand, "A");
    break;
  case ABSOLUTE:
    sprintf(operand, "$%02x%02x", opMSB, opLSB);
    break;
  case ABSOLUTE_X:
    sprintf(operand, "$%02x%02x,X", opMSB, opLSB);
    break;
  case ABSOLUTE_Y:
    sprintf(operand, "$%02x%02x,Y", opMSB, opLSB);
    break;
  case IMMEDIATE:
    sprintf(operand, "#$%02x", opLSB);
    break;
  case IMPLIED:
    sprintf(operand, " ");
    break;
  case X_INDIRECT:
    sprintf(operand, "($%02x,X)", opLSB);
    break;
  case INDIRECT_Y:
    sprintf(operand, "($%02x),Y", opLSB);
    break;
  case RELATIVE:
    if (opLSB>=0x80) {
      relAddress=((addrMSB-1) << 8) + addrLSB + opLSB + 1;
    } else {
      relAddress=(addrMSB << 8) + addrLSB + opLSB + 1;
    }
    sprintf(operand, "$%04x", relAddress);
    break;
  case ZEROPAGE:
    sprintf(operand, "$%02x", opLSB);
    break;
  case ZEROPAGE_X:
    sprintf(operand, "$%02x,X", opLSB);
    break;
  case ZEROPAGE_Y:
    sprintf(operand, "$%02x,Y", opLSB);
    break;
  case ZEROPAGE_R:
    sprintf(operand, "$%02x,$xxxx", opLSB);
    break;
  case ZEROPAGE_I:
    sprintf(operand, "($%02x)", opLSB);
    break;
  case INDIRECT:
    sprintf(operand, "($%02x%02x)", opMSB, opLSB);
    break;
  case INDIRECT_X:
    sprintf(operand, "($%02x%02x,X)", opMSB, opLSB);
    break;
  }
  getOpcodeText(opcode_text, opcode);
  sprintf(serial_buffer, " %02x%02x %s %s\n", addrMSB, addrLSB, opcode_text, operand);
  printf(serial_buffer);
  wptr+=getOpcodeBytes(opcode)+1;
  cycle_ptr = &(buffer->cycles[wptr]);
  while (!(cycle_ptr->ctrl & SYNC_BIT)) {
    sprintf(serial_buffer, "  %02x%02x: %c %02x %c\n", cycle_ptr->addrMSB, 
                                                       cycle_ptr->addrLSB, 
                                                       cycle_ptr->ctrl & RW_BIT ? 'r' : 'W', 
                                                       cycle_ptr->data,
                                                       cycle_ptr->ctrl & SYNC_BIT ? 'S' : ' ');
    printf(serial_buffer);
    wptr++;
    cycle_ptr = &(buffer->cycles[wptr]);
  }
  *pointer = wptr;
}

static void reset6502(void) {
  printf("Resetting 6502 and peripherals...");
  resetSystem();
  printf("done.\n");
}