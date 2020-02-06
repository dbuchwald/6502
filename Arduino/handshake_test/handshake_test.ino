
const char MESSAGE[] = "Hello World (H/W HS)!";
const char DATA[] = {39, 41, 43, 45, 47, 49, 51, 53};
int idx = 0;

#define HS_DATA_TAKEN 2
#define HS_DATA_READY 3

void setup() {
  
  for (int n = 0; n < 8; n += 1) {
    pinMode(DATA[n], OUTPUT);
  }
  
  pinMode(HS_DATA_TAKEN, INPUT);
  pinMode(HS_DATA_READY, OUTPUT);

  attachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN), onDataTaken, FALLING);

  Serial.begin(57600);
}

void loop() {
}

void onDataTaken() {
  char msg[64];
  Serial.println("Interrupt invoked");

  digitalWrite(HS_DATA_READY, HIGH);

  if (idx<strlen(MESSAGE)) {

    int mask = 1;
    for (int i=0; i<8; i++) {
      int bit = MESSAGE[idx] & mask;
      digitalWrite(DATA[i], bit ? HIGH : LOW);
      mask << 1;
    }

    sprintf(msg, "Writing %c to data bus...", MESSAGE[idx]);
    Serial.print(msg);

    delay(1000);
  
    digitalWrite(HS_DATA_READY, LOW);
    Serial.println("done.");
  
    idx++;
  }
}
