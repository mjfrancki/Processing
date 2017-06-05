import processing.video.*;

Capture cam;
 int boxsize = 40;
boolean ballFound = false;
boolean ballLost = false;
boolean firstBox =false;
boolean cupFound=false;
int middleOfBoxX =0;
int middleOfBoxY =0;

int PxOne[] = new int[100000];
int PyOne[] = new int[100000];
int counterOne = 0;

int PxTwo[] = new int[100000];
int PyTwo[] = new int[100000];
int counterTwo = 0;

int x = 0;
int y = 0;

int x2 = 0;
int y2 = 0; 

float r = 0;
float g = 0;
float b = 0;
int loc =0;
int Newloc =0;
int test = 0;
float[] red = new float[1000000];
float[] green = new float[1000000];
float[] blue = new float[1000000];


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
  // image(cam, 0, 0);



/*
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {

      loc = (i)+((j)*cam.width);
 
          red[loc]  =  red(cam.pixels[loc]);
          green[loc]  =  green(cam.pixels[loc]);
          blue[loc]  =  blue(cam.pixels[loc]);


  
}
  }




  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 1; i < cam.width; i=i+1) {
        loc = (i)+((j)*cam.width);
      Newloc = (cam.width-i)+((j)*cam.width);
 
      // println(loc);
      // println(Newloc);
//cam.pixels[Newloc] = (red[loc], green[loc], blue[loc]);
cam.pixels[Newloc] = color(red[loc], green[loc], blue[loc]);
  
  
}
  }




  image(cam, 0, 0);



*/


 image(cam, 0, 0);









if (cupFound=true){
x = 0;
y = 0;
 counterOne=0;
}

x2 = 0;
y2 = 0; 

  counterTwo=0;





// if (ballLost == false){
 
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

if ((r < 100) && (g > 200) && (b <100)) {
 
   // if ((r > 200) && (g < 150) && (b < 50)) {
       // rect(i, j, 20, 20);
        PxTwo[counterTwo] = i;
        PyTwo[counterTwo] = j;
       
        x2 = x2+i;
        y2 = y2+j; 
       
        counterTwo++;
      
    }

}
  }

// }
 
if ((x2>0)&&(y2>0)){
        x2 = x2/counterTwo;
        y2 = y2/counterTwo; 
}
 if (ballLost == true){
 
firstBox = true;
   
   
   
   if (middleOfBoxX <= boxsize){
middleOfBoxX = boxsize+1;
}

if (middleOfBoxX >= cam.width - boxsize){
 middleOfBoxX = cam.width - boxsize+1;
}


if (middleOfBoxY <= boxsize){
  middleOfBoxY = boxsize + 1;
}

if (middleOfBoxY >= cam.height - boxsize){
  middleOfBoxY = cam.height - ( boxsize+1);
}
   
   
  for (int j =  middleOfBoxY -boxsize; j <=  middleOfBoxY + boxsize; j=j+1) {
    for (int i =  middleOfBoxX- boxsize; i <=  middleOfBoxX + boxsize; i=i+1) {
      //int pixelColor = cam.pixels[j*cam.width + i];




       r = red(cam.pixels[i+(j*cam.width)]);
      g = green(cam.pixels[i+(j*cam.width)]);
       b = blue(cam.pixels[i+(j*cam.width)]);

    if ((r <50 ) && (g < 170) && (b > 170)){
    // if ((r < 170) && (g >200) && (b < 100)) {
       // rect(i, j, 20, 20);
 
    if (cupFound=true){    
        PxOne[counterOne] = i;
        PyOne[counterOne] = j;
        
        x=x+i;
        y=y+j;
        
        counterOne++;
    }
   
  }

}
  }

 }
if ((x>0) && (y>0)){
x=x/counterOne;
y=y/counterOne;
}
if( counterTwo > 25){
  
  ballFound = true;
  ballLost = false;
 firstBox = false;
cupFound = false;


}



if(( counterTwo<10) &&(ballFound == true)) {
  
  ballLost = true;
  
}


//0counterOne = counterOne/2;
//counterTwo = counterTwo/2;

if (ballLost == true){
 fill(0, 255, 0);
//rect( PxOne[counterOne], PyOne[counterOne], 20, 20);
 rect( x, y, 20, 20);
  fill(255, 255, 255);
// println( middleOfBoxY);
   // println( middleOfBoxX);


}

if (ballLost == false){
 
fill(255, 120, 0);
rect( x2, y2, 20, 20);
 fill(255, 255, 255);

}






if (ballLost == false){
  // println( middleOfBoxY);
  // println( middleOfBoxX);
 middleOfBoxX = x2;
 middleOfBoxY = y2;
  
}




 



if (counterOne > 100) {
  //print(counterOne);
 cupFound=true; 

r = (red(cam.pixels[100*cam.width + 100]));
g =(green(cam.pixels[100*cam.width + 100]));
b=  (blue(cam.pixels[100*cam.width + 100]));

println  (r);
println (g);
println  (b);
}else

{
  cupFound=false;  
}



if ((ballLost == true) && (firstBox==true)  && (cupFound==true)) {
 
  println(middleOfBoxX);
  
 middleOfBoxX = x;
 middleOfBoxY = y;
  
}





point(100,100);

}







void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rect( PxOne[counterOne], PyOne[counterOne], 20, 20);
    } 
  } 
}






