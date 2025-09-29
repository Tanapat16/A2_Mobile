int[][] grid = new int[9][9]; 
int cell_size = 80;
int cell_num = 80;

void setup(){
    size(1200, 800);
    startingNumber();
}

void draw(){
    background(255);
    drawGrid();
    gridNumpad();
    drawNumpad();
    drawNumber();
    
    
}

void drawGrid(){
    int i = 0;
    while(i<=9){
        line(cell_size*i, 0, cell_size*i, cell_size*9);
        i += 1;
    }
    int j = 0;
    while(j<=9){
        line(0, cell_size*j, cell_size*9, cell_size*j);
        j += 1;
    }
}

void gridNumpad(){
    int i = 0;
    while(i<=3){
        line(900+cell_num*i, 200+0, 900+cell_num*i, 200+cell_num*4);
        i += 1;
    }
    int j = 0;
    while(j<=4){
        line(900+0, 200+cell_num*j, 900+cell_num*3, 200+cell_num*j);
        j += 1;
    }
}

void drawNumpad(){
    textAlign(CENTER,CENTER);
    textSize(30);
    fill(0);
    int numpadNum = 1;
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            text(numpadNum, (j*cell_num)+900+(cell_num/2), (i*cell_num)+(cell_num/2)+280);
            numpadNum++;
        }
    }
    text("<", 940+cell_num+cell_num, cell_num*3);
}

void startingNumber() {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      if (random(1) < 0.5) { 
        grid[row][col] = int(random(1, 10)); 
      } else {
        grid[row][col] = 0;
      }
    }
  }
}

void drawNumber() {
  textAlign(CENTER, CENTER);
  textSize(28);
  fill(0);
  for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
          if (grid[r][c] != 0) {
              text(grid[r][c], c*cell_size+cell_size/2, r*cell_size+cell_size/2);
          }
      }
  }
}
