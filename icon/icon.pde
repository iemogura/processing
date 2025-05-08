color c = color(0, 100, 100); 

void setup(){
  size(400,400);
  colorMode(HSB, 360,100,100); 
}
void draw(){
  circle(width/2, height/2, width);
  strokeWeight(4);
  for(int i = 0; i < 360; i++){
    c = color(i, 100, 100); 
    stroke(c);
    line(width/2, height/2, width/2+ width/2*sin(TWO_PI*i/360),height/2+ height/2* cos(TWO_PI*i/360));  
  }
  save("icon.png");
  noLoop();
}
