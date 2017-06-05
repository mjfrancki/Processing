PImage original;
PImage invert; 
PImage blackWhite; 
PImage doubleVision; 
PImage gray; 
PImage greenChannel; 
PImage blur;

String img = "TPic.jpg";

void setup() {
  original = loadImage(img);
  gray = loadImage(img);
    greenChannel = loadImage(img);
      blur = loadImage(img);
 
  
   
    size(original.width*3, original.height*2);
   //GrayFunction(gray);
   GreenFunction(greenChannel);
    blurFunction(blur);
     
     
  
  
  
}

void draw() {
 image(original, 0, 0);
  image(blur, 600, 0);


 
  

  
}
