//次
//接線方向に揺らす
//揺らしてアニメーションにする
//一周を何分割に分けて描画するかの分割数
final int div = 48;

void setup(){
  size(1600,1600);
  colorMode(HSB, div,100,100); 
}
void draw(){
  circle(width/2, height/2, width);
//  strokeWeight(2);

color c = color(0, 100, 100); 
int len = 0;
  int coli = 0;

  int st_x = width/2;
  int st_y = height/2;
  int en_x = width/2;
  int en_y = height/2;

//何周するか
int numlap = 50;

  for(int i = 0; i < div * numlap; i++){
//中心円からの距離の算出
    len = width/2 * i / (div * numlap);
    en_x = int(width/2+ len*sin(TWO_PI*i/div));
    en_y = int(height/2+ len* cos(TWO_PI*i/div));

//色の算出
    coli = i;
    if(coli > div){
      coli = coli % div;
    }
    c = color(coli, 100, 100); 
    stroke(c);

//線の描画   
    line(st_x,st_y,en_x,en_y);

//次の開始点への代入
    st_x = en_x;
    st_y = en_y;

}

  save("icon.png");
  noLoop();
}
