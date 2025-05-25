int manyTimes = 20;
int pointNumber = 47;
float pointR = 0;
float sita = 0.0;
int sinR = 8;

void centerPoint(float x,float y){
  point(x+ (width/2),y+ (height/2));  
}

void centerPointLine(float x1,float y1,float x2,float y2){
  line(x1+ width/2,y1+ height/2,x2+ width/2,y2+ height/2);
}

void setup(){
  size(400,400);
  colorMode(HSB, 360,100,100); 
  frameRate(30);
}

void draw(){
  float[][] pointXY = new float[pointNumber * manyTimes][2];

  for(int i = 0; i < pointNumber * manyTimes ; i++){
    pointXY[i][0] = pointR*cos( ( (i%pointNumber) / float(pointNumber) ) * TWO_PI );
    pointXY[i][1] = pointR*sin( ( (i%pointNumber) / float(pointNumber) ) * TWO_PI ); 
    pointR = pointR + 0.5;
  }

  float[][] npointXY = new float[pointNumber * manyTimes][2];

  for(int i = 0; i < pointNumber * manyTimes ; i++){
    float lengthR =  sinR * sin(sita + ( ( i % pointNumber ) / float(pointNumber) * TWO_PI) );
    //float lengthR =  sinR * sin(sita + ( ( i % pointNumber ) / float(pointNumber) * TWO_PI) );
    float xSita = cos( atan2( pointXY[i][1] , pointXY[i][0] ) );
    float ySita = sin( atan2( pointXY[i][1] , pointXY[i][0] ) );

    npointXY[i][0] =  pointXY[i][0] + lengthR * xSita ;
    npointXY[i][1] =  pointXY[i][1] + lengthR * ySita ;
  }



  background(255);
  //線の太さ
  strokeWeight(4);




  
  for(int i = 0; i < pointNumber * manyTimes - 1; i++ ){
   
    stroke(color(int(360 * ( i % pointNumber) / pointNumber), 100, 100));
    centerPoint(npointXY[i][0],npointXY[i][1]);
    //centerPointLine(npointXY[i][0],npointXY[i][1],npointXY[i+1][0],npointXY[i+1][1]);
  }

  pointR = 0;
  //noLoop();
  sita = sita + 0.5;
}
