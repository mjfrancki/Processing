import processing.video.*;

Capture cam;

float XPosition;
float YPosition;
int startPosX = 0;
int startPosY = 0;
int Px[] = new int[100000];
int Py[] = new int[100000];
  int counter = 0;
int stage = 0;


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
    cam = new Capture(this, cameras[18]);
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

 
 counter = 0;

if (stage == 0){

  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

      if ((r > 200) && (g < 150) && (b < 50)) {
       // rect(i, j, 20, 20);
        Px[counter] = i;
        Py[counter] = j;
        counter++;
      }
    }
  }

}


if (stage == 1){
 


      float r = red(cam.pixelsPy[counter]*cam.width + Px[counter]);
      float g = green(cam.pixelsPy[counter]*cam.width + Px[counter]);
      float b = blue(cam.pixelsPy[counter]*cam.width + Px[counter]);

      if ((r < 50) && (g > 150) && (b > 150)) {
       
       }
       
       else{
         
         
         
         
         
       }

  
} 



counter = counter/2;

  fill(255, 0, 0);
 rect( Px[counter], Py[counter], 20, 20);
  fill(255, 255, 255);


  XPosition = 0;
  YPosition = 0;

  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
   stage = stage+1;
   startPosX
   startPosY
   startPos = (Py[counter]*cam.width + Px[counter]);
   
    }
  }
}
