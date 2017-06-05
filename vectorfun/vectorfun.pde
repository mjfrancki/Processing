PVector location;
PVector velocity;
PVector wind;
PVector gravity;
 
void setup() {
  size(640,360);
  location = new PVector(100,100);
  velocity = new PVector(0,0);
  wind = new PVector(0.3,0);
  gravity = new PVector(0,0.89);

}
 
void draw() {
  background(255);
   
   
    velocity.add(gravity);

  velocity.add(wind); 

     
  
   if(mousePressed== false)
{
  location.add(velocity);
} 
  
 if(mousePressed)
{
  location.x = mouseX;
  location.y  = mouseY;
  velocity.x = 0;
   velocity.y = 0;
}

if  (location.x < 0) {
 velocity.x = velocity.x * -0.8;
 location.x = 15.1;
 
 }
  
  if (location.x > width-15) {
   velocity.x = velocity.x * -0.8;
     location.x = (width -15.1);
   
    location.x = (width -16);
  }
  
  
 // if(location.y < 0){
   //velocity.y = velocity.y * -1;
 // }
  
  if (location.y > height-15)  {
  velocity.y = velocity.y * -0.8;
   location.y = (height -15.1);
  

}
 
  stroke(0);
  fill(175);
  ellipse(location.x,location.y,30,30);
}

 void keyPressed() {
   if (key == CODED) {
    if (keyCode == UP) {
    wind.x = 0.5 ; 
    }
      if (keyCode == DOWN) {
    wind.x = -0.5;  
    }

 }
   }
