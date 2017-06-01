ArrayList <rouletteParts> rp;
final int rouletteNum=10;
final int cnt_X=100,cnt_Y=120;
boolean start, stop;
int tempTime=0;
float cosA,sinA;

void setup(){
  frameRate(180);
  size(200, 220);
  colorMode(HSB);
  
  rp=new ArrayList<rouletteParts> ();
  for( int i =0;i<rouletteNum;i++){
    rp.add(new rouletteParts(i));
  }
  cosA=cos(PI/rouletteNum);
  sinA=sin(PI/rouletteNum);
}

void draw(){
  background(100);
  textSize(12);
  fill(250);
  triangle(95,30,105,30,100,40);
  
  translate(cnt_X,cnt_Y);
  for( int i =0;i<rouletteNum;i++){
    rouletteParts p = rp.get( i );
    p.Update();
  }
  if(mousePressed){
    tempTime++;
    if(tempTime>120){
      tempTime=0;
    }
  }
}

void mousePressed(){
}

void mouseReleased(){
  println(tempTime);
}
  

class rouletteParts{
  int tempNum;
  
  rouletteParts(int num){
    //初期値の入力
    tempNum=num;
  }
  
  void Update(){
    //ボタンに対応した変数の変化
    //画像の描写
    pushMatrix();
    fill(250*tempNum/rouletteNum,150,250);
    rotate(-tempTime*PI/60+2*tempNum*PI/rouletteNum);
    quad(80*sinA,-80*cosA,40*sinA,-40*cosA,-40*sinA,-40*cosA,-80*sinA,-80*cosA);
    fill(0);
    text(tempNum,-6,-54);
    popMatrix();
  }
  
}