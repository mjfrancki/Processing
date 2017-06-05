float a=0;
float dx=0;
float y=200;
float ytwo=400;

float k=1.5;
float m=3;
float dxtwo=0;
float v=0;
float atwo=0;
float vtwo=0;



int oldY = 0;


void setup() {
  size(900, 700);


}



void draw() {
  background(100, 180, 220);

  int vy = mouseY - oldY;


  if (mousePressed) {  

    y = mouseY;  

    v = vy;
  }



  dx= y-200;

  a= ((-0.05)*v-(k/m)*(dx));

  v = v + a*0.5;

  y =  y + v*0.5;


  dxtwo= (ytwo-dx)-400;

  atwo= ((-0.05)*vtwo-(k/m)*(dxtwo));

  vtwo = vtwo + atwo*0.05;

  ytwo =  ytwo + vtwo*0.05;





  fill(200, 110, 59); 
  ellipse(400, y, 30, 30);
  ellipse(400, ytwo, 30, 30);

  oldY = mouseY;
}

