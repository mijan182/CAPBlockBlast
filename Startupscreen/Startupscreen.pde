boolean GAMEstart = false;
PFont TITLEfont;
PFont AUTHORfont;

void setup(){
  size(500,800);
  
  AUTHORfont = loadFont("CenturyGothic-BoldItalic-48.vlw");
  TITLEfont = loadFont("Cubex-48.vlw");
}

void draw(){
  background(23, 101, 159);
   stroke(51,58,100);
   strokeWeight(100);
   
   if (GAMEstart){
     text("gameplay here",50,50);
   }else{
     textFont(TITLEfont);
   textSize(50);
   String gameName = "Block \n Blast!";
   text(gameName, 210, 300);
   
   
   
   textFont(AUTHORfont);
   textSize(15);
   String authorNames = "Brought to you by\n Faith & Jana\n\nPress enter to start!";
   text(authorNames, 300, 375);
   
   }

}

   
   void keyPressed(){
     if(keyCode == ENTER){
       GAMEstart = true;
   }
   }
