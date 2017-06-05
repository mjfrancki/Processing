void doubleVisionFunction(PImage img) {

  img.loadPixels();

  for (int y = 0; y < img.height-20; y++) {
    for (int x = 0; x < img.width-20; x++) {
      int loc = x + y*img.width;

      float gray = red(img.pixels[loc]);
   

     
        gray = gray/2 + red(img.pixels[loc+20])/2;
    
     
      img.pixels[loc] = color( gray,  gray,  gray);
    }
  }
  img.updatePixels();
}

