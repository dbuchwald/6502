
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
  digitalWrite(HS_DATA_READY, HIGH);

  attachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN), onDataTaken, FALLING);

  Serial.begin(57600);
}

void loop() {
}

void onDataTaken() {
  char msg[64];
  char bitbuffer[9];
  bitbuffer[8]=0;
  Serial.println("Interrupt invoked");

  if (idx<strlen(MESSAGE)) {

    digitalWrite(HS_DATA_READY, HIGH);
  
    int mask = 1;
    for (int i=0; i<8; i++) {
      int bit = MESSAGE[idx] & mask;
      if (bit) {
        bitbuffer[i]='1';
      } else {
        bitbuffer[i]='0';
      }
      digitalWrite(DATA[i], bit ? HIGH : LOW);
      mask = mask << 1;
    }

    sprintf(msg, "Writing %c (%s) to data bus...", MESSAGE[idx], bitbuffer);
    Serial.print(msg);

    digitalWrite(HS_DATA_READY, LOW);
    digitalWrite(HS_DATA_READY, HIGH);
    Serial.println("done.");
  
    idx++;
  }
}
