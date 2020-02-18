#include <PS2Keyboard.h>

const int DataPin = 4;
const int IRQpin =  2;
const int LedPin = 6;

PS2Keyboard keyboard;

void setup() {

  pinMode(LedPin, OUTPUT);
  digitalWrite(LedPin, LOW);

  delay(1000);
  keyboard.begin(DataPin, IRQpin);
  Serial.begin(19200);
  Serial.println("Ready!");
}

void loop() {
  if (keyboard.available()) {
    
    // read the next key
    char c = keyboard.read();
    digitalWrite(LedPin, HIGH);
    delay(500);
    digitalWrite(LedPin, LOW);
  }
}
