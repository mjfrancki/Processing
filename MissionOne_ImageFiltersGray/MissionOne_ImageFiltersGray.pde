PImage original;
PImage invert; 
PImage blackWhite; 
PImage doubleVision; 
PImage gray; 

String img = "TPic.jpg";

void setup() {
  original = loadImage(img);
  gray = loadImage(img);
  
   
    size(original.width*3, original.height*2);
   GrayFunction(gray);
   
  
  
}

void draw() {
 image(original, 0, 0);
  image(gray, 600, 0);
 


 
 
  
}
