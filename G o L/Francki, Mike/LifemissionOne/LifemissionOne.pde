float X =0;

float Y =0;
void setup(){
   size(500,500);
}


void draw(){
 

for(int j=0; j<500; j=j+10){ 
X=j ;
  for(int i=0; i<500; i=i+10){  

    Y=i  ;
rect(X,Y,10,10);  


}  
}
   

}

