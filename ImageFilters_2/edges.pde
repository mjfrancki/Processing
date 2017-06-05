

float  Right = 0;
float  Left = 0;

float  Top = 0;
float  Bottom = 0;


void edgesFunction(PImage img) {

  img.loadPixels();
  int dim = img.width*img.height;






  for (int y =img.height-5 ; y >5; y=y -1) {
    for (int x = img.width-5; x > 5; x=x -1) {
      int loc = x + y*img.width;





      Top = red(img.pixels[loc-img.width]);
      Bottom = red(img.pixels[loc+img.width]);

      Right = red(img.pixels[loc-1]);
      Left = red(img.pixels[loc+1]);






      if (( abs(Right-Left) < 220 ) && ( abs(Top-Bottom) < 220 )) {

        img.pixels[loc] = color(255, 255, 255);
      }
    }
  }




  img.updatePixels();
}


