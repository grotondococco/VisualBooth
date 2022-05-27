class QuizSquare{
  float x,y;
  float speed;
  QuizSquare(float x,float y){
    this.x=x;
    this.y=y;
    speed=-5;
  }
  
  void move(){
    if(x>=width-30) x+=speed;
  }
  
  void show(){
    textSize(32);
    fill(255,30);
    stroke(0);
    strokeWeight(3);
    rect(x,y,120,125);
    fill(0);
    text("Q",x+10,y+30);
    text("U",x+10,y+60);
    text("I",x+10,y+85);
    text("Z",x+10,y+115);    
  }
  
  
  void run(){
    move();
    show();    
  }

}
