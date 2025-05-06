float a = 0.0;
float b = 0.0;
float c = 0.0;
float d = 0.0;

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
}

void draw() {
  
  stroke(0, 20);
  while(true){
    a = random(-25, 25)/10;
    b = random(-25, 25)/10;
    c = random(-25, 25)/10;
    d = random(-25, 25)/10;
    for (int j = 0; j < 1000000; j++) {
      X = random(-10, 10);
      Y = random(-10, 10);
  
      clifford(X, Y, a, b, c, d, 100);
    }
    String conditions = " a = "+a+" b = "+b+" c = "+c+" d = "+d;
    println(conditions);
    fill(0);
    textSize(16);
//    textAlign(CENTER, CENTER);
    text(conditions, 0, height);

    String num = nf(frameCounter++, 5, 0);
    save("img"+ num +".png");

    fill(255);
    rect(0, 0, width, height);
 
  }
}
