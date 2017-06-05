float acc=0;
float dx=0;
float massspeed=0;
float masspos=0;

float bla = 1;

void setup() {
  size(900, 700);
}



void draw() {
   background(100, 180, 220);



  dx= masspos-200;
   acc= (-1)*(dx)*(0.009);
   massspeed = massspeed + acc;
   masspos += massspeed;
   
   ellipse(50,200+(masspos) , 30, 30);
}
