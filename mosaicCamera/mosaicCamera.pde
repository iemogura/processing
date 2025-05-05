import processing.video.*;

Capture cam;
int colnum = 0;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  
  cam.loadPixels(); //カメラ画像のpixel情報を読み込み
  int d = 15; //円の直径を定義
  // ライブカメラの映像から、円の直径の間隔ごとに、色情報を取得し、その色で円を描く
  for(int y = d / 2 ; y < height ; y += d) {
    for(int x = d / 2 ; x < width ; x += d) {
      fill(cam.pixels[y * width + x]);
      //ellipse(x, y, d, d);
      rect(x-d/2, y-d/2, d, d);
    }
  }

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

void captureEvent(Capture camera) {
  camera.read();
}
