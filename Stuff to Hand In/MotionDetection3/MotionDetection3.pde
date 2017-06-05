import processing.video.*;

Capture cam;
  
PImage previous;

// Multiple thresholds for detecting how fast an object is moving.
float detectLow = 50;
float detectMed = 100;
float detectHigh = 150;


void setup() {
  size(640, 480);

cam = new Capture(this, width, height, 30);
// Creates an image in which to store the previous frame.
    previous = createImage(cam.width,cam.height,RGB);
    cam.start();
}

void draw() {
 frameRate(10);
  
  if (cam.available()) {
// Copy's the current frame (which then becomes the previous frame)
//    and saves it into the Image: previous.
    previous.copy(cam,0,0,cam.width,cam.height,0,0,cam.width,cam.height);
    previous.updatePixels();
    cam.read();
  }

loadPixels();
cam.loadPixels();
previous.loadPixels();

  for (int i = 0; i < cam.width; i++) {
    for (int j = 0; j < cam.height; j++) {

      int loc = i + j*cam.width;
      
      color curColor = cam.pixels[loc];
      color prevColor = previous.pixels[loc];

// Finds the RGB values of the current frame's pixels and
//    the previous frame's pixels.
      float r = red(curColor);
      float g = green(curColor);
      float b = blue(curColor);
      
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = blue(prevColor);
      
// Calculates the difference between the current frame's pixels
//    and the previous frame's pixels.
      float change = dist(r,g,b,r2,g2,b2);
      
// Compares the difference between the pixels with the set thresholds.
      if (change > detectLow && change <= detectMed) { 
        pixels[loc] = color(0,0,255);
        
      } else if (change > detectMed && change <= detectHigh) { 
        pixels[loc] = color(255,255,0);
        
      } else if (change > detectHigh) {
        pixels[loc] = color(255,0,0);
        
      } else {
        pixels[loc] = color(255);
      }
    }
  }
  updatePixels();
}
