import processing.video.*;

Capture cam;
float r = 0;
float g = 0;
float b = 0;
int loc =0;



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




  for (int j = 10; j < cam.height-10; j=j+1) {
    for (int i = 10; i < cam.width-10; i=i+1) {

      loc = (i)+((j)*cam.width);
 
          r  =  red(cam.pixels[loc]);
          g  =  green(cam.pixels[loc]);
          b  =  blue(cam.pixels[loc]);

     



   
      loc = ((j)*cam.width)+(640-i);




          cam.pixels[loc] =color(r, g, b);
      
    }
  }



  image(cam, 0, 0);
}

