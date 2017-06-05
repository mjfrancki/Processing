float pop = 100000; //populationn test size
float infection  = 0.002; //0.001; //strength of infection
float test= 0.50; //accuracy 

float healthy=0;
float diseased=0;

float healthyPositive=0;
float healthyNegative=0;
float diseasedPositive=0;
float diseasedNegative=0;
float n=0;

void setup(){
 
 diseased = pop * infection;
 healthy = pop - diseased;
 
 diseasedPositive = diseased * test;
 diseasedNegative = diseased- diseasedPositive;
 
 healthyNegative = healthy * test;
 healthyPositive = healthy - healthyNegative;
 
 n =100*(diseasedPositive/(healthyPositive+diseasedPositive));
 
 
 
 println(n);


// println(diseased);
// 
//  println(diseasedPositive);
//   println(healthyPositive);
  
} 
