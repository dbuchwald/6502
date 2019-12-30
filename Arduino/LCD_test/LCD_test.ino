#define LCD_E 48
#define LCD_RS 52
#define LCD_RW 50

#define HD44780_CLEAR                 0x01

#define HD44780_HOME                  0x02

#define HD44780_ENTRY_MODE            0x04
  #define HD44780_EM_SHIFT_CURSOR     0
  #define HD44780_EM_SHIFT_DISPLAY    1
  #define HD44780_EM_DECREMENT        0
  #define HD44780_EM_INCREMENT        2

#define HD44780_DISPLAY_ONOFF         0x08
  #define HD44780_DISPLAY_OFF         0
  #define HD44780_DISPLAY_ON          4
  #define HD44780_CURSOR_OFF          0
  #define HD44780_CURSOR_ON           2
  #define HD44780_CURSOR_NOBLINK      0
  #define HD44780_CURSOR_BLINK        1

#define HD44780_DISPLAY_CURSOR_SHIFT  0x10
  #define HD44780_SHIFT_CURSOR        0
  #define HD44780_SHIFT_DISPLAY       8
  #define HD44780_SHIFT_LEFT          0
  #define HD44780_SHIFT_RIGHT         4

#define HD44780_FUNCTION_SET          0x20
  #define HD44780_FONT5x7             0
  #define HD44780_FONT5x10            4
  #define HD44780_ONE_LINE            0
  #define HD44780_TWO_LINE            8
  #define HD44780_4_BIT               0
  #define HD44780_8_BIT               16
  
#define HD44780_CGRAM_SET             0x40

#define HD44780_DDRAM_SET             0x80

char DATA[] = {46, 44, 42, 40, 38, 36, 34, 32};
bool MODE_RS;
bool MODE_RW;
bool DATA_BUS[8];

void setup() {
  // put your setup code here, to run once:
  pinMode(LCD_RS, OUTPUT);
  pinMode(LCD_RW, OUTPUT);
  pinMode(LCD_E, OUTPUT);
  Serial.begin(57600);
  delay(20);
  initScreen();
  writeText("Hello World and Merry Christmas and some other text to be used for testing!");
}

void loop() {
  // put your main code here, to run repeatedly:
}

void initScreen() {
  setCommandMode();
  rawWrite(0x3f);
  rawWrite(0x3f);
  rawWrite(0x3f);
  writeCommand(HD44780_FUNCTION_SET | HD44780_FONT5x7 | HD44780_TWO_LINE | HD44780_8_BIT);
  writeCommand(HD44780_DISPLAY_ONOFF | HD44780_DISPLAY_OFF);
  writeCommand(HD44780_CLEAR);
  writeCommand(HD44780_ENTRY_MODE | HD44780_EM_SHIFT_CURSOR | HD44780_EM_INCREMENT);
  writeCommand(HD44780_DISPLAY_ONOFF | HD44780_DISPLAY_ON | HD44780_CURSOR_ON | HD44780_CURSOR_BLINK);  
}

void writeText(char* message) {
  char* ptr = message;
  while (*ptr) {
    writeData(*ptr);
    ptr++;
  }
}

void writeCommand(unsigned char cmd) {
/*   
  char output[32];
  sprintf(output, '%02x', cmd);
  Serial.print('Writing command: ');
  Serial.println(output);
*/
  setCommandMode();
  rawWriteAndWait(cmd);
}

void writeData(unsigned char data) {
/*
  char output[32];
  sprintf(output, '%02x', data);
  Serial.print('Writing data: ');
  Serial.println(output);
*/
  setDataTransferMode();
  rawWriteAndWait(data);
}

void rawWriteAndWait(unsigned char data) {
  setWriteMode();
  sendByte(data);
  pulse();
  setReadMode();
  setCommandMode();
  unsigned char result = 0;
  do {
    pulse();
    result = readByte();
  } while (result & 0x80);
}

void rawWrite(unsigned char data) {
/*
  char output[32];
  sprintf(output, "Writing raw data: %02x", data); 
  Serial.println(output);
*/
  setWriteMode();
  sendByte(data);
  pulse();
}

void setDataTransferMode() {
  MODE_RS = true;
}

void setCommandMode() {
  MODE_RS = false;
}

void setWriteMode() {
  MODE_RW = false;
}

void setReadMode() {
  MODE_RW = true;
}

unsigned char readByte() {
  unsigned char result=0;
  for (int i=0; i<8; i++) {
    result = (result << 1) + (DATA_BUS[i] ? 1 : 0);
  }
  return 0;
}

void sendByte(unsigned char data)
{
/*
  char output[32];
  sprintf(output, "Sending data: %02x", data); 
  Serial.println(output);
*/
  unsigned int mask = 1;
  for (int i=0; i<8; i++) {
/*
    Serial.print(i);
    Serial.print(' ');
    Serial.print(mask);
    Serial.print(' ');
    Serial.print(data & mask);
*/
    DATA_BUS[i]=(data & mask)>0 ? true : false;
/*
    Serial.print(DATA_BUS[i] ? "true" : "false");
    Serial.println();
*/
    mask = mask << 1;
  }
}

void pulse() {
  char output[32];
  unsigned char value=0;
  for (int i=0; i<8; i++) {
    pinMode(DATA[i], MODE_RW ? INPUT : OUTPUT);   
  }
  if (!MODE_RW) {
    for (int i=0; i<8; i++) {
      digitalWrite(DATA[i], DATA_BUS[i] ? HIGH : LOW);
    }
  }  
  digitalWrite(LCD_RS, MODE_RS ? HIGH : LOW);
  digitalWrite(LCD_RW, MODE_RW ? HIGH : LOW);
  digitalWrite(LCD_E,  HIGH);
  if (MODE_RW) {
    for (int i=0; i<8; i++) {
      DATA_BUS[i] = digitalRead(DATA[i]);
    }
  }
  digitalWrite(LCD_E, LOW);
  sprintf(output, "RS: %c, RW: %c, DB: ", MODE_RS ? 'D' : 'C', MODE_RW ? 'r' : 'W');
  Serial.print(output);
  for (int i=7; i>=0; i--) {
    value = (value << 1) + (DATA_BUS[i] ? 1 : 0);
    Serial.print(DATA_BUS[i] ? '1' : '0');   
  }
  sprintf(output, ", D: %02x", value);
  Serial.println(output);
}
