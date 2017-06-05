
int selectA = 7; // connect a push button switch between this pin and ground
int selectB = 6;// internal led, external LED, relay, trigger for other function, some other device, whatever.
int selectC = 5;
int in = 13;

void setup()
{
  pinMode(selectA,OUTPUT); // this pin controlled by flipflop() function
  pinMode(selectB,OUTPUT);
  pinMode(selectC,OUTPUT);
  
  pinMode(in,INPUT_PULLUP); // keeps pin HIGH via internal pullup resistor unless brought LOW with switch

  Serial.begin(9600); // just for debugging, not needed.
}

void loop()
{ 
  digitalWrite(selectA, LOW );
  digitalWrite(selectB, LOW );
  digitalWrite(selectC, LOW );

  if (digitalRead(in)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button0(); // hops out of main loop and runs the flipflop function
  }// end of check for button press.


 digitalWrite(selectA, LOW );
 digitalWrite(selectB, LOW );
 digitalWrite(selectC, HIGH );

  if (digitalRead(in)==LOW){ // check the state of switch1 every time we run through the main loop  
      delay(5); // I don't REALLY know why this delay helps, but it does. 
      button1(); // hops out of main loop and runs the flipflop function
  }// end of check for button press.


} // end of main loop.

void  button0(){  //funtion flipflop 
  
  Serial.print("Press 0  " );    // not needed, but may help to see what's happening.


  while(digitalRead(in)==LOW);
 
  delay(50);
}


void  button1(){  //funtion flipflop 
  
  Serial.print("Press 1  " );    // not needed, but may help to see what's happening.


  while(digitalRead(in)==LOW);
 
  delay(50);
}


