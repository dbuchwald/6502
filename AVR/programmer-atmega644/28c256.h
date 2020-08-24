uint8_t readSingleByte(const uint16_t address);
uint8_t writeSingleByte(const uint16_t address, const uint8_t data);
uint8_t writePage(const uint16_t address, uint8_t* data_ptr);
void disableDataProtection(void);
void enableDataProtection(void);
