#ifndef __28C256_H__DEFINED
#define __28C256_H__DEFINED

#define WRITE_FAIL    0x00
#define WRITE_OK      0x01

#define SDP_DISABLED  0x00
#define SDP_ENABLED   0x01
#define SDP_FAILED    0x02

uint8_t readSingleByte(const uint16_t address);
uint8_t writeSingleByte(const uint16_t address, const uint8_t data);
uint8_t writePage(const uint16_t address, uint8_t* data_ptr);
void disableDataProtection(void);
void enableDataProtection(void);

uint8_t checkDataProtection(void);


#endif /* __28C256_H__DEFINED */