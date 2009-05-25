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
 * http://www.practicalarduino.com/projects/easy/appliance-remote-control
 */

int outPut1 = 9;
int outPut2 = 10;
int outPut3 = 11;
int outPut4 = 12;

int buttonPressTime = 200;

void setup()
{
  // Open the serial connection to listen for commands
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
        digitalWrite (outPut1, HIGH);
        delay (buttonPressTime);
        digitalWrite (outPut1, LOW);
      }
   }
}
