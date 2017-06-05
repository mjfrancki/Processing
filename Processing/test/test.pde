float[] A = {  
 
    5, -5
  
};

float[] ANew = {  
 
    5, -5
  
};

//float theta =2;


float[][]X = {  
  {
     cos(2), sin(2)
  }
  , 
  {
    -sin(3), cos(3)
  }
  ,
}; 

void setup(){
size(600,600);
background(250); 

}

int theta = 1;


void draw(){
  
  background(250); 
  theta = int(map(mouseX,0,600,0,TWO_PI));
  
  float[][]X = {  
  {
     cos(theta), sin(theta)
  }
  , 
  {
    -sin(theta), cos(theta)
  }
  ,
}; 
  
  
  float[] ANew = {  
 
    5, -5
  
};
  
  for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

          ANew[i] += A[i] * X[k][j];
        }
    
  }
  
}






  translate(width/2,height/2);
strokeWeight(10);
  point(ANew[0], ANew[1]);
  
  
  
}
