#include <PS2Keyboard.h>

const char DATA[] = {39, 41, 43, 45, 47, 49, 51, 53};

#define HS_DATA_TAKEN 2
#define HS_DATA_READY 4

const int DataPin = 3;
const int IRQpin =  2;

PS2Keyboard keyboard;

void setup() {

  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], OUTPUT);
    digitalWrite(DATA[n], LOW);    
  }
  
  pinMode(HS_DATA_TAKEN, INPUT_PULLUP);
  pinMode(HS_DATA_READY, OUTPUT);
  digitalWrite(HS_DATA_READY, HIGH);

  //attachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN), onDataTaken, FALLING);
  //detachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN));
  
  //delay(1000);
  keyboard.begin(DataPin, IRQpin);
  Serial.begin(57600);
  Serial.println("Keyboard Test:");
}

void loop() {
  if (keyboard.available()) {
    
    // read the next key
    char c = keyboard.read();
    // check for some of the special keys
    if (c == PS2_ENTER) {
      Serial.println();
    } else if (c == PS2_TAB) {
      Serial.print("[Tab]");
    } else if (c == PS2_ESC) {
      Serial.print("[ESC]");
    } else if (c == PS2_PAGEDOWN) {
      Serial.print("[PgDn]");
    } else if (c == PS2_PAGEUP) {
      Serial.print("[PgUp]");
    } else if (c == PS2_LEFTARROW) {
      Serial.print("[Left]");
    } else if (c == PS2_RIGHTARROW) {
      Serial.print("[Right]");
    } else if (c == PS2_UPARROW) {
      Serial.print("[Up]");
    } else if (c == PS2_DOWNARROW) {
      Serial.print("[Down]");
    } else if (c == PS2_DELETE) {
      Serial.print("[Del]");
    } else {
      
      // otherwise, just print all normal characters
      Serial.print(c);
    }
    Serial.println();
    //sendChar(c);
  }
}

void sendChar(char c)
{
  char msg[64];
  char bitbuffer[9];
  bitbuffer[8]=0;

  digitalWrite(HS_DATA_READY, HIGH);

  int mask = 1;
  for (int i=0; i<8; i++) {
    int bit = c & mask;
    if (bit) {
      bitbuffer[7-i]='1';
    } else {
      bitbuffer[7-i]='0';
    }
    digitalWrite(DATA[i], bit ? HIGH : LOW);
    mask = mask << 1;
  }
  sprintf(msg, "Writing %c (%s) to data bus...", c, bitbuffer);
  Serial.print(msg);

  digitalWrite(HS_DATA_READY, LOW);
  digitalWrite(HS_DATA_READY, HIGH);
  Serial.println("done.");
}
