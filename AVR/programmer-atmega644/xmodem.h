#ifndef __XMODEM_H__DEFINED
#define __XMODEM_H__DEFINED

// Callback types for receive and send operations
typedef uint8_t (*packet_func)(uint16_t packet_no, uint8_t* buffer, uint16_t size);

// Function will receive file block by block, calling callbacks after each of them
uint8_t receiveFile(packet_func packet_callback);

// Function will send file block by block, calling callbacks before each of them
uint8_t sendFile(packet_func packet_callback);

#endif /* __XMODEM_H__DEFINED */