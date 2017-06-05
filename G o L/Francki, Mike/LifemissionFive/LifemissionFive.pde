////press "g" for a glider 

/////////////////ok this is kinda confusing but this is how you change the rules, the number keys corrispond to the rule regarding that many niegbers 
//////////////// for examble pressing the 3 key will change the rule from one there are 3 neighbors the cell dies to the cell stays the same to the cell comes to life then
//////////////// back to the cell dieing. you can see the state of each of the 9 rules at the bottem of the screen.  


//////////////////up to run
/////////////////down to clear 




//To change rules count(number of neighbor) = 0 || 1 || 2        0=die, 1=stay the same, 2 = come to life 

int count0 = 0;
int count1 = 0;
int count2 = 1;
int count3 = 2;
int count4 = 0;
int count5 = 0;
int count6 = 0;
int count7 = 0;
int count8 = 0;

String button0 ="D";
String button1 ="D";
String button2 ="D";
String button3 ="D";
String button4 ="D";
String button5 ="D";
String button6 ="D";
String button7 ="D";
String button8 ="D";

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
  size(500, 600);
}


void draw() {

  frameRate(30);

  //neighborCount = 0;

  for (int j=1; j<49; j++) { 
    X=j*10;

    for (int i=1; i<49; i++) {  

      Y=i*10;

      if ( myArray[j][i] == false ) {

        fill(255, 255, 255);
      }


      if ( myArray[j][i] == true ) {

        fill(0, 0, 0);
      }


      rect(X, Y, 10, 10);  



      //////////////////////////////////////////////////////////////////////////
      if (run) { 

        neighborCount = 0;

        if ((j>1)&&(i>1)&&(j<49)&&(i<49)) {

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

        ////////////////////////////////////////////////////////////////////////// rules

        if (neighborCount == 0) {

          if (count0 == 0) {
            myNewArray[j][i]=false;
          }

          if (count0 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count0 == 2) {
            myNewArray[j][i]=true;
          }
        }





        if (neighborCount == 1) {

          if (count1 == 0) {
            myNewArray[j][i]=false;
          }

          if (count1 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count1 == 2) {
            myNewArray[j][i]=true;
          }
        }



        if (neighborCount == 2) {

          if (count2 == 0) {
            myNewArray[j][i]=false;
          }

          if (count2 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count2 == 2) {
            myNewArray[j][i]=true;
          }
        }


        if (neighborCount == 3) {

          if (count3 == 0) {
            myNewArray[j][i]=false;
          }

          if (count3 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count3 == 2) {
            myNewArray[j][i]=true;
          }
        }

        if (neighborCount == 4) {

          if (count4 == 0) {
            myNewArray[j][i]=false;
          }

          if (count4 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count4 == 2) {
            myNewArray[j][i]=true;
          }
        }


        if (neighborCount == 5) {

          if (count5 == 0) {
            myNewArray[j][i]=false;
          }

          if (count5 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count5 == 2) {
            myNewArray[j][i]=true;
          }
        }  


        if (neighborCount == 6) {

          if (count6 == 0) {
            myNewArray[j][i]=false;
          }

          if (count6 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count6 == 2) {
            myNewArray[j][i]=true;
          }
        }


        if (neighborCount == 7) {

          if (count7 == 0) {
            myNewArray[j][i]=false;
          }

          if (count7 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count7 == 2) {
            myNewArray[j][i]=true;
          }
        }


        if (neighborCount == 8) {

          if (count8 == 0) {
            myNewArray[j][i]=false;
          }

          if (count8 == 1) {
            myNewArray[j][i]=myArray[j][i];
          }

          if (count8 == 2) {
            myNewArray[j][i]=true;
          }
        }
      }//close if run
    }// close smaller for loop
  }//close big for loop



  if (run) {

    myArray = myNewArray;
    myNewArray= new boolean[50][50];/////////////////this one line fixed my whole code
  }

  fill(225, 225, 225);
  ellipse(50, 550, 30, 30);
  fill(0, 0, 0);
  text( button0, 50, 550);

  fill(225, 225, 225);
  ellipse(100, 550, 30, 30);
  fill(0, 0, 0);
  text(button1, 100, 550);

  fill(225, 225, 225);
  ellipse(150, 550, 30, 30);
  fill(0, 0, 0);
  text(button2, 150, 550);

  fill(225, 225, 225);
  ellipse(200, 550, 30, 30);
  fill(0, 0, 0);
  text(button3, 200, 550);

  fill(225, 225, 225);
  ellipse(250, 550, 30, 30);
  fill(0, 0, 0);
  text(button4, 250, 550);

  fill(225, 225, 225);
  ellipse(300, 550, 30, 30);
  fill(0, 0, 0);
  text(button5, 300, 550);

  fill(225, 225, 225);
  ellipse(350, 550, 30, 30);
  fill(0, 0, 0);
  text(button6, 350, 550);

  fill(225, 225, 225);
  ellipse(400, 550, 30, 30);
  fill(0, 0, 0);
  text(button7, 400, 550);

  fill(225, 225, 225);
  ellipse(450, 550, 30, 30);
  fill(0, 0, 0);
  text(button8, 450, 550);

  if (count0 == 0) {
    button0 ="D";
  }

  if (count0 == 1) {
    button0 ="S";
  }

  if (count0 == 2) {

    button0 ="L";
  }


  if (count1 == 0) {
    button1 ="D";
  }

  if (count1 == 1) {
    button1 ="S";
  }

  if (count1 == 2) {

    button1 ="L";
  }

  if (count2 == 0) {
    button2 ="D";
  }

  if (count2 == 1) {
    button2 ="S";
  }

  if (count2 == 2) {

    button2 ="L";
  }

  if (count3 == 0) {
    button3 ="D";
  }

  if (count3 == 1) {
    button3 ="S";
  }

  if (count3 == 2) {

    button3 ="L";
  }


  if (count4 == 0) {
    button4 ="D";
  }

  if (count4 == 1) {
    button4 ="S";
  }

  if (count4 == 2) {

    button4 ="L";
  }


  if (count5 == 0) {
    button5 ="D";
  }

  if (count5 == 1) {
    button5 ="S";
  }

  if (count5 == 2) {

    button5 ="L";
  }


  if (count6 == 0) {
    button6 ="D";
  }

  if (count6 == 1) {
    button6 ="S";
  }

  if (count6 == 2) {

    button6 ="L";
  }

  if (count7 == 0) {
    button7 ="D";
  }

  if (count7 == 1) {
    button7 ="S";
  }

  if (count7 == 2) {

    button7 ="L";
  }

  if (count8 == 0) {
    button8 ="D";
  }

  if (count8 == 1) {
    button8 ="S";
  }

  if (count8 == 2) {

    button8 ="L";
  }
} //close draw

void mousePressed() {

  fill(200, 0, 0);

  mouseOverSquareX = int(map(mouseX, 0, 500, 0, 50));
  mouseOverSquareY = int(map(mouseY, 0, 500, 0, 50));
  print(mouseOverSquareX);
  print("-");
  println(mouseOverSquareY);

  if (mouseX > 0 && mouseX < 500 && mouseY > 0  && mouseY < 500) {

    myArray[mouseOverSquareX][mouseOverSquareY]=!myArray[mouseOverSquareX][mouseOverSquareY];
  }
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


if (key == '0'){

     count0++;
  if(count0>2) {
  count0=0;
  }
}

if (key == '1'){

     count1++;
  if(count1>2) {
  count1=0;
  }
}


if (key == '2'){

     count2++;
  if(count2>2) {
  count2=0;
  }
}

if (key == '3'){

     count3++;
  if(count3>2) {
  count3=0;
  }
}

if (key == '4'){

     count4++;
  if(count4>2) {
  count4=0;
  }
}

if (key == '5'){

     count5++;
  if(count5>2) {
  count5=0;
  }
}


if (key == '6'){

     count6++;
  if(count6>2) {
  count6=0;
  }
}

if (key == '7'){

     count7++;
  if(count7>2) {
  count7=0;
  }
}

if (key == '8'){

     count8++;
  if(count8>2) {
  count8=0;
  }
}




if (key == 'g'){
 // myArray= new boolean[50][50];

myArray[5][45] = true;
myArray[6][45] = true;
myArray[7][45] = true;
myArray[7][46] = true;
myArray[6][47] = true;
}



}

