#include <ESP8266WiFi.h>
int LED = D7;
int PIRSensor = D6;
int PIRValue;

void setup()
{
  pinMode(LED, OUTPUT); // Make LED pin an output pin
  pinMode(PIRSensor, INPUT); // Make PIRSensor pin an input pin
  Serial.begin(115200);
  Serial.println();

  WiFi.begin("UPCAOL", "OAASMMAA");

  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() 
{
  delay(1000); // Wait 1 second
  //read the state of the sensor
  PIRValue = digitalRead(PIRSensor);
  //LOW = no motion. HIGH = motion detected
  
  Serial.println(PIRValue);
  if (PIRValue == LOW)
  {
    Serial.println("No motion");
    digitalWrite(LED, LOW); // LED off
  }
  else
  {
    Serial.println("Motion detected  ALARM");
    digitalWrite(LED, HIGH); // LED on
  }
}
