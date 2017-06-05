//READ ME
//place blue cups on black surface (other surfaces that arent blue or green should work to) with a web cam pionting down on it reavel a green ball cover it 
//with a cup mix the cups up without covering  the top of the cuos with your hands. Feel free to reavel the ball and switch wihch cup its under while mixing, 
//press up when you want the computer to reavel which cup the ball is under  

import processing.video.*;

Capture cam;

int boxsize = 40; //side length of thesquare that it look for the blue cup in 
// x and y location of the midle of the same square 
int middleOfBoxX =0; 
int middleOfBoxY =0;

boolean ballFound = false; //checks if it has found the ball yet 
boolean ballLost = false;  //checks if it has lost the ball under the cup
boolean firstBox =false; //checks if it as run the cup finder once with the ball location 
boolean cupFound= false; // checks if the cup (with the ball hopfully under it has been found)

//average x and y postion of blue pixels in the small box( average locatio of the cup with the ball under it )
int Xcup = 0;
int Ycup = 0;
// how many blue pixels in the box
int counterCup = 0;

//average location of green pixels in the whole sceen (location of ball)
int Xball = 0;
int Yball = 0; 
//number of orange pixels 
int counterBall = 0;

//saves rgb values of each pixel (individualy)  
float r = 0;
float g = 0;
float b = 0;




void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  frameRate(60);

  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }


  image(cam, 0, 0);
//mirror code taken out it caused some lag 

//if the cup as been found then it resets x, y and counter for cup  

  if (cupFound=true) {
    Xcup = 0;
    Ycup = 0;
    counterCup=0;
  }

//resests x y and counter for ball 

  Xball = 0;
  Yball = 0; 

  counterBall=0;




  //Moves through the ever pixel recording each ofthere rgb values  
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

      r = red(cam.pixels[i+(j*cam.width)]);
      g = green(cam.pixels[i+(j*cam.width)]);
      b = blue(cam.pixels[i+(j*cam.width)]);

      //if pixel is orange it saves its adds its x and y values to Xball and Yball and adds one counter ball 
      if ((r < 100) && (g > 200) && (b <100)) {


        Xball = Xball+i;
        Yball = Yball+j; 

        counterBall++;
      }
    }
  }




  if ((Xball>0)&&(Yball>0)) {
    Xball = Xball/counterBall;
    Yball = Yball/counterBall;
  }
 
 
 //when you loose the ball under a cup 
  if (ballLost == true) {

    // this is a check to to knows at least once so things dont happan out of order 
    firstBox = true;

//all these checks make sure you never look at a pixel that dosnt exsist 
    if (middleOfBoxX <= boxsize) {
      middleOfBoxX = boxsize+1;
    }

    if (middleOfBoxX >= cam.width - boxsize) {
      middleOfBoxX = cam.width - boxsize+1;
    }


    if (middleOfBoxY <= boxsize) {
      middleOfBoxY = boxsize + 1;
    }

    if (middleOfBoxY >= cam.height - boxsize) {
      middleOfBoxY = cam.height - ( boxsize+1);
    }

//insted of looking at the whole image it onle look at the pixels in a square with a side length of box size and its center is located at the center of the cup that contains the ball    
    for (int j =  middleOfBoxY - boxsize; j <=  middleOfBoxY + boxsize; j=j+1) {
      for (int i =  middleOfBoxX- boxsize; i <=  middleOfBoxX + boxsize; i=i+1) {
//records rgb values of pixels in the square

        r = red(cam.pixels[i+(j*cam.width)]);
        g = green(cam.pixels[i+(j*cam.width)]);
        b = blue(cam.pixels[i+(j*cam.width)]);

//if the pixels are blue (color of the cup) then adds up there x and an y position and counts how many there where  
        if ((r <50 ) && (g < 170) && (b > 170)) {

          if (cupFound=true) {    
         

            Xcup=Xcup+i;
            Ycup=Ycup+j;
            counterCup++;
          }
        }
      }
    }
  }
 
 
// finds average x y position of the cup (blue pixes on the cup)
 
  if ((Xcup>0) && (Ycup>0)) {
    Xcup=Xcup/counterCup;
    Ycup=Y/counterCup;
  }
 
 
 
 
 //if it ever see the ball it resets to original setting so will locate the ball again   
  if ( counterBall > 25) {

    ballFound = true;
    ballLost = false;
    firstBox = false;
    cupFound = false;
  }




//checks to see if we lost the ball under athe cup 
  if (( counterBall < 10) && (ballFound == true)) {

    ballLost = true;
  }


// theses will have rects follow the ball and cup the whole time the code is running good for debuging

/* 
  if (ballLost == true) {
    fill(0, 255, 0);

    rect( x, y, 20, 20);
    fill(255, 255, 255);
  }

  if (ballLost == false) {

    fill(255, 120, 0);
    rect( x2, y2, 20, 20);
    fill(255, 255, 255);
  }
*/



//if the ball hasent been lost yet then the middle of the box is the midle of the ball

  if (ballLost == false) {
    middleOfBoxX = Xball;
    middleOfBoxY = Yball;
  }






//if it sees 100 or more blue pixels  (in the smaller square) it has found the  cup

  if (counterCup > 100) {

    cupFound=true; 

  }
  else

  {
    cupFound=false;
  }



//If the ball has been lost the code as run through the blue check once already and the cup has been found then th middle of the check box moves with the cup 
  if ((ballLost == true) && (firstBox==true)  && (cupFound==true)) {
    middleOfBoxX = Xcup;
    middleOfBoxY = Xcup;
  }

//biggest problem when the  you have the cup to fast and it leaves the box that looks for the cup behind. right now the box statys where it is inless a cup travels through it or the ball is reaveled, 
// might be better it the box continued to travel in the direction of the cup to try and refind it. 




}

//***********************************************************************

//Press up to reveal location of cup with the ball 



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rect( Xcup, Ycup, 20, 20);
    }
  }
}





