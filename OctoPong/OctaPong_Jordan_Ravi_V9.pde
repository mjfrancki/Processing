import processing.serial.*;

Serial port;
String data;
int groupNum;
char command;
Paddle[] user = new Paddle[10];
Circle[] pongBall = new Circle[50];
int timer[] = new int[10];
int thresh = 20;
int screenFix = 69;

int gameTime = 25;
int ballLevel =0;
int cLevel = 1; //current Level

Circle ball = new Circle(0, 0, 5, -5, 20);

float oldX, oldY;
int paddleOldX[] = new int[10];
int paddleOldY[] = new int[10];

int score[] = new int[10];
int hit;

void setup()
{
  size(screen.height-screenFix, screen.height-screenFix);
  port = new Serial(this, "COM9", 9600);
  port.bufferUntil('\n');
  //x, y, speed,width,height,color,zone,online
  user[1] = new Paddle(0, 10, 5, width/10, 10, color(#FF089D), 1, false);  
  user[2] = new Paddle(width/2, 10, 5, width/10, 10, color(#FFEB08), 2, false);
  user[3] = new Paddle(width-20, 0, 5, 10, height/10, color(#44FF08), 3, false);
  user[4] = new Paddle(width-20, height/2, 5, 10, height/10, color(#AB05FF), 4, false);
  user[5] = new Paddle(width/2, height-20, 5, width/10, 10, color(#FF0509), 5, false);
  user[7] = new Paddle(0, height-20, 5, width/10, 10, color(#1400FF), 7, false);  
  user[8] = new Paddle(10, height/2, 5, 10, height/10, color(#FF7C00), 8, false);
  user[9] = new Paddle(10, 0, 5, 10, height/10, color(#08F5FF), 9, false);

  ball.x = width/2 + random(-100, 100);
  ball.y = height/2 + random(-100, 100);
  
  for(int j = 0; j<50;j++) {
    pongBall[j] = new Circle (width/2 + random(-100,100), height/2 + random(-100,100), -5 + random(-3), -5 + random(-2), 20);
   }
    
}

void serialEvent(Serial port) {
  data = port.readStringUntil('\n');

  groupNum= int(str(data.charAt(0)));


  command = char(data.charAt(1));
  if (command == 'L' || command == 'l') {
    if (user[groupNum].on == false) // if the paddle is offline
    {
      user[groupNum].on = true; // go online
      if (groupNum == 1 || groupNum == 2 || groupNum == 5 || groupNum == 7)
      {
        user[groupNum].paddleW = width/10;
      }
      else {
        user[groupNum].paddleH = height/10;
      }
    }
    println("Group " + str(groupNum) + " went Left");
    user[groupNum].speed = -5; //move left or up
    timer[groupNum] = 0; //resets the timer
  }
  else if (command == 'r' || command == 'R') {
    println("Group " + str(groupNum) + " went Right");
    user[groupNum].speed = 5; // move right or down
    timer[groupNum] = 0; // reset timer
    if (user[groupNum].on == false) // if the paddle is offline
    {
      user[groupNum].on = true; // go online
      if (groupNum == 1 || groupNum == 2 || groupNum == 5 || groupNum == 7)
      {
        user[groupNum].paddleW = width/10;
      }
      else {
        user[groupNum].paddleH = height/10;
      }
    }
  }
  else if (command == 's' || command == 'S') {
    user[groupNum].on = false; //go online
    println("Group " + str(groupNum) + " is Offline");
  }

  for (int k=1;k<10;k++)
  {
    if (k!= 6)
    {
      if (k != groupNum && user[k].on == true)
      {
        timer[k] = timer[k] + 1; // increment all other timers
        if (timer[k] >= thresh) // if timer is greater than the threshold
        {
          timer[k] = 0; // reset the timer
          user[k].on = false; // go offline
          println("Group " + str(k) + " is Offline");
        }
      }
    }
  }
}

void draw() {
  background(0);
  for (int j=1; j<10; j++) {
    if (j!=6 )
    {
      if (user[j].on == true) { // if the paddle is online
        paddleOldX[j] = user[j].x;
        paddleOldY[j] = user[j].y;
        user[j].update(); // update the paddle
        if (j == 1 || j == 7)
        {
          if (user[j].x + user[j].paddleW > width/2 || user[j].x < 0)
          {
            user[j].x = paddleOldX[j];
          }
        }
        else if (j == 2 || j == 5)
        {
          if (user[j].x+ user[j].paddleW > width || user[j].x <width/2)
          {
            user[j].x = paddleOldX[j];
          }
        }
        else if (j == 3 || j == 9)
        {
          if (user[j].y + user[j].paddleH > height/2 || user[j].y <0)
          {
            user[j].y = paddleOldY[j];
          }
        }
        else {
          if (user[j].y + user[j].paddleH > height || user[j].y<height/2)
          {
            user[j].y = paddleOldY[j];
          }
        }
      }
      else {
        user[j].offline(); //run offline code
      }
    }
  }
  ball.update(); // update the ball
  textUpdate();
  gameTime ++;
  //println(str(gameTime/25));
  
  if ((gameTime/25) % 30 == 0) {
    ballLevel ++;
    cLevel ++;
    gameTime+=100;
    if (ballLevel == 50) {
      ballLevel = 49;
    }
  }
  for(int m = 0; m < ballLevel; m++) {
    pongBall[m].update();
  }
  
  
}

class Circle // create the class for the ball
{
  float x, y; // x,y location
  float xSpeed; // xspeed
  float ySpeed; // yspeed
  int diam; // diameter

  Circle(float iX, float iY, float iSX, float iSY, int iD)
  {
    x = iX;
    y = iY;
    xSpeed = iSX;
    ySpeed = iSY;
    diam = iD;
  }

  void update() //ball update
  {
    oldX = x; // draw the ball
    oldY = y;
    x += xSpeed;
    y += ySpeed;
    fill(255);
    ellipse(x, y, diam, diam);
    for (int e=1;e<10;e++)
    {
      if (e != 6)
      { // if the ball is inside a paddle
        if (x-10 <= user[e].x + user[e].paddleW && x+10 >= user[e].x && y+10 >= user[e].y && y-10 <= user[e].y+ user[e].paddleH)
        {
          if (e == 1 || e == 2 || e == 5 || e == 7) // if the paddle is on top or bottom
          {
            ySpeed = -ySpeed; //reverse y speed
            y= oldY;//back out of the paddle
            if (ySpeed >0)
            {
              ySpeed= random(2, 4);
            }
            else {
              ySpeed = random(-4, -2);
            }
          }
          else {
            xSpeed = -xSpeed; // reverse x speed
            x=oldX; // back out of the paddle
            if (xSpeed >0)
            {
              xSpeed= random(2, 4);
            }
            else {
              xSpeed = random(-4, -2);
            }
          }
        }
      }
    }
    if (y-10<=0 || y+10>= height || x-10<=0 || x+10>=height)
    {
      if (y-10 <=0) // tests if ball is outside of the screen
      {
        if (x<=width/2)
        {
          hit = 1;
        }
        else {
          hit = 2;
        }
      }
      else if (y+10 >= height)
      {
        if (x<=width/2)
        {
          hit = 5;
        }
        else {
          hit = 7;
        }
      }
      else if (x-10 <=0)
      {
        if (y<=height/2)
        {
          hit = 9;
        }
        else {
          hit = 8;
        }
      }
      else if (x+10 >= width)
      {
        if (y<=height/2)
        {
          hit = 3;
        }
        else {
          hit = 4;
        }
      }
      for (int t=1;t<10;t++) // increase score for everyone but the person who got hit
      {
        if (t != hit && t!= 6)
        {
          score[t]++;
        }
      }
      x = width/2 + random(-100, 100);
      y = height/2 + random(-100, 100);
      
    }
  }
}


class Paddle { //create paddle class
  int x, y;
  int speed;
  int paddleW, paddleH; // width, height
  color paddleC;
  int Zone;
  boolean on; // online or offline

  Paddle(int iX, int iY, int iS, int iW, int iH, color iC, int iZ, boolean iO) {
    x = iX;
    y = iY;
    speed = iS;
    paddleW = iW;
    paddleH = iH;
    paddleC = iC;
    Zone = iZ;
    on = iO;
    paddleC = iC;
  }

  void update() { // update paddle
    fill(paddleC);
    if (Zone == 1 || Zone == 2 || Zone == 5 | Zone == 7) { //if paddle is on top or bottom
      rect(x, y, paddleW, paddleH); // draw a rectangle
      if (Zone == 1 && (x+paddleW <= width/2 && x >=0 )) {// check boundaries
        x +=speed; // change x position
      }
      else if (Zone == 2 && (x <= width - paddleW && x >=width/2 )) {
        x +=speed;
      }
      else if (Zone == 7 && (x+paddleW <= width/2 && x >=0 )) {
        x +=speed;
      }
      else if (Zone == 5 &&  (x <= width - paddleW && x >=width/2 )) {
        x +=speed;
      }
    } 
    else { // sides
      rect(x, y+speed, paddleW, paddleH);
      if (Zone == 3 && (y+paddleH <= height/2 && y >=0 )) {
        y+=speed; //change y position
      }
      else if (Zone == 4 && (y <= height - paddleH && y >=height/2 )) {
        y+=speed;
      }
      else if (Zone == 9 && (y+paddleH <= height/2 && y >=0 )) {
        y+=speed;
      }
      else if (Zone == 8 &&  (y <= height - paddleH && y >=height/2 )) {
        y+=speed;
      }
    }
  }

  void offline() { // paddle is offline
    fill(paddleC);
    if (Zone == 1 || Zone == 7) // make paddles cover their entire zone
    {
      x=0;
      paddleW = width/2;
      rect(x, y, paddleW, paddleH);
      //paddleW = width/10;
    }
    else if (Zone == 5 || Zone == 2)
    {
      x=width/2;
      paddleW = width/2;
      rect(x, y, paddleW, paddleH);
      //paddleW = width/10;
    }
    else if (Zone == 9 || Zone == 3)
    {
      y=0;
      paddleH = height/2;
      rect(x, y, paddleW, paddleH);
      //paddleH = height/10;
    }
    else if (Zone == 8 || Zone == 4)
    {
      y= height/2;
      paddleH = height/2;
      rect(x, y, paddleW, paddleH);
      //paddleH = height/10;
    }
  }
}

void textUpdate()
{
      textSize(20);
      //fill(user[1].paddleC);
      text(str(score[1]) + " | Group: 1",width/4 - 55,50);
      //fill(user[2].paddleC);
      text(str(score[2]) + " | Group: 2",width/2+(width/4) - 55,50);
     // fill(user[3].paddleC);
      text(str(score[3]) + " | Group: 3",width - 110 -55,height/4);
     // fill(user[4].paddleC);
      text(str(score[4]) + " | Group: 4",width - 110-55,height/2+(height/4));
      //fill(user[5].paddleC);
      text(str(score[5]) + " | Group: 5",width/2+(width/4) - 55,height-50);
     // fill(user[7].paddleC);
      text(str(score[7]) + " | Group: 7",width/4 -55,height-50);
     // fill(user[8].paddleC);
      text(str(score[8]) + " | Group: 8",50,height/2+(height/4));
     // fill(user[9].paddleC);
      text(str(score[9]) + " | Group: 9",50,height/4);
      
      fill(255);
      textSize(50);
      text("Level: " + str(cLevel), width/2 - 75, height/2);
}

