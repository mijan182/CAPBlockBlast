//Size of each square in the grid, to the ratio of window to video size
//Width and Height of 8 pixels
int videoScale = 40;

//Represents the number of columns and rows in the grid
int COLS, ROWS;
  
void setup() {
  size(500, 800); // Window size

//Columns and Rows
COLS = 8;
ROWS = 10;

}
  
void draw() {
   background(255); // Background set to white
   
   int offsetX = (width - COLS * videoScale) / 2; //Horizontal aspect
   int offsetY = (height - ROWS * videoScale) / 2; //Vertical aspect

  //Loop for columns
  for (int c = 0; c < COLS; c++) {
    //Loop for rows
    for (int r = 0; r < ROWS; r++) {
      
      //Drawing a rectangle at (x,y)
      int x = offsetX + c * videoScale;
      int y = offsetY + r * videoScale;
      fill(255, 200, 200); // Fill color for squares set to pink
      stroke(0); // Border color set to black
      
      //Every column and row, a rectangle will be drawn at (x,y)
      rect(x, y, videoScale, videoScale);
      }
    }
  }
 
