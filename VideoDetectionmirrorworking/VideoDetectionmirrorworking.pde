import processing.video.*;

Capture cam;
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
}

