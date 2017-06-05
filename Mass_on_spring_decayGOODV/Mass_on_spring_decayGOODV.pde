float a=0; //acceleration
float dx=0; 
float y=200;//ypos
float v=0; //speed
float k=1.5; //spring constant
float m=3; //mass
int oldY = 0;


void setup() {
  size(900, 700);
}



void draw() {
  background(100, 180, 220);
//set ball pos
  int vy = mouseY - oldY;
  if (mousePressed) {  

    y = mouseY;  

    v = vy;
  }


//spring
  dx= y-200;

  a= ((-0.05)*v-(k/m)*(dx));

  v = v + a*0.5;

  y =  y + v*0.5;

  fill(200, 110, 59); 
  ellipse(400, y, 30, 30);
  oldY = mouseY;
}

