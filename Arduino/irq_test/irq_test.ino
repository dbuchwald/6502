#define IRQ_PIN 2

void setup() {
  
  pinMode(IRQ_PIN, INPUT);

  attachInterrupt(digitalPinToInterrupt(IRQ_PIN), onIrq, FALLING);

  Serial.begin(57600);

}

void loop() {
}

void onIrq() {
  Serial.println("IRQ triggered");
}
