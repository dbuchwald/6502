#define CLOCK          2
#define ROM_CSB        53
#define ROM_OEB        51
#define RAM_CSB        49
#define RAM_OEB        47
#define VIA1_CS1       45
#define VIA1_CS2B      43
#define VIA2_CS1       41
#define VIA2_CS2B      39

#define RANGES_COUNT   4

#define QUICK_SCAN     0
#define FULL_SCAN      1
#define MAX_FAIL_COUNT 10

const char ADDR[] = {52, 50, 48, 46, 44, 42, 40, 38, 36, 34, 32, 30, 28, 26, 24, 22};

word ADDR_MASK[16];

bool ADDR_VAL[16];

int operationMode = FULL_SCAN;
int failCount = 0;

/* V1 Starts here */
/*
word RANGE_START[]        = {0x0000, 0x4000, 0x6000, 0x8000};
word RANGE_END[]          = {0x3fff, 0x5fff, 0x7fff, 0xffff};
*/
/* V1 Ends here */
/* V2 Starts here */
/*
word RANGE_START[]        = {0x0000, 0x8000, 0xa000, 0xc000};
word RANGE_END[]          = {0x7fff, 0x9fff, 0xbfff, 0xffff};
*/
/* V2 Ends here */

/* Extended Starts here */
word RANGE_START[]        = {0x0000, 0x8800, 0x9000, 0xa000};
word RANGE_END[]          = {0x7fff, 0x880f, 0x900f, 0xffff};
/* Extended Ends here */

/* V1 & V2 Start here */
int  RANGE_TESTED[]       = {0,      0,      0,      0};
int  RANGE_PASSED[]       = {0,      0,      0,      0};
int  RANGE_FAILED[]       = {0,      0,      0,      0};

bool EXPECT_ROM_ENABLE[]  = {false,  false,  false,  true};
bool EXPECT_RAM_ENABLE[]  = {true,   false,  false,  false};
bool EXPECT_VIA1_ENABLE[] = {false,  false,  true,   false};
bool EXPECT_VIA2_ENABLE[] = {false,  true,   false,  false};
/* V1 & V2 Ends here */

word currentAddress;
bool readROMCSB, readROMOEB, readRAMCSB, readRAMOEB, readVIA1CS1, readVIA1CS2B, readVIA2CS1, readVIA2CS2B;
bool currentROMStatus;
bool currentRAMStatus;
bool currentVIA1Status;
bool currentVIA2Status;
bool currentTestResult;

void setup() {

  setupAddrMasks();
  
  setupPinModes();

  setupDefaultOutput();
  
  Serial.begin(57600);

  currentAddress = 0x0000;

  displayTestSetup();

  runTest();

  displayTestResult();
}

void setupAddrMasks() {
  word mask = 1;
  for (int i=0; i<16; i++) {
    ADDR_MASK[i] = mask;
    mask = mask << 1;
  }
}

void setupPinModes() {
  
  for (int i=0; i<16; i++) {
    pinMode(ADDR[i], OUTPUT);
  }
  pinMode(CLOCK, OUTPUT);

  pinMode(ROM_CSB, INPUT);
  pinMode(ROM_OEB, INPUT);

  pinMode(RAM_CSB, INPUT);
  pinMode(RAM_OEB, INPUT);

  pinMode(VIA1_CS1, INPUT);
  pinMode(VIA1_CS2B, INPUT);  

  pinMode(VIA2_CS1, INPUT);
  pinMode(VIA2_CS2B, INPUT);  
}

void setupDefaultOutput() {
  for(int i=0; i<16; i++) {
    digitalWrite(ADDR[i], LOW);
    ADDR_VAL[i] = false;
  }
}

void loop() {
}

void displayTestSetup() {
  char output[128];
  Serial.print("Testing mode: ");
  Serial.println(operationMode==QUICK_SCAN ? "QUICK" : "FULL");
  Serial.println("Ranges:");
  for (int i=0; i<RANGES_COUNT; i++) {
    sprintf(output, "  Range %d: %04x-%04x, size: %u bytes, type: ", i, 
            RANGE_START[i], RANGE_END[i], RANGE_END[i]-RANGE_START[i]+1);
    Serial.print(output);
    if (EXPECT_ROM_ENABLE[i]) {
      Serial.print("ROM ");
    }
    if (EXPECT_RAM_ENABLE[i]) {
      Serial.print("RAM ");
    }
    if (EXPECT_VIA1_ENABLE[i]) {
      Serial.print("VIA1 ");
    }
    if (EXPECT_VIA2_ENABLE[i]) {
      Serial.print("VIA2 ");
    }
    if (!EXPECT_ROM_ENABLE[i] &&
        !EXPECT_RAM_ENABLE[i] &&
        !EXPECT_VIA1_ENABLE[i] &&
        !EXPECT_VIA2_ENABLE[i]) {
      Serial.print("Not used ");
    }
    Serial.println();
  }
  Serial.println("------------------------------------");
  Serial.println("Testing:");
}

