#define IN_CLK         0
#define IN_RWB         1
#define IN_EXRAM       2

#define OUT_WEB        0
#define OUT_OEB        1
#define OUT_RAM1_CSB   2
#define OUT_RAM2_CSB   3
#define OUT_ROM_CSB    4
#define OUT_IO_CS      5

#define MODES_COUNT    3
#define ADDR_COUNT     16
#define OUTPUT_COUNT   6
#define MAX_FAIL       1000

const char MODES[]   = {53, 51, 49};
const char ADDR[]    = {52, 50, 48, 46, 44, 42, 40, 38, 36, 34, 32, 30, 28, 26, 24, 22};
const char OUTPUTS[] = {47, 45, 43, 41, 39, 37};

uint16_t BIT_MASK[ADDR_COUNT];

bool ADDR_VAL[ADDR_COUNT];

uint16_t currentAddress;
uint8_t  currentMode;
uint8_t  currentOutput;

uint32_t passCount;
uint32_t failCount;

void setup() {
  setupPinModes();
  Serial.begin(57600);
  runTest();
  displayTestResult();
}

void setupPinModes() {
  uint8_t i;
  
  for (i=0; i<ADDR_COUNT; i++) {
    pinMode(ADDR[i], OUTPUT);
    digitalWrite(ADDR[i], LOW);
    ADDR_VAL[i]=false;
    BIT_MASK[i]=1 << i;
  }

  for (i=0; i<MODES_COUNT; i++) {
    pinMode(MODES[i], OUTPUT);
    digitalWrite(MODES[i], LOW);
  }

  for (i=0; i<OUTPUT_COUNT; i++) {
    pinMode(OUTPUTS[i], INPUT);
  }
}

void loop() {
}

void displayTestResult() {
  char output[128];
  Serial.println("Test results:");
  sprintf(output, " Scenarios passed: %lu", passCount);
  Serial.println(output);
  sprintf(output, " Scenarios failed: %lu", failCount);
  Serial.println(output);
  Serial.println("-------------------------------");
}

void runTest() {
  currentAddress = 0x0000;
  passCount = 0;
  failCount = 0;
  Serial.println();
  Serial.println("-------------------------------");
  Serial.println("Address decoder testing utility");
  Serial.print("Testing");
  while (true) {
    if (! (currentAddress & 0x07ff)) {
      Serial.print(".");
    }
    testAddress(currentAddress);
    if (currentAddress == 0xffff) {
      break;
    }
    currentAddress++;
  }
  Serial.println("done.");
}

void testAddress(uint16_t address) {
  setAddress(address);
  uint8_t modeVariants = 1 << MODES_COUNT;
  uint8_t outputs;
  for (currentMode = 0; currentMode<modeVariants; currentMode++) {
    setMode(currentMode);
    outputs=readOutputs();
    if (verifyOutputs(address, currentMode, outputs)) {
      passCount++;
    } else {
      failCount++;
      if (failCount < MAX_FAIL) {
        char message[128];
        Serial.println();
        sprintf(message, " Test failed at address %04x, in mode %02x, resulting in output %02x", address, currentMode, outputs);
        Serial.println(message);
      }
    }
  }
}

void setAddress(uint16_t address) {
  for(uint8_t i=0; i<ADDR_COUNT; i++) {
    bool bit =  address & BIT_MASK[i];
    if (bit != ADDR_VAL[i]) {
      digitalWrite(ADDR[i], bit ? HIGH : LOW);
      ADDR_VAL[i] = bit;
    }
  }
}

void setMode(uint8_t mode) {
  for(uint8_t i=0; i<MODES_COUNT; i++) {
    bool bit =  mode & BIT_MASK[i];
    digitalWrite(MODES[i], bit ? HIGH : LOW);
  }
}

uint8_t readOutputs() {
  uint8_t result=0;
  for (uint8_t i=0; i<OUTPUT_COUNT; i++) {
    if (digitalRead(OUTPUTS[i])) {
      result += BIT_MASK[i];
    }
  }
  return result;
}

bool verifyOutputs(uint16_t address, uint8_t mode, uint8_t outputs) {
  bool clk     = mode & BIT_MASK[IN_CLK];
  bool rwb     = mode & BIT_MASK[IN_RWB];
  bool exram   = mode & BIT_MASK[IN_EXRAM];
  bool web     = outputs & BIT_MASK[OUT_WEB];
  bool oeb     = outputs & BIT_MASK[OUT_OEB];
  bool ram1Csb = outputs & BIT_MASK[OUT_RAM1_CSB];
  bool ram2Csb = outputs & BIT_MASK[OUT_RAM2_CSB];
  bool romCsb  = outputs & BIT_MASK[OUT_ROM_CSB];
  bool ioCs    = outputs & BIT_MASK[OUT_IO_CS];

  bool ram1    = (address <= 0x7fff);
  bool ram2    = (address >= 0x8000 && address <= 0xbfff);
  bool rom     = (address >= 0xc000 && address <= 0xffff);
  bool io      = (address >= 0x0200 && address <= 0x02ff);

  bool exp_web     = !(clk && !rwb);
  bool exp_oeb     = !(clk && rwb);
  bool exp_ram1Csb = !(ram1 && !io);
  bool exp_ram2Csb = !(exram && ram2);
  bool exp_romCsb  = !(rom || (!exram && ram2));
  bool exp_ioCs    = io;

  return (web     == exp_web) && 
         (oeb     == exp_oeb) &&
         (ram1Csb == exp_ram1Csb) &&
         (ram2Csb == exp_ram2Csb) &&
         (romCsb  == exp_romCsb) &&
         (ioCs    == exp_ioCs);
}
