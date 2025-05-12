//次
//接線方向に揺らす
//揺らしてアニメーションにする
//一周を何分割に分けて描画するかの分割数
final int div = 32;
//何周するか
final int numlap = 70;
//どのくらい座標にばらつきをもたせるか？
final int ramxy = 25;

void setup(){
  size(1600,1600);
  colorMode(HSB, div,100,100); 
}
void draw(){
  circle(width/2, height/2, width);
  //線の太さ
  strokeWeight(8);

color c = color(0, 100, 100); 
int len = 0;
  int coli = 0;

  int st_x = width/2;
  int st_y = height/2;
  int en_x = width/2;
  int en_y = height/2;


float add_x = 0;
float add_y = 0;
  for(int i = 0; i < div * numlap; i++){
//中心円からの距離の算出
    len = width/2 * i / (div * numlap);
    add_x = random(-ramxy,ramxy);
    add_y = random(-ramxy,ramxy);
    
    en_x = int(width/2+ len*sin(TWO_PI*i/div)+add_x);
    en_y = int(height/2+ len* cos(TWO_PI*i/div)+add_y);

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
