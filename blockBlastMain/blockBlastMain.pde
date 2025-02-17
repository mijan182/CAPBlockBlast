ArrayList<Block> blocks; //stores blocks in a list

//Game Constants
final int SW = 550; //REMEMBER TO UPDATE SETUP>SIZE
final int SH = 850;
final int videoScale = 40;
final int COLS = 8;
final int ROWS = 10;
final int gOffsetX = (SW - COLS * videoScale) / 2; //Horizontal aspect
final int gOffsetY = (SH - ROWS * videoScale) / 2; //Vertical aspect

int score = 0;

boolean GAMEstart = false;
PFont TITLEfont;
PFont AUTHORfont;

//grid
int[][] GAMEgrid;


void setup() {

  //REMEMBER TO UPDATE THE CONSTANTS
  size(550,850); //canvas size
  
  
  AUTHORfont = loadFont("CenturyGothic-BoldItalic-48.vlw");
  TITLEfont = loadFont("Cubex-48.vlw");
  
  
  blocks = new ArrayList<Block>(); //new arraylist to hold blocks
  blocks.add(new Block(240, 650, 80, 40)); 
  blocks.add(new longBlock(420,650));
  blocks.add(new cubeBlock(100,650));
  blocks.add(new Block(-1000, 650, 80, 40));
  blocks.add(new longBlock(-1000,650));
  blocks.add(new cubeBlock(-1000,650));
  blocks.add(new lrgCubeBlock(-1000,650));
  blocks.add(new lrgCubeBlock(-1000,650));
  blocks.add(new longBlock(-1000,650));
  blocks.add(new cubeBlock(-1000,650));
  blocks.add(new lrgCubeBlock(-1000,650));
  blocks.add(new lrgCubeBlock(-1000,650));
  blocks.add(new Block(-1000, 650, 80, 40)); 
  blocks.add(new oneBlock(-1000,650));
  blocks.add(new oneBlock(-1000,650));
  blocks.add(new oneBlock(-1000,650));
  
  fill(100, 150, 255);
  noStroke();
  GAMEgrid = new int[ROWS][COLS];//initializes GAMEgrid to zeros

}

void draw() {
  background(23, 101, 159);
  
  if (GAMEstart){
    drawGrid();
    drawScore();
    updateBlocks();
    String instructions = "click 'q' to get more blocks!";
     text(instructions, 100,100);

     
    
  } else {
    showStartScreen();
  }
}
   
    
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

  int[] xPositions = {225, 405, 80};
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

void checkAndClearRows(){
  int clearedRows = 0;
  int clearedCols = 0;
  
    for(int r = 0;r < ROWS;r ++){
      boolean isRowFull = true;
      
      for(int c = 0; c <COLS ; c++){
        if (GAMEgrid[r][c]==0){
          isRowFull = false;
          break;
        }
      }
      
      if (isRowFull){
        clearRow(r);
        clearedRows++;
      }
    }
      for(int c = 0;c < COLS; c++){
    boolean isColsFull = true;
    
    for(int r =0; r<ROWS; r++){
        if (GAMEgrid[r][c]==0){
          isColsFull = false;
          break;
    }
  }
  if (isColsFull){
        clearCol(c);
        clearedCols++;
  }
}
  if (clearedRows > 0 && clearedCols > 0) {
    score += 20; // Bonus points
  }

}


void clearRow(int row){
  for(int c = 0; c<COLS;c++){
    GAMEgrid[row][c] = 0;
  }
  
  score += 10;
}

void clearCol(int col){
  for(int r = 0; r<ROWS;r++){
    GAMEgrid[r][col] = 0;
  }
  
  score += 10;
}

void drawScore(){
  fill(255);
  textSize(20);
  text("Score: " + score, 20,30);
}

void resetGame() {
  score = 0;
  GAMEgrid = new int[ROWS][COLS]; // Clear the grid
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
    stroke(60,146,229);
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
    
    int prevX = x;
    int prevY= y;
    
    if(gridX<0 || gridX >= COLS || gridY <0 || gridY >= ROWS){
    x = prevX;
    y = prevY;
    return; //make sure it doesnt do the out of bounds error when placed on non grid area
    }
    
    for (int i = 0; i < width/videoScale; i++){
      for (int j = 0; j < height/videoScale; j++){
      if (gridY + j >= ROWS || gridX + i >= COLS || GAMEgrid[gridY + j][gridX + i] != 0) {
          x = prevX;
          y= prevY;
          return;
        }
      }
    }
    
    System.out.println(gridX + " " + gridY);
        
    x = gridX * videoScale + gOffsetX;
    y = gridY * videoScale + gOffsetY;
    
    for (int i = 0; i < width / videoScale; i++) {
      for (int j = 0; j < height / videoScale; j++) {
        GAMEgrid[gridY + j][gridX + i] = 1;
      }
    }
    
    x = -1888; // removes blocks from the grid after placement
    y = -1999;
    
    checkAndClearRows();
  }
}

//class LBlock extends Block {
//  LBlock(int x, int y) {
//    super(x, y, 2 * videoScale, 2* videoScale); // Base width and height for an L-shaped block
//  }
  

//  void display() {
//    fill(255, 236, 64); // Y color
//    stroke(240,218,22);
//    rect(x, y, videoScale, videoScale);
//    // Draw horizontal part of "L"
//    rect(x + videoScale, y, videoScale, videoScale);
//    // The bottom part of "L"
//    rect(x + videoScale, y + videoScale, videoScale, videoScale);
//  }
 
//} dream left unsolved sigh

class cubeBlock extends Block {
  cubeBlock(int x, int y) {
    // Set to a 4x4 grid size
    super(x, y, 2 * videoScale, 2 * videoScale);
  }

  void display() {
    fill(255, 100, 100); // color
    stroke(200, 50, 50); // Stroke for outlines
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        rect(x + i * videoScale, y + j * videoScale, videoScale, videoScale);
      }
    }
  }
}

class lrgCubeBlock extends Block {
  lrgCubeBlock(int x, int y) {// Set to a 3x3 grid size
    super(x, y, 3 * videoScale, 3 * videoScale);
  }

  void display() {
    fill(255, 234, 75); 
    stroke(234, 215, 69); // Stroke for outlines
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        rect(x + i * videoScale, y + j * videoScale, videoScale, videoScale);
      }
    }
  }
}

class longBlock extends Block {
  longBlock(int x, int y) {
    // Set to a 1x4 size (1 wide and 4 tall)
    super(x, y, videoScale, 4 * videoScale);
  }

  void display() {
    fill(100, 255, 100); 
    stroke(50, 200, 50); 
    for (int i = 0; i < 4; i++) {
      rect(x, y + i * videoScale, videoScale, videoScale);
    }
  }
}

class oneBlock extends Block {
  oneBlock(int x, int y) { //1x1 block
    super(x, y, videoScale, 1 * videoScale);
  }

  void display() {
    fill(250, 160, 255); 
    stroke(233, 119, 240); 
    for (int i = 0; i < 1; i++) {
      rect(x, y + i * videoScale, videoScale, videoScale);
    }
  }
}
