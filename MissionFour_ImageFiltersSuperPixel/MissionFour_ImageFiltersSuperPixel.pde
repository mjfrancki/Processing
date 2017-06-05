PImage original;

 

PImage gray; 
PImage greenChannel; 
PImage blur;
PImage superPixel;



String img = "TPic.jpg";

void setup() {
  original = loadImage(img);
  gray = loadImage(img);
    greenChannel = loadImage(img);
      blur = loadImage(img);
         superPixel = loadImage(img);
 
  
   
    size(original.width*3, original.height*2);
   GrayFunction(gray);
   GreenFunction(greenChannel);
   blurFunction(blur);
   superPixelFunction(superPixel);
     
     
    
  
  
}

void draw() {
 image(original, 0, 0);
  image(superPixel, 600, 0);
 
 //image(blackWhite, 300, 0);
  
  
// image(blackWhite, 300, 0);
 // image(invert, 600, 0);
 // image(doubleVision, 0, 300);

 
  

  
}
