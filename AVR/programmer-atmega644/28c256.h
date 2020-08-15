uint8_t readSingleByte(const uint16_t address);
void writeSingleByte(const uint16_t address, const uint8_t data);
void writePage(const uint16_t address, uint8_t* data_ptr);
void waitForWriteEnd(const uint8_t data);
void disableDataProtection(void);
void enableDataProtection(void);
