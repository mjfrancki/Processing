import processing.video.*;

Capture cam;

//saves rgb values of pixels
float r = 0;
float g = 0;
float b = 0;

//saves each x and y postion of every pixel that is the first right color (green)
int PxOne[] = new int[100000];
int PyOne[] = new int[100000];
//counts how many pixels are the right color(green)
int counterOne = 0;

//saves each x and y postion of every pixel that is the second right color (orange)
int PxTwo[] = new int[100000];
int PyTwo[] = new int[100000];
//counts how many pixels are the right color(orange)
int counterTwo = 0;

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
  image(cam, 0, 0);

sets counters to zero
  counterOne=0;
  counterTwo=0;

//moves through every pixel
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
     
      //saves rgb values
    r = red(cam.pixels[i+(j*cam.width)]);
    g = green(cam.pixels[i+(j*cam.width)]);
    b = blue(cam.pixels[i+(j*cam.width)]);

//checks if pixel is the right color (green)
      if ((r < 170) && (g >200) && (b < 100)) {
      //save xy of green pixels
        PxOne[counterOne] = i;
        PyOne[counterOne] = j;
        //counts green pixels 
        counterOne++;
      }
    
    //checks if pixel is the right color (orange)
     if ((r > 200) && (g < 150) && (b < 50)) {
         //save xy of orange pixels
        PxTwo[counterTwo] = i;
        PyTwo[counterTwo] = j;
        //counts orange pixels  
        counterTwo++;
      }

}
  }



// finds value of the middle boxes of the arrays
counterOne = counterOne/2;
counterTwo = counterTwo/2;

//display green marker
  fill(0, 255, 0);
 rect( PxOne[counterOne], PyOne[counterOne], 20, 20);
  fill(255, 255, 255);

//display orange marker
fill(255, 120, 0);
 rect( PxTwo[counterTwo], PyTwo[counterTwo], 20, 20);
  fill(255, 255, 255);

 
}

