class MainMenu{
  boolean check;
  PFont font;
  int selection;
  float speed;
  float posx;
  MainMenu(){
    check=true;
    font=loadFont("Consolas-Bold-32.vlw");    
    textFont(font);
    textSize(25);
    selection=0;
    posx=-500;
    speed=10;
  }
  
  void move(){
    if(posx<0) posx+=speed;
  }
  
  void show(){
    if(check) {
      fill(255);
      stroke(255);
      strokeWeight(5);
      line(width-210-posx,0,width-210-posx,height);
      textSize(27);
      text("VisualBooth",posx+width-200,40);
      text("v1.0",posx+width-100,72);
      textSize(16);
      text("Seleziona modalità:",width-width/4-5-posx,height/5); 
      text("Seleziona un algoritmo",width-width/4-5-posx,height/4+60);
      text("per il prodotto:",width-width/4-5-posx,height/4+76);
      textSize(27);      
      text(" Naturale ",width-width/4-posx,height/2-15);
      textSize(13);
      text("binaria naturale",width-width/4-posx+5,height/2);
      textSize(27);      
      text("Algoritmo di",width-width/4-posx,height/2+45);
      text("Booth",width-width/4+96-posx,height/2+70);
      textSize(13);
      text("complemento a 2",width-width/4-posx+5,height/2+85);
      textSize(27);          
      text("Bitpair",width-width/4-posx,height/2+130);
      textSize(13);
      text("complemento a 2",width-width/4-posx+5,height/2+2+145);      
      textSize(12);
      text("Credits:",width-width/4-posx,height/2+215);
      text("Alfio Alessandro Privitera",width-width/4-posx,height/2+230);
      text("Giacomo Andrea Rotondo Cocco",width-width/4-posx,height/2+245);
      text("Giuseppe Mazzara",width-width/4-posx,height/2+260);      
    }
  }
    
  void run(){
    move();
    show();
  }



}
