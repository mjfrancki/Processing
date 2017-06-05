import processing.video.*;

Capture cam;
 
int translateX=0;
int translateY=0;


int PxOne[] = new int[100000];
int PyOne[] = new int[100000];
int counterOne = 0;

int PxTwo[] = new int[100000];
int PyTwo[] = new int[100000];
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

 counterOne=0;
  counterTwo=0;

//translate(  ((PxTwo[counterTwo]+PxOne[counterOne])/2), ((PyTwo[counterTwo]+PyOne[counterOne])/2));
  for (int j = 0; j < cam.height; j=j+1) {
    for (int i = 0; i < cam.width; i=i+1) {
      int pixelColor = cam.pixels[j*cam.width + i];

      float r = red(cam.pixels[i+(j*cam.width)]);
      float g = green(cam.pixels[i+(j*cam.width)]);
      float b = blue(cam.pixels[i+(j*cam.width)]);

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



 strokeWeight(1);

 
counterOne = counterOne/2;
counterTwo = counterTwo/2;

  fill(0, 255, 0);
 rect( PxOne[counterOne], PyOne[counterOne], 20, 20);
  fill(255, 255, 255);

fill(255, 120, 0);
 rect( PxTwo[counterTwo], PyTwo[counterTwo], 20, 20);
  fill(255, 255, 255);

 
line( PxTwo[counterTwo], PyTwo[counterTwo], PxOne[counterOne], PyOne[counterOne]);
 strokeWeight(1);

// ellipse((PxTwo[counterTwo]+PxOne[counterOne])/2,(PyTwo[counterTwo]+PyOne[counterOne])/2,10,10 );

 translateX= ((PxTwo[counterTwo]+PxOne[counterOne])/2);
translateY= ((PyTwo[counterTwo]+PyOne[counterOne])/2);


translate(  ((PxTwo[counterTwo]+PxOne[counterOne])/2), ((PyTwo[counterTwo]+PyOne[counterOne])/2));
 ellipse(0,0,30,30 );

rotate(HALF_PI);
 ellipse( PxTwo[counterTwo] - ((PxTwo[counterTwo]+PxOne[counterOne])/2) , PyTwo[counterTwo]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );
ellipse( PxOne[counterOne] - ((PxTwo[counterTwo]+PxOne[counterOne])/2), PyOne[counterOne]-((PyTwo[counterTwo]+PyOne[counterOne])/2),30,30 );

  //set(0, 0, cam);
}

