int[] A = {  
 
    5, -5
  
};
int[] B = {  
  
    5, 5
  
};



int[] C = {  
  
    -5, 5
  
};


int[] D = {  
  
    -5, -5
  
};




int[] ANew = {  
 
    5, -5
  
};
int[] BNew = {  
  
    5, 5
  
};



int[] CNew = {  
  
    -5, 5
  
};


int[] DNew = {  
  
    -5, -5
  
};




int size = 20;

int[][] Z = {  
  {
    size, 0
  }
  , 
  {
    0, size
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


int[][] Z = {  
  {
    size, 0
  }
  , 
  {
    0, size
  }
  ,
}; 

int[] ANew = {5, -5};

int[] BNew = {  
  
    5, 5
  
};



int[] CNew = {  
  
    -5, 5
  
};


int[] DNew = {  
  
    -5, -5
  
};


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




  translate(width/2,height/2);
 fill(200,0,0);
  quad(ANew[0], ANew[1], BNew[0], BNew[1], CNew[0], CNew[1], DNew[0], DNew[1]);



}





