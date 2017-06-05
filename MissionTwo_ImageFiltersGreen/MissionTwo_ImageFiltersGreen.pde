PImage original;
PImage invert; 
PImage blackWhite; 
PImage doubleVision; 
PImage gray; 
PImage greenChannel; 

String img = "TPic.jpg";

void setup() {
  original = loadImage(img);
  gray = loadImage(img);
    greenChannel = loadImage(img);
 
 
   
    size(original.width*3, original.height*2);
   GrayFunction(gray);
   GreenFunction(greenChannel);
     
     
     
  
  
}

void draw() {
 image(original, 0, 0);
  image(greenChannel, 600, 0);
 
 
}
