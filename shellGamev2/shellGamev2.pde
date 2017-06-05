import processing.video.*;

Capture cam;
 
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
  frameRate(10);

  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }
  // image(cam, 0, 0);




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



















 counterOne=0;
  counterTwo=0;





 if (ballLost == false){
 
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

 
    if ((r > 200) && (g < 150) && (b < 50)) {
       // rect(i, j, 20, 20);
        PxTwo[counterTwo] = i;
        PyTwo[counterTwo] = j;
        counterTwo++;
      }

}
  }

 }
 
// println(counterTwo);

/*
 if (ballLost == true){
 
firstBox = true;
   
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      //int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

    
     if ((r < 170) && (g >200) && (b < 100)) {
        rect(i, j, 20, 20);
        PxOne[counterOne] = i;
        PyOne[counterOne] = j;
        counterOne++;
      }

}
  }

 }

*/


 if (ballLost == true){
 
firstBox = true;
   
  for (int j =  middleOfBoxY -20; j <  middleOfBoxY + 20; j=j+1) {
    for (int i =  middleOfBoxX-20; i <  middleOfBoxX+20; i=i+1) {
      //int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

    
     if ((r < 170) && (g >200) && (b < 100)) {
        rect(i, j, 20, 20);
        PxOne[counterOne] = i;
        PyOne[counterOne] = j;
        counterOne++;
      }

}
  }

 }




if( counterTwo >50){
  
  ballFound = true;
  
}



if(( counterTwo<10) &&(ballFound == true)) {
  
  ballLost = true;
  
}


counterOne = counterOne/2;
counterTwo = counterTwo/2;

if (ballLost == true){
 fill(0, 255, 0);
rect( PxOne[counterOne], PyOne[counterOne], 20, 20);
  fill(255, 255, 255);
// println( middleOfBoxY);
   // println( middleOfBoxX);


}

if (ballLost == false){
 
fill(255, 120, 0);
rect( PxTwo[counterTwo], PyTwo[counterTwo], 20, 20);
 fill(255, 255, 255);

}






if (ballLost == false){
   println( middleOfBoxY);
   println( middleOfBoxX);
 middleOfBoxX = PxTwo[counterTwo];
 middleOfBoxY = PyTwo[counterTwo];
  
}




 



if (counterOne > 100) {
  
 cupFound=true; 
}



if ((ballLost == true) && (firstBox==true)  && (cupFound==true)) ){
 
  println(middleOfBoxX);
  
 middleOfBoxX =PxOne[counterOne];
 middleOfBoxY =PyOne[counterOne];
  
}








}

