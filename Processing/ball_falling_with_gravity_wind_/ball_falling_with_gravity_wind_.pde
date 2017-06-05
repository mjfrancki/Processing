float wind = 0.3;
float ySpeed = 0;
float xSpeed = 0;
float yPos = 50;
float xPos = 50;
boolean click = false;
boolean release;

void setup() {
  size(900, 600);
}

void draw() {
  background(0);
  ellipse(xPos, yPos, 30, 30);
  
  
  
  
  
  //-Physics Engine-//
  ySpeed += 0.82;
  yPos += ySpeed;
  xSpeed = xSpeed + wind; 
  xPos += xSpeed;
  
  
 
    if (mousePressed) {
   
    click = true;
    xPos = mouseX;
    yPos = mouseY;
   
  }
 
 //-Wall Collisions-//
  if (yPos > 585) {
    yPos = 584.9;
    ySpeed = ySpeed * -0.76; 
    xSpeed = xSpeed * 0.7;
  }
  if (xPos < 15) {
    xPos = 15.1;
    xSpeed = xSpeed * -0.7;
  }
  if (xPos > 885) {
    xPos = 884.9;
    xSpeed = xSpeed * -0.7;
  }
  
}