void displayTestResult() {
  char output[128];
  Serial.println("------------------------------------");
  Serial.println("Test results (tested/passed/failed):");
  for (int i=0; i<RANGES_COUNT; i++) {
    sprintf(output, "  Range %d: %u/%u/%u", i, RANGE_TESTED[i], RANGE_PASSED[i], RANGE_FAILED[i]);
    Serial.println(output);
  }
}

void runTest() {
  for (int range = 0; range<RANGES_COUNT; range++) {
    if (operationMode == QUICK_SCAN) {
      testAddress(RANGE_START[range], range);
      testAddress(RANGE_END[range], range);
    } else {
      for (word addr = RANGE_START[range]; addr<RANGE_END[range]; addr++) {
        testAddress(addr, range);
      }
      testAddress(RANGE_END[range], range);
    }
  }
}

void testAddress(const word address, const int range) {
  setAddress(address);

  pulseAndProbe();

  currentROMStatus = calculateRomEnable(readROMCSB, readROMOEB);
  currentRAMStatus = calculateRamEnable(readRAMCSB, readRAMOEB);
  currentVIA1Status = calculateViaEnable(readVIA1CS1, readVIA1CS2B);
  currentVIA2Status = calculateViaEnable(readVIA2CS1, readVIA2CS2B);

  if (currentROMStatus == EXPECT_ROM_ENABLE[range] &&
      currentRAMStatus == EXPECT_RAM_ENABLE[range] &&
      currentVIA1Status == EXPECT_VIA1_ENABLE[range] &&
      currentVIA2Status == EXPECT_VIA2_ENABLE[range]) {
    currentTestResult = true;
    RANGE_PASSED[range]++;
  } else {
    currentTestResult = false;
    RANGE_FAILED[range]++;
    failCount++;
  }
  RANGE_TESTED[range]++;

  if ((!currentTestResult && failCount<MAX_FAIL_COUNT) || 
      currentAddress==RANGE_START[range] || 
      currentAddress==RANGE_END[range]) {
    sendResult();
  }
}

void setAddress(const word address) {
  currentAddress=address;
  for(int i=0; i<16; i++) {
    bool bit = address & ADDR_MASK[i];
    if (bit != ADDR_VAL[i]) {
      digitalWrite(ADDR[i], bit ? HIGH : LOW);
      ADDR_VAL[i] = bit;
    }
  }
}

void pulseAndProbe() {
  digitalWrite(CLOCK, HIGH);
  readROMCSB   = digitalRead(ROM_CSB);
  readROMOEB   = digitalRead(ROM_OEB);
  readRAMCSB   = digitalRead(RAM_CSB);
  readRAMOEB   = digitalRead(RAM_OEB);
  readVIA1CS1  = digitalRead(VIA1_CS1);
  readVIA1CS2B = digitalRead(VIA1_CS2B);
  readVIA2CS1  = digitalRead(VIA2_CS1);
  readVIA2CS2B = digitalRead(VIA2_CS2B);
  digitalWrite(CLOCK, LOW);
}

void sendResult() {
  char output[128];
  char address[17] = "";

  sprintf(address, "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 
          ADDR_VAL[15] ? '1' : '0',
          ADDR_VAL[14] ? '1' : '0',
          ADDR_VAL[13] ? '1' : '0',
          ADDR_VAL[12] ? '1' : '0',
          ADDR_VAL[11] ? '1' : '0',
          ADDR_VAL[10] ? '1' : '0',
          ADDR_VAL[9] ? '1' : '0',
          ADDR_VAL[8] ? '1' : '0',
          ADDR_VAL[7] ? '1' : '0',
          ADDR_VAL[6] ? '1' : '0',
          ADDR_VAL[5] ? '1' : '0',
          ADDR_VAL[4] ? '1' : '0',
          ADDR_VAL[3] ? '1' : '0',
          ADDR_VAL[2] ? '1' : '0',
          ADDR_VAL[1] ? '1' : '0',
          ADDR_VAL[0] ? '1' : '0');

  sprintf(output, "  Address %04x (%s) ROM:%c(%c%c) RAM:%c(%c%c) VIA1:%c(%c%c) VIA2:%c(%c%c) - %s", 
          currentAddress, address,
          currentROMStatus ? '+' : '-',
          readROMCSB ? '1' : '0', readROMOEB ? '1' : '0',
          currentRAMStatus ? '+' : '-',
          readRAMCSB ? '1' : '0', readRAMOEB ? '1' : '0',
          currentVIA1Status ? '+' : '-',
          readVIA1CS1 ? '1' : '0', readVIA1CS2B ? '1' : '0',
          currentVIA2Status ? '+' : '-',
          readVIA2CS1 ? '1' : '0', readVIA2CS2B ? '1' : '0',
          currentTestResult ? "Passed" : "Failed");

  Serial.println(output);
}

bool calculateRomEnable(const bool romCSB, const bool romOEB) {
  return !romCSB && !romOEB;
}

bool calculateRamEnable(const bool ramCSB, const bool ramOEB) {
  return !ramCSB && !ramOEB;
}

bool calculateViaEnable(const bool viaCS1, const bool viaCS2B) {
  return viaCS1 && !viaCS2B;
}
