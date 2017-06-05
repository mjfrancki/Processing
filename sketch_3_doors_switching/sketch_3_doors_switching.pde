int door = 0; //what door the car is behind 
int pick = 0; //what door you pick
int gone = 0; // the door that gets eliminated
int car =0;   // how many times you win the car
boolean trade = false;
void setup(){
 
  for(int i = 0; i < 100000; i = i+1){
  
 door = int(random(3)); 
 pick = int(random(3)); 
  
 
  
    if ((door != 0)&&(pick != 0)){
   gone =0; 
  }
  
  if ((door != 1)&&(pick != 1)){
   gone =1; 
  }
  
  
   if ((door != 2)&&(pick != 2)){
   gone =2; 
  }
 
 


 
  if((pick != 0)&&(gone != 0)){
    
    pick = 0;

  
}
 
 
 
 else if((pick != 1)&&(gone != 1)){
    
    pick = 1;

  }
 
 
else if((pick != 2)&&(gone != 2)){
    
    pick = 2;
 
  }
 
 

 
  

  
  if (pick == door){
   car++;
  } 
  
  
  
  }
  
  
  println(car);
  
}
