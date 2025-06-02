int colnum = 0;

void setup() {
  size(640, 480);

  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  
  //現在時刻取得それを文字列化
  String h = nf(hour(), 2, 0);
  String m = nf(minute(), 2, 0);
  String s = nf(second(), 2, 0);  
  String timeString = h+":"+m+":"+s;

  //テキストの大きさと座標を指定
  int textSize = 40;
  int timePos_x = 20;
  int timePos_y = 20;
  int gap = 5;

  //テキストサイズを設定
  textSize(textSize);

  //時刻が見えやすいように四角で塗る
  noStroke();
  fill(181, 98, 94);
  rect(timePos_x - gap, timePos_y - gap, textWidth(timeString) + 2*gap, textSize - textDescent() + 2*gap);

  //時刻を表示
  fill(2, 93, 93);
  textAlign(LEFT, TOP);
  text(h+":"+m+":"+s , timePos_x, timePos_y); 
} 
