
int nD = 2; //# of dimensions

int[][] SMatrix = new int[2][2]; //scale matrix
int[][] RMatrix = new int[2][2]; // rotate matrix
int[] vector =   {1,1} ;          // original vector
float theta = 0;


void setup(){

size(600,600);
  translate(300,300);
}
void draw(){
  background(255);
  translate(300,300);
  float[] sum =   {0,0} ;
  
    int[][] SMatrix = {  {-mouseY/2,0},
                        {0,-mouseY/2}  };
   
   theta = map (mouseX, -300,300,0,(2* PI)) ; //get angle from x position
   
 float[][] RMatrix = {  {cos(theta),sin(theta)},
                        {-sin(theta),cos(theta)}  };
   
   //rotate
    for (int i = 0; i < nD; i++) {
for (int j = 0; j < nD; j++) {

   sum[j] = (vector[i] * RMatrix[i][j]  ) + sum[j];
}
 }
 
 //scale
    for (int i = 0; i < nD; i++) {
for (int j = 0; j < nD; j++) {

    sum[j] = (SMatrix[j][i] * sum[j])+ sum[j] ;
   
    }
}
fill(255,0,0);
  quad(sum[0],sum[1],-sum[1],sum[0],-sum[0],-sum[1],sum[1],-sum[0]);
  
}
   
   
   
  


 
  

    


