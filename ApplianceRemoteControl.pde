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
int output1 = 9;
int output2 = 10;
int output3 = 11;
int output4 = 12;

int buttonPressTime = 200;

void setup()
{
  // Open the serial connection to listen for commands from the host
  Serial.begin (38400);

  // Set up the pins as outputs
  pinMode(output1, OUTPUT);
  pinMode(output2, OUTPUT);
  pinMode(output3, OUTPUT);
  pinMode(output4, OUTPUT);

  // Make sure the outputs are all set LOW initally
  digitalWrite(output1, LOW);
  digitalWrite(output2, LOW);
  digitalWrite(output3, LOW);
  digitalWrite(output4, LOW);
}

void loop()
{
  byte val;

  // Check if a value has been sent by the host
  if (Serial.available()) {
    val = Serial.read();
    if (val == '1') {
      // Pulse the first button
      digitalWrite (output1, HIGH);
      delay (buttonPressTime);
      digitalWrite (output1, LOW);
    } else if (val == '2') {
      // Pulse the second button
      digitalWrite (output2, HIGH);
      delay (buttonPressTime);
      digitalWrite (output2, LOW);
    } else if (val == '3') {
      // Pulse the third button
      digitalWrite (output3, HIGH);
      delay (buttonPressTime);
      digitalWrite (output3, LOW);
    } else if (val == '4') {
      // Pulse the fourth button
      digitalWrite (output4, HIGH);
      delay (buttonPressTime);
      digitalWrite (output4, LOW);
    }
  }
}
