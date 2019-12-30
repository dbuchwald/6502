int counter = 0;
int last_counter = 0;

#define BUTTON 2

void setup() {
  pinMode(BUTTON, INPUT);

  attachInterrupt(digitalPinToInterrupt(BUTTON), onButton, RISING);

  Serial.begin(57600);
}

void onButton() {
  counter ++;
}

void loop() {
  // put your main code here, to run repeatedly:
  if (last_counter<counter) {
    Serial.println(last_counter=counter);
  }
  delay(100);
}
