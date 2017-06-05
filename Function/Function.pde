float Pythogorus (float dx, float dy){
  float hyp;
  hyp = sqrt (sq(dx)+sq(dy));
 return hyp;  
}

void setup(){
float LengthOfLine;
  LengthOfLine= Pythogorus(3,4);
println(LengthOfLine);
}
