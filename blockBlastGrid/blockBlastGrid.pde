grid g;

void setup() {
  size(500, 800);
  g = new grid (10,10);
}

void draw() {
  background(220);
  stroke(0);
  fill(209);
  g.displayGrid();
}

class grid {
  int ROWS, COLS;
  boolean[][] gridarray;


  //Constructor
  grid(int tempr, int tempc) {
  ROWS = tempr;
  COLS = tempc;
  gridarray = new boolean[ROWS][COLS];

  for (int y = 0; y < ROWS; y++) {
    for (int x = 0; x < COLS; x++) {
      }
    }
  }
  
  //Setting up the grid structure
  void displayGrid() {
  
    for (int y = 0; y < ROWS; y++) {
      for (int x = 0; x < COLS; x++) {
      }
      
      int cellWidth = width / COLS;
      int cellHeight = height / ROWS;
      
      //Starts drawing from top left corner of Rect
      rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
      }
      
    }
    
  
}
