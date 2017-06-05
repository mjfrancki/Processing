import processing.video.*;

Capture cam;
//rgb values of pixel
float r = 0;
float g = 0;
float b = 0;

//location of pixel
int loc = 0;

//New location of pixel 
int Newloc = 0;

//arrays that store the rgb vales of every pixel   
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
  
//moves through every pixel 
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {

      //2d location of pixel 
      loc = (i)+((j)*cam.width);
 
 //stores each rgb value in the next box of arrays 
          red[loc]  =  red(cam.pixels[loc]);
          green[loc]  =  green(cam.pixels[loc]);
          blue[loc]  =  blue(cam.pixels[loc]);


  
}
  }


//moves through every pixel

  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 1; i < cam.width; i=i+1) {
   //sets location of pixel     
      loc = (i)+((j)*cam.width);
   // sets mirror location of pixel   
      Newloc = (cam.width-i)+((j)*cam.width);
 
 //sets each pixel to is mirror imaged pixel 
cam.pixels[Newloc] = color(red[loc], green[loc], blue[loc]);
  
  
}
  }




  image(cam, 0, 0);
}

