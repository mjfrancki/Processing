PImage original;
PImage invert; 
PImage blackWhite; 
PImage doubleVision; 
PImage blur; 
PImage edge; 

String img = "CubePic.jpg";

void setup() {
  original = loadImage(img);
  invert = loadImage(img);
  blackWhite = loadImage(img);
  doubleVision = loadImage(img); 
  blur = loadImage(img); 
  edge = loadImage(img); 
    
    size(original.width*3, original.height*2);
   
     invertFunction(invert);
     blackWhiteFunction(blackWhite);
     doubleVisionFunction(doubleVision);
     blurFunction(blur);
      edgesFunction(edge);
  
  
}

void draw() {
  image(original, 0, 0);
  filter(GRAY);
  
  
  image(blackWhite, 300, 0);
  image(invert, 600, 0);
   filter(GRAY);
  image(doubleVision, 0, 300);
  
  image(blur, 300, 300);
   filter(GRAY);
  
  image(edge, 600, 300);
  filter(GRAY);
  
}
