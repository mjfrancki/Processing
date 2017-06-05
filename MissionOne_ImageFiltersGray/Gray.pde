void GrayFunction(PImage img) {
  
    img.loadPixels();
  
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int loc = x + y*img.width;

        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);
           float gray = (r+g+b)/3 ;
 
      

      img.pixels[loc] = color( gray,gray,gray);
    }
  }
   img.updatePixels();
  
  
}


