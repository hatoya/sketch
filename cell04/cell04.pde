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

    for(int x = 0; x < _numX; x++) {
        for(int y = 0; y < _numY; y++) {
            int above = y - 1;
            int below = y + 1;
            int left = x - 1;
            int right = x + 1;

            if(above < 0) above = _numY - 1;
            if(below == _numY) below = 0;
            if(left < 0) left = _numX - 1;
            if(right == _numX) right = 0;

            cells[x][y].addNeighbour(cells[left][above]);
            cells[x][y].addNeighbour(cells[left][y]);
            cells[x][y].addNeighbour(cells[left][below]);
            cells[x][y].addNeighbour(cells[x][below]);
            cells[x][y].addNeighbour(cells[right][below]);
            cells[x][y].addNeighbour(cells[right][y]);
            cells[x][y].addNeighbour(cells[right][above]);
            cells[x][y].addNeighbour(cells[x][above]);
        }
    }
}

void mousePressed() {
    restart();
}

class Cell {
    float x, y;
    float state;
    float nextState;
    float lastState = 0;
    Cell[] neighbours;

    Cell(float ex, float why) {
        x = ex * _cellSize;
        y = why * _cellSize;
        nextState = ((x / 500) + (y / 300)) * 14;
        state = nextState;

        neighbours = new Cell[0];
    }

    void addNeighbour(Cell cell) {
        neighbours = (Cell[])append(neighbours, cell);
    }

    void calcNextState() {
        float total = 0;
        for(int i = 0; i < neighbours.length; i++) {
            total += neighbours[i].state;
        }
        float average = int(total / 8);

        if(average == 255) {
            nextState = 0;
        } else if(average == 0) {
            nextState = 255;
        } else {
            nextState = state + average;
            if(lastState > 0) nextState -= lastState;
            if(nextState > 255) {
                nextState = 255;
            } else if(nextState < 0) {
                nextState = 0;
            }
        }

        lastState = state;
    }

    void drawCells() {
        state = nextState;
        stroke(0);
        fill(state);
        ellipse(x, y, _cellSize, _cellSize);
    }
}