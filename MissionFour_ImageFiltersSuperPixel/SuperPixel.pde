void superPixelFunction(PImage img) {

  img.loadPixels();
  int dim = img.width*img.height;

  for (int y =10 ; y < img.height-10; y=y +10) {
    for (int x = 10; x < img.width-10; x=x+10) {
      int loc = x + y*img.width;

float rTotal=0;
float gTotal=0;
float bTotal=0;


  for (int k = -5; k < 5; k++) {
    for (int j = -5; j < 5; j++) {
        int Blurloc = ( (x+j) + ((y+k)*img.width ));
       rTotal = rTotal + red(img.pixels[Blurloc]);
       gTotal = gTotal + green(img.pixels[Blurloc]);
       bTotal = bTotal + blue(img.pixels[Blurloc]);
    
  
}
  }
      
  
      
      float  r = rTotal/100;
      float  g = gTotal/100;
      float  b = bTotal/100;
      
      
      
      
      
        for (int k = -10; k < 10; k++) {
    for (int j = -10; j < 10; j++) {
        int Blurloc = ( (x+j) + ((y+k)*img.width ));
     
    img.pixels[Blurloc] = color(r,g,b);
  
}
  }
      
      
      
      
    }   
  }
  img.updatePixels();
}
