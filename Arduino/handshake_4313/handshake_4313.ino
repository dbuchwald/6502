
const char MESSAGE[] = " Hello World (H/W HS)!";
const char DATA[] = {9, 10, 11, 12, 13, 14, 15, 16};
int idx = 0;

#define HS_DATA_TAKEN 5
#define HS_DATA_READY 1

void setup() {
  
  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], OUTPUT);
  }
  
  pinMode(HS_DATA_TAKEN, INPUT_PULLUP);
  pinMode(HS_DATA_READY, OUTPUT);
  digitalWrite(HS_DATA_READY, HIGH);

  attachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN), onDataTaken, FALLING);

}

void loop() {
}

void onDataTaken() {
  if (idx<strlen(MESSAGE)) {

    digitalWrite(HS_DATA_READY, HIGH);
  
    int mask = 1;
    for (int i=0; i<8; i++) {
      int bit = MESSAGE[idx] & mask;
      digitalWrite(DATA[i], bit ? HIGH : LOW);
      mask = mask << 1;
    }

    digitalWrite(HS_DATA_READY, LOW);
    digitalWrite(HS_DATA_READY, HIGH);
    idx++;
  }
}
