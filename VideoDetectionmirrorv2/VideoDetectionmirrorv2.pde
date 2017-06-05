import processing.video.*;

Capture cam;
float r = 0;
float g = 0;
float b = 0;
float loc =0;
float[] numbers = new float[100000];
float[] red = new float[100000];
float[] green = new float[100000];
float[] blue = new float[100000];
float count=0;

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
 
          red[count]  =  red(cam.pixels[loc]);
          green[count]  =  green(cam.pixels[loc]);
          blue[count]  =  blue(cam.pixels[loc]);

     
      numbers[count] = ((j)*cam.width)+(640-i);

count=count+1;

          //cam.pixels[loc] =color(r, g, b);
     
  }
  }

count=0;
 for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      
  count=count+1;
  
  cam.pixels[count] =color(red[count], green[count], blue[count]);
  
  
  
    }
    
 }


  image(cam, 0, 0);
}

