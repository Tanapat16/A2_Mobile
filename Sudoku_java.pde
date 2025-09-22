int cell_size = 80;

void setup(){
    size(720, 720);
}

void draw(){
    background(200);
    drawGrid();
    
}

void drawGrid(){
    int i = 0;
    while(i<=9){
        line(cell_size*i, 0, cell_size*i, height);
        i += 1;
    }
    int j = 0;
    while(j<=9){
        line(0, cell_size*j, width, cell_size*j);
        j += 1;
    }
}
