int n = 100000;
int temp = 0;
int[] num=new int[n];

float timeOne = 0;
float timeTwo = 0;
float sortTime= 0;

void setup() {

   for (int k = 1; k < n ; k = k+1)
   {
    num[k] =int( random(100)); 
   }
  
  
timeOne = millis();
  
  for (int j = 1; j < n-1 ; j = j+1) {

    for (int i = 0; i < n-j; i = i+1) {

      if (num[i] > num[i+1])
      {
        temp=num[i];
        num[i] = num[i+1];
        num[i+1] = temp;
      }
    }
  }

timeTwo = millis();
sortTime = timeTwo - timeOne; 


for (int m = 0; m < n; m = m+1) {

  println(num[m]);
  
}
println(sortTime);

}
