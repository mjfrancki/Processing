int door = 0; //what door the car is behind 
int pick = 0; //what door you pick

int car =0;   // how many times you win the car

void setup(){
 
  for(int i = 0; i < 100000; i = i+1){
  
 door = int(random(3)); 
 pick = int(random(3)); 
  
 

  
  if (pick == door){
   car++;
  } 
  
  
  
  }
  
  
  println(car);
  
}
