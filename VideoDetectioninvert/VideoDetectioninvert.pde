import processing.video.*;

Capture cam;
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
  frameRate(10);

  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }
  // image(cam, 0, 0);




  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {

 
          r  =  red(cam.pixels[(i)+((j)*cam.width)]);
          g  =  green(cam.pixels[(i)+((j)*cam.width)]);
          b  =  blue(cam.pixels[(i)+((j)*cam.width)]);

     

r=255-r;
 
g=255-g;
 
b=255-b;






          cam.pixels[(i)+((j)*cam.width)] =color(r, g, b);
      
    }
  }



  image(cam, 0, 0);
}

