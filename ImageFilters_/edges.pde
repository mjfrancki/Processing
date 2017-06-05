  float  Oldr = 0;
   float  r =0;
   

void edgesFunction(PImage img) {

  img.loadPixels();
  int dim = img.width*img.height;

  for (int y =10 ; y < img.height-10; y=y +2) {
    for (int x = 10; x < img.width-10; x=x +2) {
      int loc = x + y*img.width;

float rTotal=0;
float gTotal=0;
float bTotal=0;


  for (int k = -1; k <= 1; k++) {
    for (int j = -1; j <= 1; j++) {
        int Blurloc = ( (x+j) + ((y+k)*img.width ));
       rTotal = rTotal + red(img.pixels[Blurloc]);
       gTotal = gTotal + green(img.pixels[Blurloc]);
       bTotal = bTotal + blue(img.pixels[Blurloc]);
    
  
}
  }
      
  
      
      r = rTotal;
   
    
      
      
      
      
      
        for (int k = -1; k < 1; k++) {
    for (int j = -1; j < 1; j++) {
        int Blurloc = ( (x+j) + ((y+k)*img.width ));
     
     
     if(abs( Oldr - r ) < 1875  )
     {
    img.pixels[Blurloc] = color(255,255,255);  
   }
 
 else{
   img.pixels[Blurloc] = color(0,0,0);
    
 }
  
}
  }
      
      
      
      
    }   
  
Oldr = r;

}
  img.updatePixels();
}
