import com.sun.tools.jdi.JDWP.ArrayReference.Length;
grid g;

void setup() {
  size(1300, 400);
  g = new grid (10,10);
}

void draw() {
  background(100);
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
      gridarray[y][x] = false;
      }
    }
  }
  
  //Setting up the grid structure
  void displayGrid() {
  
    for (int y = 0; y < ROWS; y++) {
      for (int x = 0; x < COLS; x++) {
      }
      
      int cellLength = length / COLS;
      int cellHeight = height / ROWS;
      
      
    }
    
  }
  
  
}
