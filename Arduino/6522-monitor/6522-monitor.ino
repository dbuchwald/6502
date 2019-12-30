char MODE[] = {52, 50, 48};
char DATA[] = {46, 44, 42, 40, 38, 36, 34, 32};
#define CLOCK 2

void setup() {
  for (int n = 0; n < 3; n += 1) {
    pinMode(MODE[n], INPUT);
  }
  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], INPUT);
  }
  pinMode(CLOCK, INPUT);
  
  attachInterrupt(digitalPinToInterrupt(CLOCK), onClock, RISING);
  
  Serial.begin(57600);
}

void onClock() {
  char output[15];

  unsigned int data = 0;
  for (int n = 7; n >=0; n--) {
    int bit = digitalRead(DATA[n]) ? 1 : 0;
    Serial.print(bit);
    data = (data << 1) + bit;
  }

  sprintf(output, "  %c %c %c %02x", digitalRead(MODE[0]) ? 'D' : 'C',
                                     digitalRead(MODE[1]) ? 'r' : 'W',
                                     digitalRead(MODE[2]) ? 'E' : 'e',
                                     data);
  Serial.println(output);  
}

void loop() {
//  Serial.print('Clock: ');
//  onClock();
//  delay(50);
}
