#include <Servo.h>

int count = 0;
char c;
String id;
Servo myservo;

void setup()
{
    Serial.begin(9600);
    myservo.attach(9);
    myservo.write(0);
    pinMode(13, OUTPUT);
    Serial.println("Please scan your RFID TAG");
}

void loop()
{
    while (Serial.available() > 0)
    {
        c = Serial.read();
        count++;
        id += c;
        if (count == 12)
        {
            Serial.print(id);
            // break;

            if (id == "AB123456789A") // Define valid tag id here
            {
                Serial.println("Valid TAG");
                digitalWrite(13, HIGH);
                myservo.write(180);
                delay(4000);
                myservo.write(0);
            }
            else
            {
                digitalWrite(13, LOW);
                Serial.println("Invalid TAG");
                myservo.write(0);
            }
        }
    }
    count = 0;
    id = "";
    delay(500);
}
