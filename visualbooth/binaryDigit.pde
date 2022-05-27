class binaryDigit{
  float x,y;
  int c;
  boolean selected;
  boolean answer;
  boolean brect;
  color bg;
  color dcol;
  int[] val;
  int[] val1={0,1};
  int[] val2={-1,0,1};
  int[] val3={-2,-1,0,1,2};
  int index;
  binaryDigit(float x,float y,int c){
    this.x=x;
    this.y=y;
    this.c=c;
    selected=false;
    answer=false;
    brect=true;
    bg=color(255);
    dcol=color(0);
    val=val1;
    index=0;
  }
  
  void show(){
    if(brect){
      fill(bg);
      stroke(0,50);
      rect(x,y,40,40);
    }
    fill(dcol);    
    if(c>=0)    text(c,x+15,y+35);
    else text(c,x+3,y+35);
    if(!answer){
      if(mouseX>=x&&mouseX<=x+40&&mouseY>=y&&mouseY<=y+40){
         noStroke();  fill(#557777,150); rect(x,y,40,40);
      }
    }
    fill(0);
  }
  
  void setC(){
    if(index<val.length-1) index++;
    else index=0;
    this.c=val[index];
  }
  
  void setVal(int t){
    if(t==1) val=val1;
    if(t==2) val=val2;
    if(t==3) val=val3;
  }
  
  void mousecheck(){
    if(mouseX>=x&&mouseX<=x+40&&mouseY>=y&&mouseY<=y+40) selected=true;
  }
  
  void run(){
    if(selected) {setC(); selected=false;}
    show();
  }

}
