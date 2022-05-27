MainMenu mm;
PImage bg;
PImage start;
PImage freccia;
PImage frecciasomma;
PImage croce;
boolean triggermm;
boolean quizmode=false;
ArrayList<binaryDigit> bd1;
ArrayList<binaryDigit> bd2;
int[] array1;
int[] array2;
int[] arrayb;
int[] arraybp;
boolean arrayloaded;
ArrayList<binaryDigit> bd3;
ArrayList<binaryDigit> bd4;
ArrayList<binaryDigit> bd5;
ArrayList<binaryDigit> bd6;
ArrayList<binaryDigit> bd7;
ArrayList<binaryDigit> bd8;
ArrayList<binaryDigit> bd9;
ArrayList<binaryDigit> bd10;
ArrayList<binaryDigit> bd11;
ArrayList<binaryDigit> bdb;
ArrayList<binaryDigit> bdq; 
ArrayList<binaryDigit> bdc; 
ProdottoC pcol;
Booth pbooth;
Bitpair pbp;
QuizSquare qsquare;
void setup(){
  size(800,600);
  bg=loadImage("bg.jpg");
  bg.resize(800,600);
  start=loadImage("start.png");
  start.resize(80,80);
  freccia=loadImage("freccetta.png");
  freccia.resize(32,32);
  frecciasomma=loadImage("frecciasomma.png");
  croce=loadImage("croce.png");
  mm=new MainMenu();
  qsquare=new QuizSquare(width+100,height-200);  
  triggermm=true;
  arrayloaded=false;
  bd1=new ArrayList<binaryDigit>();
  bd2=new ArrayList<binaryDigit>();
  bdb=new ArrayList<binaryDigit>();
  bdc=new ArrayList<binaryDigit>();
  for(int i=0;i<8;i++) bd1.add(new binaryDigit(width/2+20+i*40,10,0));
  for(int i=0;i<8;i++) bd2.add(new binaryDigit(width/2+20+i*40,60,0)); 
  for(int i=0;i<8;i++) bdb.add(new binaryDigit(width/2+20+i*40,100,0));
  for(int i=0;i<8;i++) bdc.add(new binaryDigit(width/2+20+i*40,100,0));   
  for(binaryDigit bd:bdb) {bd.brect=false; bd.answer=true;}  
  for(binaryDigit bd:bdc) {bd.brect=false;}    
  bd3=new ArrayList<binaryDigit>();
  bd4=new ArrayList<binaryDigit>(); 
  bd5=new ArrayList<binaryDigit>();
  bd6=new ArrayList<binaryDigit>();
  bd7=new ArrayList<binaryDigit>();
  bd8=new ArrayList<binaryDigit>();
  bd9=new ArrayList<binaryDigit>();
  bd10=new ArrayList<binaryDigit>();
  bd11=new ArrayList<binaryDigit>();
  bdq=new ArrayList<binaryDigit>();
  for(int i=0;i<16;i++) bd3.add(new binaryDigit(100+i*40,150,0));
  for(int i=0;i<16;i++) bd4.add(new binaryDigit(100+i*40,200,0));
  for(int i=0;i<16;i++) bd5.add(new binaryDigit(100+i*40,250,0));
  for(int i=0;i<16;i++) bd6.add(new binaryDigit(100+i*40,300,0));
  for(int i=0;i<16;i++) bd7.add(new binaryDigit(100+i*40,350,0));
  for(int i=0;i<16;i++) bd8.add(new binaryDigit(100+i*40,400,0));
  for(int i=0;i<16;i++) bd9.add(new binaryDigit(100+i*40,450,0));
  for(int i=0;i<16;i++) bd10.add(new binaryDigit(100+i*40,500,0));
  for(int i=0;i<16;i++) bd11.add(new binaryDigit(100+i*40,550,0)); 
  for(int i=0;i<16;i++) bdq.add(new binaryDigit(100+i*40,550,0));   
}

