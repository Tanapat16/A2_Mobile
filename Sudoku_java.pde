int[][] grid = new int[9][9]; 
int cell_size = 80;
int cell_num = 80;
int selectedRow = -1;
int selectedCol = -1;

void setup(){
    size(1200, 800);
    loadGrid("dataNum.txt");
}

void draw(){
    background(255);
    drawGrid();
    gridNumpad();
    drawNumpad();
    drawNumber();
    drawSelection();
    
    
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

void gridNumpad() {
    int i = 0;
    while(i <= 3) {
        line(900 + cell_num * i, 200, 900 + cell_num * i, 200 + cell_num * 4);
        i++;
    }
  
    int j = 0;
    while(j <= 4) {
        line(900, 200 + cell_num * j, 900 + cell_num * 3, 200 + cell_num * j);
        j++;
    }
}

void drawNumpad() {
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
  
    int numpadNum = 1;
    int i = 0;
    while(i < 3) {
        int j = 0;
        while(j < 3) {
            text(numpadNum, (j * cell_num) + 900 + (cell_num / 2), (i * cell_num) + (cell_num / 2) + 280);
            numpadNum++;
            j++;
        }
        i++;
    }
  
    text("<", 940 + cell_num + cell_num, cell_num * 3);
}

void loadGrid(String filename){
    String[] lines = loadStrings(filename);
    
    int i = 0;
    while(i < 9){
        String[] num = split(lines[i], ' ');
        int j = 0;
        while(j < 9){
            grid[i][j] = int(num[j]);
            j++;
        }
        i++;
    }
}

void drawNumber(){
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    
    int i = 0;
    while(i < 9){
        int j = 0;
        while(j < 9){
            if(grid[i][j] != 0){
                text(grid[i][j], j*cell_size+cell_size/2, i*cell_size+cell_size/2);
            }
            j++;
        }
        i++;
    }
}

void drawSelection() {
    if(selectedRow != -1 && selectedCol != -1){
        noFill();
        stroke(255, 0, 0); 
        strokeWeight(3);
        rect(selectedCol*cell_size, selectedRow*cell_size, cell_size, cell_size);
        strokeWeight(1); 
        stroke(0);
    }
}

void mousePressed() {

    if(mouseX >= 0 && mouseX < cell_size*9 && mouseY >= 0 && mouseY < cell_size*9){
        selectedCol = mouseX / cell_size;
        selectedRow = mouseY / cell_size;
        println("Selected: row=" + selectedRow + ", col=" + selectedCol);
        return; 
    }
    int nx = mouseX - 900;
    int ny = mouseY - 300;

    if(nx >= 0 && nx < cell_num*3 && ny >= 0 && ny < cell_num*3 && selectedRow != -1 && selectedCol != -1){
        int colNum = nx / cell_num; 
        int rowNum = ny / cell_num; 
        int num = rowNum*3 + colNum + 1; 
    
        if(isValid(selectedRow, selectedCol, num)){
            grid[selectedRow][selectedCol] = num;
            println("Inserted: " + num + " at row=" + selectedRow + ", col=" + selectedCol);
        } 
        else {
            println("Cannot insert " + num + " at row=" + selectedRow + ", col=" + selectedCol + " (duplicate!)");
           }
    }

    int backX = 940 + cell_num + cell_num;
    int backY = cell_num*3;
    if(mouseX >= backX - 40 && mouseX <= backX + 40 && mouseY >= backY - 40 && mouseY <= backY + 40 && selectedRow != -1 && selectedCol != -1){
        grid[selectedRow][selectedCol] = 0;
        println("Deleted at row=" + selectedRow + ", col=" + selectedCol);
    }

    
}

boolean isValid(int row, int col, int num){
    int i,j;
  
    i = 0;
    while(i < 9){
        if(grid[row][i] == num) return false;
        i++;
    }
  
    i = 0;
    while(i < 9){
        if(grid[i][col] == num) return false;
        i++;
    }
  
    int startRow = (row/3)*3;
    int startCol = (col/3)*3;
    i = 0;
    while(i < 3){
        j = 0;
        while(j < 3){
            if(grid[startRow+i][startCol+j] == num) return false;
            j++;
        }
        i++;
    }
    return true;
}
