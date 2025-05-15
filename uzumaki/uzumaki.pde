int manyTimes = 20;
int pointNumber = 47;
float pointR = 0;
float sita = 0.0;
int sinR = 5;

void centerPoint(int x,int y){
  point(x+ width/2,y+ height/2);  
}

void centerPointLine(int x1,int y1,int x2,int y2){
  line(x1+ width/2,y1+ height/2,x2+ width/2,y2+ height/2);
}

void setup(){
  size(400,400);
  colorMode(HSB, 360,100,100); 
  frameRate(30);
}
void draw(){
  int[][] pointXY = new int[pointNumber * manyTimes][2];

  for(int i = 0; i < pointNumber * manyTimes ; i++){
    pointXY[i][0] = int(pointR*cos( ( (i%pointNumber) / float(pointNumber) ) * TWO_PI ));
    pointXY[i][1] = int(pointR*sin( ( (i%pointNumber) / float(pointNumber) ) * TWO_PI )); 
    pointR = pointR + 0.5;
  }
  int[][] npointXY = new int[pointNumber * manyTimes][2];
  for(int i = 0; i < pointNumber * manyTimes ; i++){
    npointXY[i][0] =
      pointXY[i][0] +
      int(
        sinR * 
        sin(sita + ( ( i % pointNumber ) / float(pointNumber) * TWO_PI) ) * 
        cos( atan2( pointXY[i][1] , pointXY[i][0] ) )
      );
    npointXY[i][1] = 
      pointXY[i][1]  + 
      int(
        sinR * 
        sin(sita + ( ( i % pointNumber ) / float(pointNumber)*TWO_PI))  * 
        sin( atan2(pointXY[i][1],pointXY[i][0]))
      );
  }



  background(255);
  //線の太さ
  strokeWeight(4);




  
  for(int i = 0; i < pointNumber * manyTimes - 1; i++ ){
    println(npointXY[i][0]+","+npointXY[i][1]);
    //    centerPoint(npointXY[i][0],npointXY[i][1]);
    stroke(color(int(360 * ( i % pointNumber) / pointNumber), 100, 100));
    centerPointLine(npointXY[i][0],npointXY[i][1],npointXY[i+1][0],npointXY[i+1][1]);
}
  pointR = 0;
//  noLoop();
sita = sita + 0.5;
}
