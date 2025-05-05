float a = random(-2.5, 2.5);float b = random(-2.5, 2.5);float c = random(-2.5, 2.5);float d = random(-2.5, 2.5);

float X, Y;
int frameCounter = 0;

void clifford(float x0, float y0,float a,float b,float c,float d,int iters) {
  var x = x0;
  var y = y0;
  
  for (int i = 0; i < iters; i++) {
    var xt = x;
    
    x = sin(a*y) + c*cos(a*x);
    y = sin(b*xt) + d*cos(b*y);
  }
  
  point(map(x, -2.5, 2.5, 0, width), map(y, -2.5, 2.5, height, 0));
}

void setup() {
  size(800, 800);
  background(255);
  
  noLoop();
}

void draw() {
  stroke(0, 20);
  while(true){
    for (int j = 0; j < 1000000; j++) {
      X = random(-10, 10);
      Y = random(-10, 10);
  
      clifford(X, Y, a, b, c, d, 100);
    }

    String num = nf(frameCounter++, 5, 0);
    save("img"+ num +".png");
    rect(0, 0, width, height);
    a = random(-2.5, 2.5);
    b = random(-2.5, 2.5);
    c = random(-2.5, 2.5);
    d = random(-2.5, 2.5);
    
  }
}
