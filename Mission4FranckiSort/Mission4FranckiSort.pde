float timeOne = 0;
float timeTwo = 0;
float sortTime= 0;


int n =100;
int temp = 0;
int[] num = new int[n];
int[]NewNumLess = new int[n];
int[]NewNumMore = new int[n];

int MoreThenMidCount = 0;
int LessThenMidCount = 0;

void setup() {
timeOne = millis();
  for (int k = 0; k < n ; k = k+1)
  {
    num[k] =int( random(100));
  }


  for (int j = 0; j < n ; j = j+1) {


    if (num[j] <=  49) {
      LessThenMidCount++ ;

      NewNumLess[LessThenMidCount - 1]= num[j];




      for (int i = LessThenMidCount-1; i > 0; i = i-1) {

        if ( NewNumLess[i] < NewNumLess[i-1]  )
        {
          temp=NewNumLess[i];
          NewNumLess[i] =  NewNumLess[i-1];
          NewNumLess[i-1] = temp;
        }
        else {
          break;
        }
      }
    }




    else {
      MoreThenMidCount++ ;
      NewNumMore[MoreThenMidCount-1]= num[j];


      for (int i = MoreThenMidCount-1; i > 0; i = i-1) {

        if ( NewNumMore[i] < NewNumMore[i-1]  )
        {
          temp=NewNumMore[i];
          NewNumMore[i] =  NewNumMore[i-1];
          NewNumMore[i-1] = temp;
        }
        else {
          break;
        }
      }
    }
  }

timeTwo = millis();
sortTime = timeTwo - timeOne; 




//  for (int m = 0; m < 10; m = m+1) {
//
//    println(num[m]);
//  }


  println();
  println();


  for (int m = 0; m < LessThenMidCount; m = m+1) {

    println(NewNumLess[m]);
  }









  for (int m = 0; m < MoreThenMidCount; m = m+1) {

    println(NewNumMore[m]);
  }


  println(sortTime);
}

