


//////////////////up to run
/////////////////down to clear 









float X =0;
float Y =0;

boolean run = false;
int neighborCount = 0;


int mouseOverSquareX=0;
int mouseOverSquareY=0;

boolean[][] myArray = new boolean[50][50];
boolean[][] myNewArray = new boolean[50][50];

boolean clicked = false;


void setup() {
  size(500,500);
}


void draw() {

  frameRate(30);

  //neighborCount = 0;

  for(int j=1; j<49; j++) { 
    X=j*10;

    for(int i=1; i<49; i++) {  

      Y=i*10;

      if( myArray[j][i] == false ) {

        fill(255,255,255);
      }


      if( myArray[j][i] == true ) {

        fill(0,0,0);
      }


      rect(X,Y,10,10);  



      //////////////////////////////////////////////////////////////////////////
if (run){ 

      neighborCount = 0;
     
      if((j>1)&&(i>1)&&(j<49)&&(i<49)) {

        if (myArray[j-1][i-1]) {

          neighborCount++;
        }

        if (myArray[j-1][i]) {

          neighborCount++;
        }

        if (myArray[j-1][i+1]) {

          neighborCount++;
        }

        if (myArray[j][i-1]) {

          neighborCount++;
        }

        if (myArray[j][i+1]) {

          neighborCount++;
        }

        if (myArray[j+1][i-1]) {

          neighborCount++;
        }


        if (myArray[j+1][i]) {

          neighborCount++;
        }

        if (myArray[j+1][i+1]) {

          neighborCount++;
        }
      }

      //////////////////////////////////////////////////////////////////////////


      if (neighborCount == 3) {


        myNewArray[j][i]=true;
      }


      else if (neighborCount == 2) {

        myNewArray[j][i]=myArray[j][i];
      }
      else {

        myNewArray[j][i]=false;
      }
    

}//close if run
  
}// close smaller for loop
  }//close big for loop



if(run){

  myArray = myNewArray;
 myNewArray= new boolean[50][50];/////////////////this one line fixed my whole code


}

} //close draw

void mousePressed() {

  fill(200,0,0);

  mouseOverSquareX = int(map(mouseX, 0, 500, 0, 50));
  mouseOverSquareY = int(map(mouseY, 0, 500, 0, 50));
  print(mouseOverSquareX);
  print("-");
  println(mouseOverSquareY);
  myArray[mouseOverSquareX][mouseOverSquareY]=!myArray[mouseOverSquareX][mouseOverSquareY];
}




void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {

      run =! run;
      println(run);
    }
  }


if (key == CODED) {
    if (keyCode == DOWN) {

   myArray= new boolean[50][50];
    }
  }


}

