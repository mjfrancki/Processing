Tank PlayerOne;
Tank PlayerTwo;
float PowerMax = 30;
boolean fire = false;
int level = 2;
boolean PlayerOneTurn = true;
float distance = 0;
float hitCheck = 0;
float hitCheckTwo = 0;
PVector mouse;

float wallXpos=0;
float wallYpos=0;
float wallWidth=0;
float wallHieght=0;


float acc=0;
float dx=0;
float massspeed=0;
float masspos=0;


void setup() {
  size(1000, 800); 

  mouse = new PVector(0, 0);


  PlayerOne = new Tank(100, 700, 0, 0, 0, 0, 0, 0, 0,0, false);
  PlayerTwo = new Tank(900, 700, 0, 0, 0, 0, 0, 0, 0,0, false);

  PlayerOne.TankSetup();
  PlayerTwo.TankSetup();
}//close set up


void draw() {
  background(255);

if (level == 1){
 PowerMax = 50;
wallXpos=475;
wallYpos=400;
 wallWidth=50;
wallHieght=400;
  strokeWeight(2); 
  rect(wallXpos, wallYpos, wallWidth, wallHieght);

if (PlayerOneTurn == true) {
 PlayerOne.wallhit();
}
if (PlayerOneTurn == false) {
 PlayerTwo.wallhit();
}
}




if (PlayerOne.hit==false){
  PlayerOne.display();

}

if (PlayerTwo.hit==false){
  PlayerTwo.display();

}


if((PlayerOne.hit==true)||(PlayerTwo.hit==true)){
  

PlayerOne.hit=false;
PlayerTwo.hit=false;

}


if (level == 1){
 PowerMax = 50;
wallXpos=475;
wallYpos=400;
 wallWidth=50;
wallHieght=400;
  strokeWeight(2); 
  rect(wallXpos, wallYpos, wallWidth, wallHieght);
}


if (level == 2){
 PowerMax = 50;
wallXpos=475;
wallYpos=550-(masspos);
 wallWidth=50;
wallHieght=1000;
  

  
   dx = masspos-300;
   acc= (-1)*(dx)*(0.009);
   massspeed = massspeed + acc;
   masspos += massspeed;
  

  
  strokeWeight(2); 
  rect(wallXpos, wallYpos, wallWidth, wallHieght);

if (PlayerOneTurn == true) {
 PlayerOne.wallhit();
}
if (PlayerOneTurn == false) {
 PlayerTwo.wallhit();
}

}



 mouse.x= mouseX;
  mouse.y= mouseY;
PlayerOne.hitSelf();
PlayerTwo.hitSelf();
PlayerOne.hitOpponent();
PlayerTwo.hitOpponent();


  if (mousePressed == true) {

    if (PlayerOneTurn == true) {

      PlayerOne.FirePrep();
    }

    if (PlayerOneTurn == false) {

      PlayerTwo.FirePrep();
    }
  }



  if (fire == true) {

    if (PlayerOneTurn == true) {

      PlayerOne.Fire();
    }

    if (PlayerOneTurn == false) {

      PlayerTwo.Fire();
    }
  }


  if (PlayerOneTurn == true) {

    PlayerOne.miss();
  }

  if (PlayerOneTurn == false) {

    PlayerTwo.miss();
  }
}//close draw

void keyPressed() {

  if (fire == false) {

    if (PlayerOneTurn == true) {

      PlayerOne.aim();
    }

    if (PlayerOneTurn == false) {

      PlayerTwo.aim();
    }
  }
} //close void KeyPressed

void mouseReleased() {

 if (fire == false) {
  if (PlayerOneTurn == true) {
    PlayerOne.trigger();
  }


  if (PlayerOneTurn == false) {
    PlayerTwo.trigger();
  }


 }
} // close void mouseReleased


class Wall{
  
  
  
} //close wall class 



class Tank {

  float distance;

  float xpos;
  float ypos;
  float xbarrel;
  float ybarrel;
  float theta; 
  float bulletXpos;
  float bulletYpos;
  float bulletXspeed;
  float bulletYspeed;
  int score;
  boolean hit;


  Tank(float xpos_, float ypos_, float xbarrel_, float ybarrel_, float theta_, float bulletXpos_, float bulletYpos_, float bulletXspeed_, float bulletYspeed_, int score_ ,boolean hit_) {
    xpos = xpos_;
    ypos = ypos_;
    xbarrel = xbarrel_;
    ybarrel = ybarrel_;
    theta = theta_;
    bulletXpos = bulletXpos_;
    bulletYpos = bulletYpos_;
    bulletXspeed = bulletXspeed_;
    bulletYspeed = bulletYspeed_;
    score = score_;
    hit = hit_;
  } //close tank constructer 

