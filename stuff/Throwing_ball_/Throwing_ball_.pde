
//click move and release mouse to throw   

float ySpeed = 0;
float xSpeed = 0;
float yPos = 50;
float xPos = 50;
float StartxPos=0;
float StartyPos=0;
float LaunchxPos=0;
float LaunchyPos=0;

boolean launch = false;
boolean checkForStartPos = true;


int WindowWidth = 1000;
int WindowHeight = 500;
int eclipseWidth = 30;
int eclipseHeight = 30;

void setup() {
  size(WindowWidth, WindowHeight);
}

void draw() {
  background(100, 180, 255);


  fill(255, 20, 20);
  ellipse(xPos, yPos, eclipseWidth, eclipseHeight);

  if (mousePressed == false) {
    ySpeed += 0.82;
    yPos += ySpeed;
    xSpeed = xSpeed * 0.98;
    xPos += xSpeed;
  }

//wall bounces 
  if (yPos > 485) {
    yPos = 484.9;
    ySpeed = ySpeed * - 0.76; 
    xSpeed = xSpeed * 0.8;
  }

  if (xPos < 15) {
    xPos = 15.1;
    xSpeed = xSpeed * -0.8;
  }
  if (xPos > 985) {
    xPos = 984.9;
    xSpeed = xSpeed * -0.8;
  }

//sets ball pos to mouse pos
  if (mousePressed) {
    xPos = mouseX;
    yPos = mouseY;

//records ball pos
    if ( checkForStartPos == true) {
      StartxPos= mouseX;
      StartyPos= mouseY;
    }
    checkForStartPos = false;
  }
}


void mouseReleased()
{
//records new bal pos
  LaunchxPos = mouseX;
  LaunchyPos = mouseY;


//finds direcrion of throw 
  xSpeed = ((LaunchxPos-StartxPos)/(5));
  ySpeed = ((LaunchyPos-StartyPos)/(5));

  checkForStartPos = true;
}

