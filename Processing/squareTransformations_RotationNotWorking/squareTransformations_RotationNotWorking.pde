float[] A = {  
 
    -5, -5
  
};
float[] B = {  
  
    5, -5
  
};



float[] C = {  
  
    5, 5
  
};


float[] D = {  
  
    -5, 5
  
};



float[] ANew = {  
 
    -5, -5
  
};
float[] BNew = {  
  
    5, -5
  
};



float[] CNew = {  
  
    5, 5
  
};


float[] DNew = {  
  
    -5, 5
  
};




float size = 20;

float[][] Z = {  
  {
    size, 0
  }
  , 
  {
    0, size
  }
  ,
}; 

float theta =1;


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


void setup(){
size(600,600);
background(250); 

}

void draw(){
  

 
 
  background(250); 

  size = int(map(mouseY,0,600,1,30));

theta = map(mouseX,0,600,0,TWO_PI);

//theta =(PI);



float[][] Z = {  
  {
    size, 0
  }
  , 
  {
    0, size
  }
  ,
}; 



float[][] X = {  
  {
   cos(theta), sin(theta)
  }
  , 
  {
 -sin(theta), cos(theta)
  }
  ,
}; 
////////////////////////////////////////

float[] ANew = {  
 
    -5, -5
  
};
float[] BNew = {  
  
    5, -5
  
};



float[] CNew = {  
  
    5, 5
  
};


float[] DNew = {  
  
    -5, 5
  
};

////////////////////////////////////////////////////////
/*
for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

          ANew[i] += A[i] * Z[k][j];
        }
    
  }
  
}


for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

          BNew[i] += B[i] * Z[k][j];
        }
    
  }
  
}

for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

         CNew[i] += C[i] * Z[k][j];
        }
    
  }
  
}



for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

         DNew[i] += D[i] * Z[k][j];
        }
    
  }
  
}

*/











for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

          ANew[i] += A[i] * X[k][j];
        }
    
  }
  
}


for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

          BNew[i] += B[i] * X[k][j];
        }
    
  }
  
}

for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

         CNew[i] += C[i] * X[k][j];
        }
    
  }
  
}



for (int i=0; i < 2; i++){
  
  for (int j=0; j < 2; j++) {
    
     for (int k=0; k < 2; k++) { 

         DNew[i] += D[i] * X[k][j];
        }
    
  }
  
}












  translate(width/2,height/2);
 fill(200,0,0);
  quad(BNew[0], BNew[1], ANew[0], ANew[1], DNew[0], DNew[1], CNew[0], CNew[1]);



}





