void setup(){
  size(720,720);
background(0);
  noStroke();
translate(width/2,height/2);
  for(int i = 0 ; i < 14; i++){
    if( (i%2) == 0){
     fill(255);
   } else {
      fill(0);
   }
    circle(0,0,(14 - i) /14.0  * width); 
    if( i == 7){
      rotate(PI);
    }
    translate(width/28,0);
  }
  save("img.png");
}
