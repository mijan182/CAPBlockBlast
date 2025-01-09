
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

class Lblock { //l blocks
}

class Tblock { //T block
}
