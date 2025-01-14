boolean startButOver = false;
int Butx;
int Buty;
int butSize = 80;
color butColor;
color butHighlight;
color currButColor;

void setup(){
  size(500,800);
  butColor = color(20,100,150);
  butHighlight = color(20,100,155);
  Butx = width/2- butSize -10;
  Buty = height/2- butSize -10;
  ellipseMode(CENTER);
}

void draw(){
  background(23, 101, 159);
   noStroke();
   String gameName = "Block Blast!";
   text(gameName, 210, 300);
   textSize(50);
   
   if(startButOver){
     fill(butHighlight);
   }
}

boolean startButOver(int bx, int by, int width, int height){
  if(mouseX >= bx && mouseX <= bx+width &&
    mouseY >= by && mouseY <= by+height){
      return true;
    }else{
      return false;
    }
}