  void TankSetup() {

    xbarrel = xpos + 30;
    ybarrel = ypos;
    bulletXpos = xbarrel;
    bulletYpos = ybarrel;
  } //close void Tanksetup

  void aim() {

    if (key == CODED) {
      if (keyCode == UP) {
        theta=theta+0.1;
      }
      else if (keyCode == DOWN) {
        theta=theta-0.1;
      } 

      xbarrel=cos(theta)*30 + xpos;
      ybarrel=sin(theta)*30 + ypos;
      bulletXpos=cos(theta)*30 + xpos;
      bulletYpos=sin(theta)*30 + ypos;
    }
  } //close void aim


  void trigger() {
    fire = true; 
    bulletXspeed = (((xbarrel - xpos)/(30))* (distance));
    bulletYspeed = (((ybarrel - ypos)/(30))* (distance));
  
} //viod close viod trigger 

  void FirePrep() { 

    ellipse(xbarrel, ybarrel, 5, 5);
    strokeWeight(1); 
    line(xpos, ypos, mouse.x, mouse.y);


    distance = sqrt(sq(mouse.x - xpos)+sq(mouse.y - ypos));
    distance = map(distance, 0, 1000, 1, PowerMax); 

   
  } //close firePrep



  void Fire() {


    bulletYspeed += 0.82;
    // bulletXspeed = bulletXspeed * 9.8;

    bulletXpos = bulletXpos + bulletXspeed ;
    bulletYpos = bulletYpos + bulletYspeed ;
  }// close void fire


  void display() {


    fill(200, 0, 0);
    strokeWeight(2); 
    ellipse(xpos, ypos, 30, 30);
    ellipse(bulletXpos, bulletYpos, 5, 5);
    strokeWeight(6); 
    line(xpos, ypos, xbarrel, ybarrel);
  
textSize(10);
text("Player One Score:", 10, 10);
text("Player two Score:", 500, 10);
text("Level:", 750, 10);

text(PlayerOne.score, 110, 10);
text(PlayerTwo.score, 600, 10);
text(level, 780, 10);


} //close void display


  void miss() {

    if ((bulletXpos > width) || (bulletXpos < 0) || (bulletYpos > height) || (bulletYpos < 0)) {

      PlayerOneTurn = !PlayerOneTurn;

      fire = false;


bulletXspeed=0;
bulletYspeed=0;
bulletXpos = xbarrel;
bulletYpos = ybarrel;
   
  }
  

} //close void miss



  void hitSelf() {

  hitCheck = sqrt(sq(xpos-bulletXpos)+sq(ypos-bulletYpos));

if (hitCheck < 15) {
 hit = true; 
score --;
 level++;
 bulletXpos = xbarrel;
 bulletYpos = ybarrel;
 bulletXspeed=0;
 bulletYspeed=0;
fire =false;



}



} //close void hitSelf

void hitOpponent(){
 

     hitCheck = sqrt(sq(PlayerTwo.xpos-PlayerOne.bulletXpos)+sq(PlayerTwo.ypos-PlayerOne.bulletYpos));
    
     hitCheckTwo = sqrt(sq(PlayerOne.xpos-PlayerTwo.bulletXpos)+sq(PlayerOne.ypos-PlayerTwo.bulletYpos));

  if (hitCheck < 15){
    PlayerTwo.hit=true;
    PlayerOne.score++;
  
 level++;
 PlayerOne.bulletXpos = PlayerOne.xbarrel;
 PlayerOne.bulletYpos = PlayerOne.ybarrel;
fire =false;
 



}
  
   if (hitCheckTwo < 15){
    PlayerOne.hit=true;
    PlayerTwo.score++;
   
   level++;
 PlayerTwo.bulletXpos = PlayerTwo.xbarrel;
 PlayerTwo.bulletYpos = PlayerTwo.ybarrel;
fire =false;





} 

}

void wallhit(){                          
 
  
  if((bulletXpos > wallXpos) && (bulletXpos < wallXpos + wallWidth) && (bulletYpos > wallYpos) && (bulletYpos < wallYpos + wallHieght)) {
 
   bulletXpos = xbarrel;
   bulletYpos = ybarrel;
   bulletXspeed=0;
   bulletYspeed=0;
   fire =false;
 
 PlayerOneTurn = !PlayerOneTurn;   
  }
  
  
}

} //close tank class

