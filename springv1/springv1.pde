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

bla=bla * 0.995;

  dx= masspos-200;
   acc= (-1)*(dx)*(0.08);
   massspeed = massspeed + acc;
   masspos += massspeed* bla;
   
   ellipse(50,200+(masspos)/*bla*/ , 30, 30);
}
