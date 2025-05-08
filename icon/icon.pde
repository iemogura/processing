
void setup(){
  size(400,400);
}
void draw(){
  circle(200, 200, 400);

  for(int i = 0; i < 360; i++){
  line(200, 200, 200+ 200*sin(TWO_PI*i/360),200+ 200* cos(TWO_PI*i/360));  
  }
  save("icon.png");

}
