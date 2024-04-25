function setup() {
  pinMode(0, INPUT);
  pinMode(1, OUTPUT);
}
function loop() {
  var humid = analogRead(0);
  Serial.println(humid);
  if (humid >= 500) {
    digitalWrite(1, HIGH);
  } else {
  }
}

digitalWrite(1, LOW);
