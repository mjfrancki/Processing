int[][] A = {  
  {
    1, 0, 1
  }
  , 
  {
    0, 1, 0
  }
  , 
  {
    1, 0, 1
  }
  ,
}; //Single Flight




int[][] B = {  
  {
    1, 0, 1
  }
  , 
  {
    0, 1, 0
  }
  , 
  {
    1, 0, 1
  }
  ,
}; //first matrix

int[][] C = new int[3][3]; //Single Flight 

int n=1;

void setup() {

  for (int t=0; t <  n; t++) {


    for (int i=0; i < 3; i++) { 
      for (int j=0; j < 3; j++) {  
        for (int k=0; k < 3; k++) { 

          C[i][j] += A[i][k] * B[k][j];
        }
      }
    }


println();
    for (int i=0; i < 3; i++) {
      for (int j=0; j <3; j++) {
        println("[" + i + "][" + j + "] = " + C[i][j]);
      }
    }

 
 
    A=C;
  C = new int[3][3];


    
 
  }


}

