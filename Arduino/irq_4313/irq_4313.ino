#define HS_DATA_TAKEN 5

void setup() {

  pinMode(9, OUTPUT);
  pinMode(5, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(HS_DATA_TAKEN), onDataTaken, FALLING);

}

void loop() {
}

void onDataTaken() {
  digitalWrite(9, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(9, LOW);    // turn the LED off by making the voltage LOW
}
