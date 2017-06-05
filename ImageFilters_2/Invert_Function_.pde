void invertFunction(PImage img) {

  img.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int loc = x + y*img.width;

      float gray = red(img.pixels[loc]);
 

      gray = 255 - gray;
    

      img.pixels[loc] = color(gray, gray, gray);
    }
  }
  img.updatePixels();
}

