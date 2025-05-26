PImage img;
float sita = 0.01;
int frameCounter = 0;
void setup() {
  size(720,720);
  img = loadImage("img.png");
  imageMode(CENTER);
}

void draw() {
  translate(width/2,height/2);
  rotate(PI*sita);
  image(img, 0, 0);
  sita += 0.03;
  String num = nf(frameCounter++, 5, 0);
  save("img"+ num +".png");
}
