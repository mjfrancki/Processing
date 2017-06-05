float a=0; //acceleration y
float dx=0;
float y=0; //y pos
float v=0; //speed y
float k=1.5; //spring constant y
float m=3; //mass y
float x=0; //xpos
float xa=0; //acceleration y
float xdx=0;
float xv=0; //speed x
float xk=2.5; //spring constant x
float xm=3;  //mass x

int oldY = 0;
int oldX = 0;

void setup() {
  size(900, 700);
}



void draw() {
   background(100, 180, 220);

 int vy = mouseY - oldY;
 int vx = mouseX - oldX;

//set ball pos
 if(mousePressed){  

   y = mouseY;  

    v = vy;  

  x = mouseX;  

    xv = vx;  
  }



  dx= y-200;
  
  a= ((-0.05)*v-(k/m)*(dx));
   
  v = v + a*0.5;
   
  y =  y + v*0.5;
   
   
   
   
 xdx = x-200;
  
  xa= ((-0.05)*xv-(xk/xm)*(xdx));
   
  xv = xv + xa*0.5;
   
  x =  x + xv*0.5;



 fill(200,110,59); 
 ellipse(x, y , 30, 30);
oldY = mouseY;  
oldX = mouseX;  

}
