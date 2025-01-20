
ArrayList<Block> blocks; //stores blocks in a list

//Game Constants
final int SW = 500; //REMEMBER TO UPDATE SETUP>SIZE
final int SH = 800;
final int videoScale = 40;
final int COLS = 8;
final int ROWS = 10;
final int gOffsetX = (SW - COLS * videoScale) / 2; //Horizontal aspect
final int gOffsetY = (SH - ROWS * videoScale) / 2; //Vertical aspect

boolean GAMEstart = false;
PFont TITLEfont;
PFont AUTHORfont;

//grid
int[][] GAMEgrid;


void setup() {

  //REMEMBER TO UPDATE THE CONSTANTS
  size(500,800); //canvas size
  
  
  AUTHORfont = loadFont("CenturyGothic-BoldItalic-48.vlw");
  TITLEfont = loadFont("Cubex-48.vlw");
  
  blocks = new ArrayList<Block>(); //new arraylist to hold blocks
  blocks.add(new Block(200, 650, 80, 40)); //2 by 1
  blocks.add(new Block(200, 650, 80, 40)); //2 by 1
  blocks.add(new LBlock(370,650));
  blocks.add(new LBlock(370,650));
  
  fill(100, 150, 255);
  noStroke();
  
  //COLS = 8;
  //ROWS = 10;
  
  GAMEgrid = new int[ROWS][COLS];//initializes GAMEgrid to zeros

}

void draw() {
  background(23, 101, 159);
  
  

  if (GAMEstart){
    drawGrid();
    updateBlocks();
    
  } else {
    showStartScreen();
  }
}
    
    //float Gcx = width / 2;
    //float Gcy = height / 2;
    
void drawGrid() {
    
    for (int r = 0; r < ROWS; r++) {
      for (int c = 0; c < COLS; c++) {
        int x = gOffsetX + c * videoScale;
        int y = gOffsetY + r * videoScale;
        
        fill(GAMEgrid[r][c] == 0 ? 50 : 200);
        stroke(23, 101, 159);
        rect(x, y, videoScale, videoScale);
      }
    }
}
      
    //color startColor = color (255, 165, 0);
    //color endColor = color (0, 0, 255);
    // for (int c = 0; c < COLS; c++) {
    //    //Loop for rows
    //    for (int r = 0; r < ROWS; r++) {
          
    //       //Drawing a rectangle at (x,y)
    //      int x = gOffsetX + c * videoScale;
    //      int y = gOffsetY + r * videoScale;
          
    //      //Distance from setup center
    //      float d = dist(x, y, Gcx, Gcy);
          
    //      float interAmount = map(d, 0, width / 2, 0, 1);
          
    //      color interColor = lerpColor(startColor, endColor, interAmount);
          
    //      stroke(interColor);
    //      point(x, y);
          
    //      fill(50, 150, 250); // Fill color for squares set to pink
    //      stroke(23, 101, 159); // Border color set to black
          
    //      //Every column and row, a rectangle will be drawn at (x,y)
    //      rect(x, y, videoScale, videoScale);
          
    //    }
    //  }
          
      
      
void updateBlocks() {
      for( Block block : blocks){ 
        block.display(); //calls block's display method
      }
    }

void showStartScreen() {
     textFont(TITLEfont);
     textSize(50);
     String gameName = "Block \n Blast!";
     text(gameName, 210, 300);
    
    
    textFont(AUTHORfont);
     textSize(15);
     String authorNames = "Brought to you by\n Faith & Jana\n\nPress enter to start!";
     text(authorNames, 300, 375);
     
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

void mouseReleased(){ {
  for (Block block : blocks) {
    if (block.isDragging)//loops thru all to stop dragging any block that was being dragged
    block.stopDragging(); //resets dragging state
   }
  }
}


void keyPressed(){
     if(keyCode == ENTER){
       GAMEstart = true;
     }
     
   if (key == 'q') {
    spawnBlock(); // Spawn a new block when 'q' is pressed
  }
  
}
void spawnBlock() {

  int[] xPositions = {200, 370, 45};

  shuffle(xPositions);

  boolean[] usedX = new boolean[3];
  
  for (Block block : blocks) {
    block.x = -1000;
  }

  for (int i = 0; i < 3; i++) {

    int randomBlockIndex = (int) random(blocks.size());
    Block randomBlock = blocks.get(randomBlockIndex);

    for (int j = 0; j < xPositions.length; j++) {
      if (!usedX[j]) {

        randomBlock.x = xPositions[j];
        randomBlock.y = 650; 
        usedX[j] = true; 
        break;
      }
    }
  }
}



void shuffle(int[] arr) {
  for (int i = arr.length - 1; i > 0; i--) {
    int j = (int) random(i + 1);
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

class Block { //different class for the block
  int x, y, width, height; //variables to store pos and size of block
  boolean isDragging = false; //flag to indicate if its being dragged
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
  
boolean isCollidingWith(Block other) {
  return !(x + width <= other.x ||  // This block is to the left of the other
           x >= other.x + other.width ||  // This block is to the right
           y + height <= other.y ||  // This block is above
           y >= other.y + other.height);  // This block is below
}

  void startDragging() { //starts dragging when clicked
    isDragging = true; //sets dragging to true
    offsetX = mouseX - x; // calcs horizontal offset between mouse n block
    offsetY = mouseY - y; // same ^^ but vert
  }

  void drag() {
    if (isDragging) { //updates block location/pos while dragging
      int prevX = x;
      int prevY = y;
      
      x = mouseX - offsetX; 
      y = mouseY - offsetY;
 
      for (Block other : blocks) {
      if (this != other && isCollidingWith(other)) {// If colliding, revert to the previous position
        x = prevX;
        y = prevY;
        break;
        }
      }
    }
  }

  void stopDragging() { //stops dragging when mouse released
    isDragging = false;
    
    int gridX = (int)(x - gOffsetX) / videoScale;
    int gridY = (int)(y - gOffsetY) / videoScale;
    //int gridY = round((float)(y - (height - ROWS * videoScale) / 2) / videoScale);
    
    System.out.println(gridX + " " + gridY);
    //gridX = constrain(gridX, 0, COLS -1);
    //gridY = constrain(gridY, 0, ROWS - 1);
    //System.out.println(gridX + " " + gridY);
        
    x = gridX * videoScale + gOffsetX;
    y = gridY * videoScale + gOffsetY;
    
    GAMEgrid[gridY][gridX] = 1;    

  }
  

  
  
}

class LBlock extends Block {
  LBlock(int x, int y) {
    super(x, y, 80, 80); // Base width and height for an L-shaped block
  }
  

  void display() {
    fill(255, 236, 64); // Y color
    stroke(240,218,22);
    rect(x, y, width/2, height/2); // Draw the vertical part of the L
    rect(x +width/2, y, width/2, height/2); //horizontal part of L
    rect(x + width/2, y+height/2,width/2,height/2);
  }
  

}


  
