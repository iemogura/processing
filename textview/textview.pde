String[] lines;
PFont body;
int fontsize = 50;
int y = 0;
int[] pos;

void setup() {
  fullScreen();
  //動作確認用画面サイズ
  //size(1280, 1080);

  // フォントの読み込み　ツールフォント作成で作られるフォントは使用できない。
  textFont(createFont("TakaoPGothic.ttf",fontsize,true));

  // テキストファイル読み込み
  lines = loadStrings("test.txt");

  // フレームレートの設定
  frameRate(60);

  // テキストの位置を保管する配列変数
  pos = new int[lines.length];
  // 初期化
  for(int i = 0; i < pos.length; i++){
    pos[i] = i;
  }
}

void draw() {
  background(0); // 背景黒
  //　線の色緑
  stroke(0, 255, 0);
// 一旦保留　改行対応に使用予定
//  float width;

// 文字描画
  for (int i = 0; i < lines.length; i++) {
// テキスト描画
    text(lines[pos[i]], 0,fontsize * i + fontsize + y);
// テキスト左端を取得
//    width = textWidth(lines[pos[i]]);

// テキストの上下ラインを描画    
    line(0,fontsize * i + y,2000,fontsize * i + y);
    line(0,fontsize * i + fontsize + y,2000,fontsize * i + fontsize + y);
}
// 画面外の文字を描画
  text(lines[pos[lines.length - 1]], 0, y);

//--下から上に向かう処理---------------------- 
  y = y - 5;
  if(y < 0){
    y = fontsize;
    for(int i = 0; i < pos.length; i++){
      if(pos[i] + 1 >= lines.length){
        pos[i] = 0;
      } else {
        pos[i] = pos[i] + 1;
      }
    }
  }
//--------------------------------------------
//--上から下に向かう処理----------------------
/*
  y++;
  if(y > fontsize){
    y = 0;
    for(int i = 0; i < pos.length; i++){
      if(pos[i] - 1 < 0){
        pos[i] = pos.length - 1;
      } else {
        pos[i] = pos[i] - 1;
      }
    }
  }
*/
//--------------------------------------------
}
