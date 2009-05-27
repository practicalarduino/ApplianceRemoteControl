/*
 * ApplianceControl
 *
 * Copyright 2009 Jonathan Oxer <jon@oxer.com.au>
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3.
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
 * http://www.practicalarduino.com/projects/easy/appliance-remote-control
 */

// Use pins 9 through 12 as the digital outputs
int outPut1 = 9;
int outPut2 = 10;
int outPut3 = 11;
int outPut4 = 12;

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

  // Make sure the outputs are all set LOW initally
  digitalWrite(outPut1, LOW);
  digitalWrite(outPut2, LOW);
  digitalWrite(outPut3, LOW);
  digitalWrite(outPut4, LOW);
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
      }
    }
  }
}
