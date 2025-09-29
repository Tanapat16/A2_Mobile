int cell_size = 80;
int cell_num = 80;

void setup(){
    size(1200, 800);
}

void draw(){
    background(200);
    drawGrid();
    gridNumpad();
    
    
    
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
