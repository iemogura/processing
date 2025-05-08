color c = color(0, 100, 100); 

void setup(){
  size(400,400);
  colorMode(HSB, 360,100,100); 
}
void draw(){
  circle(200, 200, 400);

  for(int i = 0; i < 360; i++){
    c = color(i, 100, 100); 
    stroke(c);
    line(200, 200, 200+ 200*sin(TWO_PI*i/360),200+ 200* cos(TWO_PI*i/360));  
  }
  save("icon.png");

}
