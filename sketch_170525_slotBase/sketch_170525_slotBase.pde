
final int slotWidth=50, slotHeight=80;
final int txS=20, h_txS=txS/2;
boolean stop1=false, stop2=false, stop3=false;
slotDraw sd1;
slotDraw sd2;
slotDraw sd3;

void setup() {
  size(250, 120);
  colorMode(HSB);
  sd1=new slotDraw(20, 20, round(random(10, 20)));
  sd2=new slotDraw(100, 20, round(random(10, 20)));
  sd3=new slotDraw(180, 20, round(random(10, 20)));
}


void draw() {
  background(0);
  if (mousePressed&&mouseY>20&&mouseY<100) {
    if (mouseX>sd1.stX&&mouseX<(sd1.stX+slotWidth)) {
      stop1=true;
    } else if (mouseX>sd2.stX&&mouseX<(sd2.stX+slotWidth)) {
      stop2=true;
    } else if (mouseX>sd3.stX&&mouseX<(sd3.stX+slotWidth)) {
      stop3=true;
    }
  }   
  sd1.Update(stop1);
  sd2.Update(stop2);
  sd3.Update(stop3);
}

void mousePressed() {
}

void keyPressed(){
  if( key == ' ' ){
    stop1=false;
    stop2=false;
    stop3=false;
  }
}

class slotDraw {
  int slotNum=0, cdTimer=0;
  int limTimer;
  int stX, stY;
  slotDraw(int _x, int _y, int _lt) {
    stX=_x;
    stY=_y;
    limTimer=_lt;

    noStroke();
    fill(0, 250, 250);
    rect(stX, stY, slotWidth, slotHeight);
    slotNum=round(random(0.5, 9.5));
  }

  void Update(boolean stop) {
    cdTimer++;
    if (!stop) {
      if (cdTimer>limTimer&&slotNum==9) {
        slotNum=0;
        cdTimer=0;
      } else if (cdTimer>limTimer) {
        slotNum++;
        cdTimer=0;
      }
    }
    noStroke();
    fill(0, 0, 100);
    rect(stX, stY, slotWidth, slotHeight);

    fill(slotNum*25, 200, 250);
    textSize(txS);
    text(slotNum, stX+slotWidth/2-h_txS, stY+slotHeight/2+h_txS);
  }
}