void draw(){
  image(bg,0,0);
  mouseover();
  if(triggermm) {
    mm.run();
    textSize(32);
    if(quizmode)  text("   QUIZ",width-width/4-5-mm.posx,height/5+30);
    else text("SIMULAZIONE",width-width/4-5-mm.posx,height/5+30);
  }
  else{
    fill(#66BBAA);
    noStroke();
    rect(0,0,width,height);
    mouseover();
    fill(0);
    textSize(32);    
    text("X",width-40,43);
    text("=",width-40,90);
    if(quizmode){         
        for(int i=0;i<8;i++){
          bd1.get(i).answer=true;
          bd2.get(i).answer=true;
        }
    }
    for(binaryDigit bd:bd1) bd.run();    
    for(binaryDigit bd:bd2) bd.run();
    fill(0);
    if(arrayloaded){
      if(!quizmode||esit(bdc,bdb)){ 
        textSize(20);
        for(int i=1;i<9;i++) { 
          String passo="PASSO "+i+":";
          text(passo,5,130+i*50);
        }
        textSize(16);
        text("RISULTATO:",5,580);
        textSize(32);    
        
        stroke(0); strokeWeight(5);line(width/2+20,140,width/2+340,140);      
        for(binaryDigit bd:bd3) bd.run();
  
        if(mm.selection==3&&(arraybp[7]==-2||arraybp[7]==2)) {
          textSize(16);         
          text("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",width/2-2,200);
          textSize(32);            
        }
        else stroke(0); strokeWeight(3);line(width/2+20,195,width/2+340,195); //
        for(binaryDigit bd:bd4) bd.run();
        
        stroke(0); strokeWeight(3);line(width/2-20,245,width/2+300,245);      
        for(binaryDigit bd:bd5) bd.run();      
        
        if(mm.selection==3&&(arraybp[5]==-2||arraybp[5]==2)) {
          textSize(16);        
          text("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",width/2-82,300);
          textSize(32);            
        }
        else stroke(0); strokeWeight(3);line(width/2-60,295,width/2+260,295);     
        for(binaryDigit bd:bd6) bd.run();
        
        stroke(0); strokeWeight(3);line(width/2-100,345,width/2+220,345);      
        for(binaryDigit bd:bd7) bd.run();
        
        if(mm.selection==3&&(arraybp[3]==-2||arraybp[3]==2)) {
          textSize(16);        
          text("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",width/2-162,400);
          textSize(32);            
        }
        else stroke(0); strokeWeight(3);line(width/2-140,395,width/2+180,395);     
        for(binaryDigit bd:bd8) bd.run();
        
        stroke(0); strokeWeight(3);line(width/2-180,445,width/2+140,445);      
        for(binaryDigit bd:bd9) bd.run();
        
        if(mm.selection==3&&(arraybp[1]==-2||arraybp[1]==2)) {
          textSize(16);        
          text("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",width/2-242,500);
          textSize(32);            
        }
        else stroke(0); strokeWeight(3);line(width/2-220,495,width/2+100,495);      
        for(binaryDigit bd:bd10) bd.run();
        
        stroke(0); strokeWeight(5);line(width/2-300,545,width/2+340,545);      
        if(!quizmode) for(binaryDigit bd:bd11) bd.run();   
        else for(binaryDigit bd:bdq) bd.run();
      } 
    }
    fill(0);        
    textSize(28);
    if(mm.selection==1){
      text("Prodotto naturale",20,40);
      textSize(15);
      text("(rappresentazione binaria naturale)",20,65);  
    }
    if(mm.selection==2){
      text("Prodotto con ",20,40);
      text("algoritmo di Booth",30,65);
      textSize(15);
      text("(rappresentazione in complemento a 2)",15,85);      
      if(arrayloaded){
        textSize(14);
        text("cod. di Booth:",width/2-100,130);
        textSize(32);
        image(freccia,width-60,100);
        if(!quizmode)for(binaryDigit bd:bdb) bd.run();
        else for(binaryDigit bd:bdc) bd.run();
      }   
    }
    if(mm.selection==3){
      text("Prodotto con",20,40);
      text("Bitpair",55,65);
      textSize(15);
      text("(rappresentazione in complemento a 2)",15,85);
      if(arrayloaded){
        textSize(14);
        text("cod. BitPair:",width/2-100,130);
        textSize(32);
        image(freccia,width-60,100);
        //i bit significativi della codifica con bitpair sono solo 4, gli altri 4 sono sempre nulli e costituiscono una NO OP
        if(!quizmode){      
        bdb.get(1).run();
        bdb.get(3).run();
        bdb.get(5).run();
        bdb.get(7).run();
        }
        else {
        //for(binaryDigit bd:bdc) bd.run();
        bdc.get(1).run();
        bdc.get(3).run();
        bdc.get(5).run();
        bdc.get(7).run();
        }        
      }      
      
    }
    textSize(24);
    text("Ritorna al menù",20,120);
    image(start,width/2-80,10);
    
    if(quizmode){      
      qsquare.run();    
       if(mm.selection==1){
         if(arrayloaded&&esit(bdq,bd11)) {
         fill(#188833);
         strokeWeight(5);
         text("OK",width-50,height-20);
         }
       }
       else{
         if(arrayloaded&&esit(bdc,bdb)){
             fill(#188833);
             strokeWeight(5);
             text("OK",width-50,160);
             if(arrayloaded&&esit(bdq,bd11)) {
             fill(#188833);
             strokeWeight(5);
             text("OK",width-50,height-20);
             }                
           }
    
       }
    }
  }
}

void mouseReleased(){      
      if(triggermm){
        if(mouseX>=width-width/4&&mouseX<=width-width/4+155 && mouseY>=height/2-40&&mouseY<=height/2+10)  {mm.selection=1;         triggermm=!triggermm;  mm.check=false;  }
        if(mouseX>=width-width/4&&mouseX<=width-width/4+180 && mouseY>=height/2+25&&mouseY<=height/2+95){  mm.selection=2;          triggermm=!triggermm;  mm.check=false;  }
        if(mouseX>=width-width/4&&mouseX<=width-width/4+120 && mouseY>=height/2+110&&mouseY<=height/2+160) { mm.selection=3;          triggermm=!triggermm;   mm.check=false;  }
        if(mouseX>=width-width/4-5&&mouseX<=width-width/4+200&&mouseY>=height/5+10&&mouseY<=height/5+30) quizmode=!quizmode;
      }
      else{
            if(!quizmode){      
            for(binaryDigit bd:bd1) bd.mousecheck();
            for(binaryDigit bd:bd2) bd.mousecheck();} 
            else if(mm.selection!=1) {
              for(binaryDigit bd:bdc) bd.mousecheck();
              if(esit(bdc,bdb)) {
                for(binaryDigit bd:bdq) bd.mousecheck();
                }
              } 
            else for(binaryDigit bd:bdq) bd.mousecheck();      
            if(mouseX>=20&&mouseX<=220&&mouseY>=100&&mouseY<=125) setup(); //reset della canvas
            if(mouseX>=width/2-80&&mouseX<=width/2&&mouseY>=10&&mouseY<=90) loadarray(); //pulsantestart           
      }
}

void loadarray(){
  array1=new int[8];
  array2=new int[8];
  if(!quizmode){
    for(int i=0;i<8;i++){
      array1[i]=bd1.get(i).c;
      array2[i]=bd2.get(i).c;
    }
  }
  else{        
    for(int i=0;i<8;i++){
      array1[i]=int(random(0,2));
      array2[i]=int(random(0,2));
      bd1.get(i).c=array1[i];
      bd2.get(i).c=array2[i]; 
      bdq.get(i).c=0;
      bdq.get(15-i).c=0;
    }
  }
  if(mm.selection==1){   
    pcol=new ProdottoC(array1,array2,8);
    for(int i=0;i<16;i++) bd3.get(i).c=pcol.Matrix[0][i];
    for(int i=0;i<16;i++) bd4.get(i).c=pcol.Matrix[1][i];
    for(int i=0;i<16;i++) bd5.get(i).c=pcol.Matrix[2][i];
    for(int i=0;i<16;i++) bd6.get(i).c=pcol.Matrix[3][i];
    for(int i=0;i<16;i++) bd7.get(i).c=pcol.Matrix[4][i];
    for(int i=0;i<16;i++) bd8.get(i).c=pcol.Matrix[5][i];
    for(int i=0;i<16;i++) bd9.get(i).c=pcol.Matrix[6][i];
    for(int i=0;i<16;i++) bd10.get(i).c=pcol.Matrix[7][i];
    for(int i=0;i<16;i++) bd11.get(i).c=pcol.result[i];

  //oscuramento a scala dei valori non usati della matrice delle operazioni - triangolo destro e sinistro
  for(int j=0;j<8;j++) bd3.get(j).bg=color(50,200);
  for(int j=15;j>8;j--) {bd10.get(j).bg=color(50,200);  bd4.get(15-j).bg=color(50,200);}
  for(int j=15;j>9;j--) {bd9.get(j).bg=color(50,200);  bd5.get(15-j).bg=color(50,200);}
  for(int j=15;j>10;j--) {bd8.get(j).bg=color(50,200);  bd6.get(15-j).bg=color(50,200);}
  for(int j=15;j>11;j--) {bd7.get(j).bg=color(50,200);  bd7.get(15-j).bg=color(50,200);}
  for(int j=15;j>12;j--) {bd6.get(j).bg=color(50,200);  bd8.get(15-j).bg=color(50,200);}
  for(int j=15;j>13;j--) {bd5.get(j).bg=color(50,200);  bd9.get(15-j).bg=color(50,200);}
  for(int j=15;j>14;j--) {bd4.get(j).bg=color(50,200);  bd10.get(15-j).bg=color(50,200);}
    
  }
  
  if(mm.selection==2){
    pbooth=new Booth(array1,array2,8);     
    arrayb=pbooth.Array_booth;
    for(int i=0;i<8;i++) bdb.get(i).c=arrayb[i];
    for(int i=0;i<16;i++) bd3.get(i).c=pbooth.Matrix[0][i];
    for(int i=0;i<16;i++) bd4.get(i).c=pbooth.Matrix[1][i];
    for(int i=0;i<16;i++) bd5.get(i).c=pbooth.Matrix[2][i];
    for(int i=0;i<16;i++) bd6.get(i).c=pbooth.Matrix[3][i];
    for(int i=0;i<16;i++) bd7.get(i).c=pbooth.Matrix[4][i];
    for(int i=0;i<16;i++) bd8.get(i).c=pbooth.Matrix[5][i];
    for(int i=0;i<16;i++) bd9.get(i).c=pbooth.Matrix[6][i];
    for(int i=0;i<16;i++) bd10.get(i).c=pbooth.Matrix[7][i];
    for(int i=0;i<16;i++) bd11.get(i).c=pbooth.result[i];
    
  //oscuramento parziale a scala per sezione relativa all'estensione del segno
  for(int j=0;j<8;j++) bd3.get(j).bg=color(140,200);
  for(int j=0;j<7;j++) bd4.get(j).bg=color(140,200);
  for(int j=0;j<6;j++) bd5.get(j).bg=color(140,200);
  for(int j=0;j<5;j++) bd6.get(j).bg=color(140,200);
  for(int j=0;j<4;j++) bd7.get(j).bg=color(140,200);
  for(int j=0;j<3;j++) bd8.get(j).bg=color(140,200);  
  for(int j=0;j<2;j++) bd9.get(j).bg=color(140,200);
  for(int j=0;j<1;j++) bd10.get(j).bg=color(140,200);    
    
  //oscuramento a scala per sezione relativa al triangolo destro
  for(int j=15;j>8;j--) {bd10.get(j).bg=color(50,200);}
  for(int j=15;j>9;j--) {bd9.get(j).bg=color(50,200);}
  for(int j=15;j>10;j--) {bd8.get(j).bg=color(50,200);}
  for(int j=15;j>11;j--) {bd7.get(j).bg=color(50,200);}
  for(int j=15;j>12;j--) {bd6.get(j).bg=color(50,200);}
  for(int j=15;j>13;j--) {bd5.get(j).bg=color(50,200);}
  for(int j=15;j>14;j--) {bd4.get(j).bg=color(50,200);} 
  
 //range per la codifica di booth quizmode 
  for(binaryDigit bd:bdc) bd.setVal(2);
  
  } 
  
  if(mm.selection==3){
    pbp=new Bitpair(array1,array2,8);     
    arraybp=pbp.Bit_Pair_Array;
    for(int i=0;i<8;i++) bdb.get(i).c=arraybp[i];
    for(int i=0;i<16;i++) bd3.get(i).c=pbp.Matrix[0][i];
    for(int i=0;i<16;i++) bd4.get(i).c=pbp.Matrix[1][i];
    for(int i=0;i<16;i++) bd5.get(i).c=pbp.Matrix[2][i];
    for(int i=0;i<16;i++) bd6.get(i).c=pbp.Matrix[3][i];
    for(int i=0;i<16;i++) bd7.get(i).c=pbp.Matrix[4][i];
    for(int i=0;i<16;i++) bd8.get(i).c=pbp.Matrix[5][i];
    for(int i=0;i<16;i++) bd9.get(i).c=pbp.Matrix[6][i];
    for(int i=0;i<16;i++) bd10.get(i).c=pbp.Matrix[7][i];
    for(int i=0;i<16;i++) bd11.get(i).c=pbp.result[i];

  //oscuramento parziale a scala per sezione relativa all'estensione del segno
  for(int j=0;j<8;j++) bd3.get(j).bg=color(140,200);
  for(int j=0;j<7;j++) bd4.get(j).bg=color(140,200);
  for(int j=0;j<6;j++) bd5.get(j).bg=color(140,200);
  for(int j=0;j<5;j++) bd6.get(j).bg=color(140,200);
  for(int j=0;j<4;j++) bd7.get(j).bg=color(140,200);
  for(int j=0;j<3;j++) bd8.get(j).bg=color(140,200);  
  for(int j=0;j<2;j++) bd9.get(j).bg=color(140,200);
  for(int j=0;j<1;j++) bd10.get(j).bg=color(140,200);    


  //fondo bianco per codifica di bitpar 2 o -2, per un bit aggiuntivo a sinistra
  if(arraybp[1]==-2||arraybp[1]==2)  bd9.get(1).bg=color(255);
  if(arraybp[3]==-2||arraybp[3]==2)  bd7.get(3).bg=color(255);
  if(arraybp[5]==-2||arraybp[5]==2)  bd5.get(5).bg=color(255);
  if(arraybp[7]==-2||arraybp[7]==2)  bd3.get(7).bg=color(255); 
    
  //oscuramento a scala per sezione relativa al triangolo destro
  for(int j=15;j>8;j--) {bd10.get(j).bg=color(50,200);}
  for(int j=15;j>9;j--) {bd9.get(j).bg=color(50,200);}
  for(int j=15;j>10;j--) {bd8.get(j).bg=color(50,200);}
  for(int j=15;j>11;j--) {bd7.get(j).bg=color(50,200);}
  for(int j=15;j>12;j--) {bd6.get(j).bg=color(50,200);}
  for(int j=15;j>13;j--) {bd5.get(j).bg=color(50,200);}
  for(int j=15;j>14;j--) {bd4.get(j).bg=color(50,200);} 

  //range per la codifica bitpair quizmode
  for(binaryDigit bd:bdc) bd.setVal(3);
  bdc.get(0).answer=true;
  bdc.get(2).answer=true;
  bdc.get(4).answer=true;
  bdc.get(6).answer=true;
  }
  
  //colorespeciale per la risposta
  for(int j=0;j<16;j++)  bd11.get(j).bg=color(200,200);
  
  //disabilitazione animazione al passaggio del mouse dei risultati
  for(int i=0;i<16;i++){
    bd3.get(i).answer=true;
    bd4.get(i).answer=true;
    bd5.get(i).answer=true;
    bd6.get(i).answer=true;
    bd7.get(i).answer=true;
    bd8.get(i).answer=true;
    bd9.get(i).answer=true;
    bd10.get(i).answer=true;
    bd11.get(i).answer=true;
  }
  arrayloaded=true;
}


void mouseover(){
     if(triggermm){
       if(mouseX>=width-width/4&&mouseX<=width-width/4+155 && mouseY>=height/2-40&&mouseY<=height/2+10&&mm.posx>=0)  { cursor(HAND); noStroke();     fill(#66BBAA,150); rect(width-width/4,height/2-40,155,50);  }
        else if(mouseX>=width-width/4&&mouseX<=width-width/4+180 && mouseY>=height/2+25&&mouseY<=height/2+95&&mm.posx>=0){ cursor(HAND); noStroke();     fill(#66BBAA,150);        rect(width-width/4,height/2+25,180,70);  }
        else if(mouseX>=width-width/4&&mouseX<=width-width/4+120 && mouseY>=height/2+110&&mouseY<=height/2+160&&mm.posx>=0) { cursor(HAND); noStroke();     fill(#66BBAA,150);       rect(width-width/4,height/2+110,120,50);  }
        else if(mouseX>=width-width/4-5&&mouseX<=width-width/4+200&&mouseY>=height/5+10&&mouseY<=height/5+30) { cursor(HAND); noStroke();     fill(#66BBAA,150);       rect(width-width/4-5,height/5+10,195,20);  }
        else   cursor(ARROW);  
      }
      else if(!quizmode||esit(bdc,bdb)){
      if(mouseX>=20&&mouseX<=220&&mouseY>=100&&mouseY<=125){             //RITORNOALMENU
          cursor(HAND); noStroke();     fill(#557777,150); rect(20,100,200,25);  
        }
        else if(mouseX>=width/2-80&&mouseX<=width/2&&mouseY>=10&&mouseY<=90) {        //start
          cursor(HAND); noStroke();     fill(#557777,150); ellipse(width/2-40,50,100,100); 
        }
        
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=130&&mouseY<=170&&arrayloaded==true){        //passo1
          noStroke(); fill(#CC0000,100); rect(5,150,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(7).x,bd2.get(7).y,40,45);
            else rect(bdb.get(7).x,bdb.get(7).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=180&&mouseY<=220&&arrayloaded==true){        //passo2
          noStroke(); fill(#CC0000,100); rect(5,200,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(6).x,bd2.get(6).y,40,45);
            else rect(bdb.get(6).x,bdb.get(6).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=230&&mouseY<=270&&arrayloaded==true){        //passo3
          noStroke(); fill(#CC0000,100); rect(5,250,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(5).x,bd2.get(5).y,40,45);
            else rect(bdb.get(5).x,bdb.get(5).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=280&&mouseY<=320&&arrayloaded==true){        //passo4
          noStroke(); fill(#CC0000,100); rect(5,300,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(4).x,bd2.get(4).y,40,45);
            else rect(bdb.get(4).x,bdb.get(4).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=330&&mouseY<=370&&arrayloaded==true){        //passo5
          noStroke(); fill(#CC0000,100); rect(5,350,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(3).x,bd2.get(3).y,40,45);
            else rect(bdb.get(3).x,bdb.get(3).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=380&&mouseY<=420&&arrayloaded==true){        //passo6
          noStroke(); fill(#CC0000,100); rect(5,400,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(2).x,bd2.get(2).y,40,45);
            else rect(bdb.get(2).x,bdb.get(2).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=430&&mouseY<=470&&arrayloaded==true){        //passo7
          noStroke(); fill(#CC0000,100); rect(5,450,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(1).x,bd2.get(1).y,40,45);
            else rect(bdb.get(1).x,bdb.get(1).y,40,45);
        }
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=480&&mouseY<=520&&arrayloaded==true){        //passo8
          noStroke(); fill(#CC0000,100); rect(5,500,width-50,40); fill(#CC0000);  rect(bd1.get(0).x,bd1.get(0).y,320,45);  
            if(mm.selection==1)  rect(bd2.get(0).x,bd2.get(0).y,40,45);
            else rect(bdb.get(0).x,bdb.get(0).y,40,45);
        }        
        else if(mouseX>=5&&mouseX<=width-5&&mouseY>=530&&mouseY<=570&&arrayloaded==true){        //risultato
          noStroke(); fill(#CC0000,100); rect(5,553,width-50,40); fill(#CC0000);  image(frecciasomma,width-70,150); image(croce,width-50,300);//rect(width-50,150,30,390); 
        }           
   
        else cursor(ARROW);       //default
     }
     else cursor(ARROW);
  }
  
 

boolean esit(ArrayList<binaryDigit> al1, ArrayList<binaryDigit> al2){     
  boolean res=true;
  for(int i=0;i<al1.size();i++){
    if(al1.get(i).c!=al2.get(i).c) res=false;
  } 
  return res;
}

  
