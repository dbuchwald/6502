#include <stdio.h>
#include <util/delay.h>
#include <util/delay_basic.h>
#include "xmodem.h"
#include "uart.h"

#define PACKET_DATA_SIZE 1024

#define PACKET_SOH_SIZE  128
#define PACKET_STX_SIZE  1024

#define CRC_POLY         0x1021

#define PACKET_SOH       0x01
#define PACKET_STX       0x02
#define PACKET_EOT       0x04
#define PACKET_ABORT     0x18

#define RESPONSE_ACK     0x06
#define RESPONSE_NAK     0x15
#define RESPONSE_CRC     0x43

typedef struct _xmodem_packet {
  uint8_t type_code;
  uint8_t packet_no;
  uint8_t packet_no_neg;
  uint8_t data[PACKET_DATA_SIZE];
  uint8_t crc_msb;
  uint8_t crc_lsb;
} xmodem_packet;

static uint16_t crc16_next(uint16_t crc, int incr) {
  
  uint16_t xor = crc >> 15;
  uint16_t out = crc << 1;

  if (incr) {
    out++;
  }

  if (xor) {
    out ^= CRC_POLY;
  }

  return out;
}

static uint16_t crc16(uint8_t *buffer, uint16_t size) {

  uint16_t result=0;
  uint16_t idx;
  uint16_t mask;

  for (idx=0; idx<size; idx++) {
    for (mask=0x80; mask>0; mask >>= 1) {
      result = crc16_next(result, buffer[idx] & mask);
    }
  }

  for (idx=0; idx<16; idx++) {
    result = crc16_next(result, 0);
  }

  return result;
}

uint8_t verifyPacket(xmodem_packet *packet, uint8_t expected_block) {
  if (packet->type_code == PACKET_EOT ||
      packet->type_code == PACKET_ABORT) {
    return 1;
  } else if (packet->type_code != PACKET_SOH &&
             packet->type_code != PACKET_STX) {
//    printf("%c", 0xf1);
    return 0;
  }

  uint16_t crc;
  if (packet->type_code == PACKET_SOH) {
    crc = crc16(packet->data, PACKET_SOH_SIZE);
  } else {
    crc = crc16(packet->data, PACKET_STX_SIZE);
  }
  if ((crc >> 8) != packet->crc_msb ||
      (crc & 0xff) != packet->crc_lsb) {
//    printf("%c%c%c", 0xf2, (crc >> 8), (crc & 0xff));
    return 0;
  }
  if (packet->packet_no != expected_block &&
     (packet->packet_no != (expected_block-1))) {
//    printf("%c%c", 0xf3, expected_block);
    return 0;
  }
  if (packet->packet_no_neg != (0xff-packet->packet_no)) {
//    printf("%c%c", 0xf4, (0xff-packet->packet_no));
    return 0;
  }
  return 1;
}

void readPacketData(xmodem_packet *packet, uint16_t size) {
  packet->packet_no = uart_recv();
  packet->packet_no_neg = uart_recv();
  for (uint16_t idx=0; idx<size; idx++) {
    packet->data[idx] = uart_recv();
  }
  packet->crc_msb = uart_recv();
  packet->crc_lsb = uart_recv();
}

void readPacket(xmodem_packet *packet) {
  packet->type_code = uart_recv();
  switch (packet->type_code) {
    case PACKET_SOH:
      readPacketData(packet, PACKET_SOH_SIZE);
      break;
    case PACKET_STX:
      readPacketData(packet, PACKET_STX_SIZE);
      break;
    case PACKET_EOT:
    case PACKET_ABORT:
      break;
  }
}

void flushInput(void) {
  uint8_t data_remaining;
  do {
    data_remaining=0;
    _delay_ms(10);
    while (uart_peek() == UART_DATA_AVAILABLE) {
      data_remaining=1;
      uart_recv();
    }
  } while (data_remaining);
} 

uint8_t receiveFile(packet_func packet_callback) {

  xmodem_packet packet;
  uint8_t expected_block=1;
  uint8_t keep_going=1;
  uint8_t error_counter=0;
  int result;
  uint8_t last_packet_no=1;
  uint16_t packet_counter=0;

  do {
    uart_send(RESPONSE_CRC);
    for (uint16_t delay_loop_idx=0; delay_loop_idx<16000; delay_loop_idx++) {
      _delay_loop_1(240);
      if (uart_peek() == UART_DATA_AVAILABLE) {
        break;
      }
    }
  }
  while(uart_peek() == UART_NO_DATA);

  while(keep_going) {
    // try to read one packet of data
    readPacket(&packet);

    if (!verifyPacket(&packet, expected_block)) {
      // respond with NAK
      flushInput();
      uart_send(RESPONSE_NAK);
      error_counter++;
    } else {
      if (packet.type_code == PACKET_ABORT) {
        flushInput();
        return 0;
      }
      if (packet.type_code == PACKET_EOT) {
        keep_going=0;
        result=1;
      } else {
        uint16_t size;
        if (packet.type_code == PACKET_SOH) {
          size = PACKET_SOH_SIZE;
        } else {
          size = PACKET_STX_SIZE;
        }
        if (packet.packet_no != last_packet_no) {
          last_packet_no = packet.packet_no;
          packet_counter++;
        }
        result = packet_callback(packet_counter, packet.data, size);
      }
      if (!result) {
        flushInput();
        uart_send(RESPONSE_NAK);
        error_counter++;
      } else {
        uart_send(RESPONSE_ACK);
        expected_block = packet.packet_no+1;
      }
    }
    if (error_counter>=20) {
      flushInput();
      return 0;
    }
  }

  //wait for the sending program to return stream to shell
  _delay_ms(200);
  return 1;
}
