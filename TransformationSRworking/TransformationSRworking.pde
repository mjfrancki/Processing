int[][] S = new int[2][2]; //scale matrix
int[][] R = new int[2][2]; // rotate matrix
int[] vector =   {1,1} ;          // original vector
float theta = 0;

float size = 20;





void setup(){
size(600,600);
background(250); 

}

void draw(){
  

 
 
  background(250); 

size = int(map(mouseY,0,600,1,30));

theta = map(mouseX,-300,300,0,TWO_PI);
 float[] sum =   {0,0} ;

 float[][] R = {  {cos(theta),sin(theta)},
                        {-sin(theta),cos(theta)}  };


float[][] S = {  
  {
    size, 0
  }
  , 
  {
    0, size
  }
  ,
}; 


////////////////////////////////////////





////////////////////////////////////////////////////////

    for (int i = 0; i < 2; i++) {
for (int j = 0; j < 2; j++) {

   sum[j] = (vector[i] * R[i][j]  ) + sum[j];
}
 }
 
 //scale
    for (int i = 0; i < 2; i++) {
for (int j = 0; j <2; j++) {

    sum[j] = (S[j][i] * sum[j])+ sum[j] ;
   
    }
}











  translate(width/2,height/2);
 fill(200,0,0);
  quad(sum[0],sum[1],-sum[1],sum[0],-sum[0],-sum[1],sum[1],-sum[0]);



}





