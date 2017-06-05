import processing.video.*;

Capture cam;
//arrays of xy locations of green(one) and orange(two) pixels and counters to count the # of pixels
int PxOne[] = new int[100000];
int PyOne[] = new int[100000];
int counterOne = 0;

int PxTwo[] = new int[100000];
int PyTwo[] = new int[100000];
int counterTwo = 0;

//saves rgb values
 float  r = 0;
 float g = 0;
 float b = 0;

//location of pixels
int loc =0;
//Mirrored location of pixels
int Newloc =0;

//arrays of rgb values
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



////////////mirror code
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
 
cam.pixels[Newloc] = color(red[loc], green[loc], blue[loc]);
  
  
}
  }




  image(cam, 0, 0);

//////////////// end mirror code
















/////////////////////// minority report one code
 counterOne=0;
  counterTwo=0;

// moves piont 0,0 half way between  the green and orange marker
translate(  ((PxTwo[counterTwo]+PxOne[counterOne])/2), ((PyTwo[counterTwo]+PyOne[counterOne])/2));
 
 
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

       r = red(cam.pixels[i+(j*cam.width)]);
       g = green(cam.pixels[i+(j*cam.width)]);
       b = blue(cam.pixels[i+(j*cam.width)]);

      if ((r < 170) && (g >200) && (b < 100)) {
       //rect(i, j, 20, 20);
        PxOne[counterOne] = i;
        PyOne[counterOne] = j;
        counterOne++;
      }
    
     if ((r > 200) && (g < 150) && (b < 50)) {
       // rect(i, j, 20, 20);
        PxTwo[counterTwo] = i;
        PyTwo[counterTwo] = j;
        counterTwo++;
      }

}
  }

///////////////////////

 strokeWeight(1);

 
counterOne = counterOne/2;
counterTwo = counterTwo/2;




// draw ellipse at center of  big square 
 ellipse(0,0,30,30 );

// draw ellipse at location of green and orange objects
 ellipse( PxTwo[counterTwo] - ((PxTwo[counterTwo]+PxOne[counterOne])/2) , PyTwo[counterTwo]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );
 ellipse( PxOne[counterOne] - ((PxTwo[counterTwo]+PxOne[counterOne])/2), PyOne[counterOne]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );
 
// rotate 90 degrees
 rotate(HALF_PI);

// redraw ellipse that where at the location of green and orange objects
 ellipse( PxTwo[counterTwo] - ((PxTwo[counterTwo]+PxOne[counterOne])/2) , PyTwo[counterTwo]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );
 ellipse( PxOne[counterOne] - ((PxTwo[counterTwo]+PxOne[counterOne])/2), PyOne[counterOne]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );

















}

