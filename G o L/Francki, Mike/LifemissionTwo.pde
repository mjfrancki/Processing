float X =0;
float Y =0;

int bla;

int mouseOverSquareX=0;
int mouseOverSquareY=0;

boolean[][] myArray = new boolean[50][50];

boolean clicked = false;


void setup(){
   size(500,500);



}


void draw(){
 

for(int j=0; j<50; j++){ 
X=j*10;
 
  for(int i=0; i<50; i++){  

    Y=i*10;

if( myArray[j][i] == false ){

fill(255,255,255);

}


if( myArray[j][i] == true ){

fill(0,0,0);

}


rect(X,Y,10,10);  


}  

}
  
mouseOverSquareX = int(map(mouseX, 0, 500, 0, 50));
mouseOverSquareY = int(map(mouseY, 0, 500, 0, 50));
  
print(mouseOverSquareX);
print("-");
println(mouseOverSquareY);

}


void mousePressed() {

fill(200,0,0);
  
  
  myArray[mouseOverSquareX][mouseOverSquareY]=!myArray[mouseOverSquareX][mouseOverSquareY];
  
}
