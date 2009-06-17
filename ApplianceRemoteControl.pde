/*
 * ApplianceControl
 *
 * Waits for control values to be sent via the serial connection and
 * pulses digital outputs to trigger the buttons on an appliance remote
 * control. Outputs are pulsed for 200ms to simulate manually pressing
 * a button.
 *
 * The number of outputs can be trivially varied to suit your needs.
 *
 * This sketch is a very simple and useful building block for any
 * project where you need to use an Arduino as an intermediary to link
 * together a host computer and a physical device for automated
 * control.
 *
 * Copyright 2009 Jonathan Oxer <jon@oxer.com.au>
 * http://www.practicalarduino.com/projects/easy/appliance-remote-control
 */

// Use pins 5 through 12 as the digital outputs
int outPut1 = 5;
int outPut2 = 6;
int outPut3 = 7;
int outPut4 = 8;
int outPut5 = 9;
int outPut6 = 10;
int outPut7 = 11;
int outPut8 = 12;

int buttonPressTime = 200;

void setup()
{
  // Open the serial connection to listen for commands from the host
  Serial.begin (38400);

  // Set up the pins as outputs
  pinMode(outPut1, OUTPUT);
  pinMode(outPut2, OUTPUT);
  pinMode(outPut3, OUTPUT);
  pinMode(outPut4, OUTPUT);
  pinMode(outPut5, OUTPUT);
  pinMode(outPut6, OUTPUT);
  pinMode(outPut7, OUTPUT);
  pinMode(outPut8, OUTPUT);

  // Make sure the outputs are all set LOW initally
  digitalWrite(outPut1, LOW);
  digitalWrite(outPut2, LOW);
  digitalWrite(outPut3, LOW);
  digitalWrite(outPut4, LOW);
  digitalWrite(outPut5, LOW);
  digitalWrite(outPut6, LOW);
  digitalWrite(outPut7, LOW);
  digitalWrite(outPut8, LOW);
}

void loop()
{
  byte val;

  // Check if a value has been sent by the host
  if (Serial.available()) {
    val = Serial.read();
    // If the value is "-1" there's no data on the port
    if (val != -1) {
      if (val == '1') {
        // Pulse the first button
        digitalWrite (outPut1, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut1, LOW);
      } else if (val == '2') {
        // Pulse the second button
        digitalWrite (outPut2, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut2, LOW);
      } else if (val == '3') {
        // Pulse the third button
        digitalWrite (outPut3, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut3, LOW);
      } else if (val == '4') {
        // Pulse the fourth button
        digitalWrite (outPut4, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut4, LOW);
      } else if (val == '5') {
        // Pulse the fifth button
        digitalWrite (outPut5, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut5, LOW);
      } else if (val == '6') {
        // Pulse the sixth button
        digitalWrite (outPut6, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut6, LOW);
      } else if (val == '7') {
        // Pulse the seventh button
        digitalWrite (outPut7, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut7, LOW);
      } else if (val == '8') {
        // Pulse the eighth button
        digitalWrite (outPut8, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut8, LOW);
      }
    }
  }
}
