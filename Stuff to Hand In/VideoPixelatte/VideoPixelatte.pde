import processing.video.*;

Capture cam;
//red, green and blue values of each pixxelare stored in r, g and b
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
  frameRate(10); //set frame rate is now 10 fps 

  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }


//Two for loops set the size of supper pixels and from center to center of each supper pixel 
  for (int j = 10; j < cam.height-10; j=j+5) {
    for (int i = 10; i < cam.width-10; i=i+5) {

      //resets r g and b for the next super pixel 
      r = 0;
      g = 0;
      b = 0;

// moves through ever pixel in the super pixel 
      for (int k = -5; k <=5; k=k+1) {
        for (int m = -5; m <=5; m=m+1) {

//adds all the red green and bleu values of the pixels i the super pixel  
          r  = r + red(cam.pixels[(i+m)+((j+k)*cam.width)]);
          g  = g + green(cam.pixels[(i+m)+((j+k)*cam.width)]);
          b  = b + blue(cam.pixels[(i+m)+((j+k)*cam.width)]);
        }
      }

//avergess out the rgb colors in the super pixel 
      r=r/121;
      g=g/121;
      b=b/121;



//moves through the super pixel again
      for (int k = -5; k <=5; k=k+1) {
        for (int m = -5; m <=5; m=m+1) {

          //sets ever pixel in the super pixel to the same averged out rgb color  
          cam.pixels[(i+m)+((j+k)*cam.width)] =color(r, g, b);
        }
      }
    }
  }


//refresh image 
  image(cam, 0, 0);
}

