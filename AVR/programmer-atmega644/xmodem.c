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

struct xmodem_packet {
  uint8_t type_code;
  uint8_t packet_no;
  uint8_t packet_no_neg;
  uint8_t data[PACKET_DATA_SIZE];
  uint8_t crc_msb;
  uint8_t crc_lsb;
};

struct xmodem_packet packet;

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

uint8_t verifyPacket(uint8_t expected_block) {
  uint16_t crc;
  if (packet.type_code == PACKET_EOT ||
      packet.type_code == PACKET_ABORT) {
    return 1;
  } else if (packet.type_code != PACKET_SOH &&
             packet.type_code != PACKET_STX) {
    return 0;
  }

  if (packet.type_code == PACKET_SOH) {
    crc = crc16(packet.data, PACKET_SOH_SIZE);
  } else {
    crc = crc16(packet.data, PACKET_STX_SIZE);
  }
  /*
  printf("%04x \n", crc);

  printf("%02x %02x\n%02x %02x\n", (crc >> 8), packet.crc_msb, (crc & 0xff), packet.crc_lsb);
  printf("%02x %02x", expected_block, 0xff-expected_block);
  */
  if ((crc >> 8) != packet.crc_msb ||
      (crc & 0xff) != packet.crc_lsb) {
    //printf("CRC: %02x %02x %02x %02x", packet.crc_msb, (crc >> 8), packet.crc_lsb, (crc & 0xff));
    return 0;
  }
  if (packet.packet_no != expected_block &&
     (packet.packet_no != (expected_block-1))) {
    //printf("PNO");
    return 0;
  }
  if (packet.packet_no_neg != (0xff-packet.packet_no)) {
    //printf("PNEG");
    return 0;
  }
  return 1;
}

void readPacketData(uint16_t size) {
  uint8_t *ptr=packet.data;
  packet.packet_no = uart_recv();
  packet.packet_no_neg = uart_recv();
  for (uint16_t idx=0; idx<size; idx++) {
    *ptr = uart_recv();
    ptr++;
  }
  packet.crc_msb = uart_recv();
  packet.crc_lsb = uart_recv();
/*
  uint16_t i;
  for (i=0; i<20; i++) {
    uint8_t response = RESPONSE_NAK;
    fwrite(&response, sizeof(response), 1, stdout);
  }
  _delay_ms(3000);

  printf("%02x ", packet.type_code);
  printf("%02x ", packet.packet_no);
  printf("%02x ", packet.packet_no_neg);
  for (i=0; i<size-2; i++) {
    printf("%02x ", packet.data[i]);
  }
  printf("%02x ", packet.crc_msb);
  printf("%02x ", packet.crc_lsb);
  printf("\n");

  for (i=0; i<size+5; i++) {
    printf("%02x ", raw_packet[i]);
  }
*/
}

void readPacket() {
  packet.type_code = uart_recv();
  switch (packet.type_code) {
    case PACKET_SOH:
      readPacketData(PACKET_SOH_SIZE);
      break;
    case PACKET_STX:
      readPacketData(PACKET_STX_SIZE);
      break;
    case PACKET_EOT:
    case PACKET_ABORT:
      break;
  }
}

uint8_t receiveFile(packet_func packet_callback) {

  uint8_t expected_block=1;
  int result;
  uint8_t keep_going=1;
  uint16_t delay_loop_idx;
  //uint8_t header_packet=1;
  uint8_t error_counter=0;

  do {
    uart_send(RESPONSE_CRC);
    for (delay_loop_idx=0; delay_loop_idx<16000; delay_loop_idx++) {
      _delay_loop_1(240);
      if (uart_peek() == UART_DATA_AVAILABLE) {
        break;
      }
    }
  }
  while(uart_peek() == UART_NO_DATA);

  while(keep_going) {
    // try to read one packet of data
    readPacket();
    //uart_send(RESPONSE_ACK);

    if (!verifyPacket(expected_block)) {
      // respond with NAK
      uart_send(RESPONSE_NAK);
      error_counter++;
    } else {
      // if (packet.packet_no > 0) {
      //   header_packet=0;
      // }
      // correct packet received, proceed
      if (packet.type_code == PACKET_ABORT) {
        return 0;
      }
      if (packet.type_code == PACKET_EOT) {
        keep_going=0;
        result=1;
      } else {
        // if (header_packet) {
        //   result = header_callback(packet.data, sizeof(packet.data));
        // } else {
        uint16_t size;
        if (packet.type_code == PACKET_SOH) {
          size = PACKET_SOH_SIZE;
        } else {
          size = PACKET_STX_SIZE;
        }
        result = packet_callback(packet.packet_no, packet.data, size);
        // }
      }
      if (!result) {
        uart_send(RESPONSE_NAK);
        error_counter++;
      } else {
        uart_send(RESPONSE_ACK);
        // if (header_packet || !keep_going) {
        //   uart_send(RESPONSE_CRC);
        // }
        expected_block = packet.packet_no+1;
      }
    }
    if (error_counter>=20) {
      return 0;
    }
  }

  return 1;
}
