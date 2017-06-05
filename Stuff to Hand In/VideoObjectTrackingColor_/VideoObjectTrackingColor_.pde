import processing.video.*;

Capture cam;

//saves rgb values of pixels
float r = 0;
float g = 0;
float b = 0;

//sets x and y postion of marker
float XPosition;
float YPosition;

//saves each x and y postion of every pixel that is the right color (red)
int Px[] = new int[500000];
int Py[] = new int[500000];

//counts how many pixels are the right color(red)
int counter = 0;



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

//reset counter to zero  
 counter = 0;

//moves through every pixel
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
     
//saves rgb valus
       r = red(cam.pixels[i+(j*cam.width)]);
       g = green(cam.pixels[i+(j*cam.width)]);
       b = blue(cam.pixels[i+(j*cam.width)]);


//checkes if pixel is the right color (red)
      if ((r > 200) && (g < 100) && (b < 100)) {
     //saves xy postion of pixel in array 
        Px[counter] = i;
        Py[counter] = j;
        //counts one 
        counter++;
      }
    }
  }





//find wich pox of the array has the middle red pixel xy values
counter = counter/2;


//display the marker in the center of red on the screen 
  fill(255, 0, 0);
 rect( Px[counter], Py[counter], 20, 20);
  fill(255, 255, 255);


}

