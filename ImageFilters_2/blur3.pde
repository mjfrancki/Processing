void blurFunction(PImage img) {


 
 //******** change the dim variable to specify  the size of the blur e.x. dim = 5 the 5 by 5 blur  
  int dim = 9; //dimension odf the blur square 
  int halfDim = dim/2;
  
  
  
  
  
  img.loadPixels();
 

  for (int y =  halfDim; y < img.height- halfDim; y++) {
    for (int x =  halfDim; x < img.width- halfDim; x++) {
      int loc = x + y*img.width;

float rTotal=0;
float gTotal=0;
float bTotal=0;


  for (int k = - halfDim; k <=  halfDim; k++) {
    for (int j = - halfDim; j <=  halfDim; j++) {
        int Blurloc = ( (x+j) + ((y+k)*img.width ));
       rTotal = rTotal + red(img.pixels[Blurloc]);
       gTotal = gTotal + green(img.pixels[Blurloc]);
       bTotal = bTotal + blue(img.pixels[Blurloc]);
    }
  }
      
      
      
       float r = rTotal/(dim*dim);
      float  g = gTotal/(dim*dim);
      float  b = bTotal/(dim*dim);
      
      img.pixels[loc] = color(r,g,b);
    }
  }
  img.updatePixels();
}

