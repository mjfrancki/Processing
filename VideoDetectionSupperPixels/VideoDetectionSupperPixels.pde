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




  for (int j = 10; j < cam.height-10; j=j+5) {
    for (int i = 10; i < cam.width-10; i=i+5) {

      r = 0;
      g = 0;
      b = 0;

      for (int k = -5; k <=5; k=k+1) {
        for (int m = -5; m <=5; m=m+1) {


          r  = r + red(cam.pixels[(i+m)+((j+k)*cam.width)]);
          g  = g + green(cam.pixels[(i+m)+((j+k)*cam.width)]);
          b  = b + blue(cam.pixels[(i+m)+((j+k)*cam.width)]);
        }
      }

      r=r/121;
      g=g/121;
      b=b/121;




      for (int k = -5; k <=5; k=k+1) {
        for (int m = -5; m <=5; m=m+1) {

          cam.pixels[(i+m)+((j+k)*cam.width)] =color(r, g, b);
        }
      }
    }
  }



  image(cam, 0, 0);
}

