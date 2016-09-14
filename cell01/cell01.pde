Cell[][] cells;
int _cellSize = 10;
int _numX, _numY;

void setup(){
    size(800, 600);
    background(200);
    smooth();

    _numX = floor(width / _cellSize);
    _numY = floor(height / _cellSize);

    restart();
}

void draw() {
    background(200);

    for(int x = 0; x < _numX; x++) {
        for(int y = 0; y < _numY; y++) {
            cells[x][y].calcNextState();
        }
    }

    translate(_cellSize / 2, _cellSize / 2);

    for(int x = 0; x < _numX; x++) {
        for(int y = 0; y < _numY; y++) {
            cells[x][y].drawCells();
        }
    }
}

void restart() {
    cells = new Cell[_numX][_numY];
    for(int x = 0; x < _numX; x++) {
        for(int y = 0; y < _numY; y++) {
            cells[x][y] = new Cell(x, y);
        }
    }
}

void mousePressed() {
    restart();
}

class Cell {
    float x, y;
    boolean state;
    boolean nextState;
    Cell[] neighbours;

    Cell(float ex, float why) {
        x = ex * _cellSize;
        y = why * _cellSize;

        if(random(2) > 1) {
            nextState = true;
        } else {
            nextState = false;
        }

        state = nextState;
        neighbours = new Cell[0];
    }

    void addNeighbour(Cell cell) {
        neighbours = (Cell[])append(neighbours, cell);
    }

    void calcNextState() {

    }

    void drawCells() {
        state = nextState;
        stroke(0);
        if(state == true) {
            fill(0);
        } else {
            fill(255);
        }
        ellipse(x, y, _cellSize, _cellSize);
    }
}