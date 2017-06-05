#include <Wire.h>

int const button0 = 13;
int const button1 = 12;
int const button2 = 11;
int const button3 = 10;
int const button4 = 9;
int const button5 = 8;
int const button6 = 7;
int const button7 = 6;
int const button8 = 5;

void setup()
{

  pinMode(button0 ,INPUT_PULLUP); // keeps pin HIGH via internal pullup resistor unless brought LOW with switch
  pinMode(button1 ,INPUT_PULLUP);
  pinMode(button2 ,INPUT_PULLUP); // keeps pin HIGH via internal pullup resistor unless brought LOW with switch
  pinMode(button3 ,INPUT_PULLUP);
  pinMode(button4 ,INPUT_PULLUP); // keeps pin HIGH via internal pullup resistor unless brought LOW with switch
  pinMode(button5 ,INPUT_PULLUP);
  pinMode(button6 ,INPUT_PULLUP); // keeps pin HIGH via internal pullup resistor unless brought LOW with switch
  pinMode(button7 ,INPUT_PULLUP);
  pinMode(button8 ,INPUT_PULLUP);
  
  
  Serial.begin(9600); // just for debugging, not needed.
  Wire.begin();

}

void loop(){
  
   if (digitalRead(button0)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button0press();
   }
  
   if (digitalRead(button1)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button1press();
   }
   
    if (digitalRead(button2)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button2press();
   }
   
    if (digitalRead(button3)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button3press();
   }
    if (digitalRead(button4)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button4press();
   }
    if (digitalRead(button5)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button5press();
   }
    if (digitalRead(button6)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button6press();
   }
    if (digitalRead(button7)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button7press();
    }
   
    if (digitalRead(button8)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button8press();
   }
  
}



void button0press(){  
  
  Serial.print("8  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(8);
  Wire.endTransmission();

  while(digitalRead(button0)==LOW);
 
  delay(50);
}

void  button1press(){  
  
  Serial.print("5  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(5);
  Wire.endTransmission();

  while(digitalRead(button1)==LOW);
 
  delay(50);
}

void  button2press(){  
  
  Serial.print("2  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(2);
  Wire.endTransmission();

  while(digitalRead(button2)==LOW);
 
  delay(50);
}

void  button3press(){  
  
  Serial.print("7  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(7);
  Wire.endTransmission();

  while(digitalRead(button3)==LOW);
 
  delay(50);
}

void  button4press(){  
  
  Serial.print("4  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(4);
  Wire.endTransmission();

  while(digitalRead(button4)==LOW);
 
  delay(50);
}

void  button5press(){  
  
  Serial.print("1  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(1);
  Wire.endTransmission();

  while(digitalRead(button5)==LOW);
 
  delay(50);
}

void  button6press(){  
  
  Serial.print("6  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(6);
  Wire.endTransmission();

  while(digitalRead(button6)==LOW);
 
  delay(50);
}

void  button7press(){  
  
  Serial.print("3  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(3);
  Wire.endTransmission();

  while(digitalRead(button7)==LOW);
 
  delay(50);
}

void  button8press(){  
  
  Serial.print("0  " );    // not needed, but may help to see what's happening.

  Wire.beginTransmission(5);
  Wire.write(0);
  Wire.endTransmission();

  while(digitalRead(button8)==LOW);
 
  delay(50);
}
