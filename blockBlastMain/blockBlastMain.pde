int blockSize = 50;


void setup() {
  size(500,800);
}

void draw() {
  background(220);
  
  
  //draw
}

class blocks{
    void squareBlock(){
    square(50,50,50);
    fill(250);
  }
  
  void display(){
    
  }
  
  void move(){
  }
}

//int blockSize = 50; // Size of the block

//void setup() {
//  size(500, 800);
//}

//void draw() {
//  background(220);

//  // Draw the block at the mouse position
//  Block b = new Block(mouseX - blockSize / 2, mouseY - blockSize / 2, blockSize);
//  b.display();   // Display the block
//}

//class Block {
//  int x, y, size;

//  // Constructor to initialize the position and size
//  Block(int x, int y, int size) {
//    this.x = x;
//    this.y = y;
//    this.size = size;
//  }

//  // Display the block
//  void display() {
//    fill(255, 0, 0);  // Red color
//    rect(x, y, size, size); // Draw the block
//  }
//}
