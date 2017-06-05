void blurFunction(PImage img) {

  img.loadPixels();
  int dim = img.width*img.height;

  for (int y = 11; y < img.height-11; y++) {
    for (int x = 11; x < img.width-11; x++) {
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
      
      
      
       float r = rTotal/100;
      float  g = gTotal/100;
      float  b = bTotal/100;
      
      img.pixels[loc] = color(r,g,b);
    }
  }
  img.updatePixels();
}
