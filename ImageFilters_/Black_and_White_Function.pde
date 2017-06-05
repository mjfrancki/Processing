void blackWhiteFunction(PImage img) {
  
    img.loadPixels();
  
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int loc = x + y*img.width;

      float gray = red(img.pixels[loc]);
      

      if ( gray > 70) {
        gray = 255;
    
      } 
      else  {
        gray = 0;
      
      }

      img.pixels[loc] = color( gray,  gray,  gray);
    }
  }
  img.updatePixels();
  
  
}
