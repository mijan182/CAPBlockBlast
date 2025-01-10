
ArrayList<Block> blocks; //stores blocks in a list


void setup() {
  size(500,800); //canvas size
  blocks = new ArrayList<Block>(); //new arraylist to hold blocks
  blocks.add(new Block(100, 100, 100, 50)); //2 by 1
  blocks.add(new Block (100,100,100,100)); //2 by2
  blocks.add(new Block (50, 50, 50,50)); //simple square 1 by 1
  blocks.add(new Block (200, 200,200,50)); // long block hori
  blocks.add(new Block (200, 200,50,200)); //long block vert

}

void draw() {
  background(220);
  
  for( Block block : blocks){ 
    block.display(); //calls block's display method
  }
  
  
}

void mousePressed(){
  for (Block block : blocks) { // loops thru all blocks to check if mouse is over any of them
    if (block.isMouseOver()) { //if mouse is over block...
      block.startDragging();//...starts dragging that block
      break; //stops checking other blocks after finding one
    }
  }
}

void mouseDragged(){
  for (Block block : blocks) { //loops thru all blocks to update their pos when dragged
    if (block.isDragging) { //checks if its in dragging state
      block.drag(); //updates pos 
    }
  }
}

void mouseReleased(){
  for (Block block : blocks) { //loops thru all to stop dragging any block that was being dragged
    block.stopDragging(); //resets dragging state
  }
}







class Block { //different class for the block
  int x, y, width, height; //variables to store pos and size of block
  boolean isDragging = false; //flag to indicate if its being dragged
  boolean isColliding = true; //collision flag
  int offsetX, offsetY; //offset between the mouse pointer and block's top left corner during draggign

  Block(int x, int y, int width, int height) { 
    //constructor to initialize the block's position and dimesnions
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  

  void display() { //renders blocks
    fill(100, 150, 200); //block color (for now)
    rect(x, y, width, height); //draws rectangle
  }

  boolean isMouseOver() { //checks if the mouse is over a block to select
    return mouseX >= x && mouseX <= x + width && 
           mouseY >= y && mouseY <= y + height;
  }
  
  //boolean isColliding(){
  // return  
  //}
  
  //void collision(){
  //  if (isColliding){
  //    fill(255);
  //  }
  //}

  void startDragging() { //starts dragging when clicked
    isDragging = true; //sets dragging to true
    offsetX = mouseX - x; // calcs horizontal offset between mouse n block
    offsetY = mouseY - y; // same ^^ but vert
  }

  void drag() {
    if (isDragging) { //updates block location/pos while dragging
      x = mouseX - offsetX; 
      y = mouseY - offsetY;
    }
  }

  void stopDragging() { //stops dragging when mouse released
    isDragging = false;
    
  }
  
}

class otherBlocks { //l blocks
  PShape  s, s2, s3;
  
  void Lshape(){
  s = createShape(); //first L shape
  s.beginShape();
  s.fill(0, 0, 255);
  s.noStroke();
  s.vertex(0, 0);
  s.vertex(0, 50);
  s.vertex(50, 50);
  s.vertex(50, 0);
  
  s.vertex(50, 50);
  s.vertex(50, 100);
  s.vertex(100, 100);
  s.vertex(100, 0);
  s.endShape(CLOSE);
  
    s2 = createShape(); //second L shape
    s2.beginShape();
    s2.fill(100,0,200);
    s2.noStroke();
    s2.vertex(0, 0);
    s2.vertex(50, 0);
    s2.vertex(50, 50);
    s2.vertex(0, 50);
    
    s2.vertex(50, 50);
    s2.vertex(100,50);
    s2.vertex(100, 100);
    s2.vertex(0,100);
    s2.endShape(CLOSE);
  
      s3 =createShape(); //third L shape
      s3.beginShape();
      s3.fill(100,0,200);
      s3.noStroke();
      s3.vertex(0, 0);
      s3.vertex(50, 0);
      s3.vertex(50, 50);
      s3.vertex(0, 50);
      
      s3.vertex(50, 50);
      s3.vertex(100,50);
      s3.vertex(100, 100);
      s3.vertex(0,100);
      s3.endShape(CLOSE);
  
}


  }
  
  //void Ldisplay(){
  //  shape(s,50,50);
  //  shape(s2, 200,500);
  //  shape(s3, 200,300);
  //}
