int num = 0;
int[] myNum=new int[1000];
int numCount = 0;
int total = 0;
float answer = 0 ;
boolean same = false;
int n=0;
void setup()
{



  while (n < 10000) {


    numCount++;
    num =int( random(365));  
    myNum[numCount] = num;



    for (int j = 0; j < numCount; j = j+1) {


      for (int i = 0  ; i < numCount; i = i+1) {

        if ((myNum[j] == myNum[i])&&(j!= i)) {
          same = true;
        }
      }
    }

    if (same==true) {
      n++;
      
     // println(n);
     numCount= numCount-1;
      answer = ( numCount + answer );

      //println( numCount);
      //println(answer);

      numCount = 0;
      myNum=new int[1000];
      same = false;
    }
  }

  answer = (answer/n);
  println(answer);
} 

