Point[][] points = {};
int _space = 30;

void setup(){
    size(600, 450, OPENGL);
    background(0);
    smooth();
    frameRate(50);
    camera(0, 30, 0, width / 2, height / 2, 250, 0, 0, 1);

    for(int x = 0; x * _space <= width; x++) {
        Point[] tmpPoints = {};
        for(int y = 0; y * _space <= height; y++) {
            Point point = new Point(x, y);
            tmpPoints = (Point[])append(tmpPoints, point);
        }
        points = (Point[][])append(points, tmpPoints);
    }
}

void draw() {
    background(0);

    for(int x = 0; x * _space <= width; x++) {
        for(int y = 0; y * _space <= height; y++) {
            points[x][y].update();
        }
    }
    for(int x = 0; x * _space <= width; x++) {
        for(int y = 0; y * _space <= height; y++) {
            points[x][y].draw();
        }
    }
}

class Point {
    int x, y;
    float z;

    Point(int _x, int _y) {
        this.x = _x;
        this.y = _y;
        this.update();
    }

    void update() {
        this.z = noise(float(this.x) / 10 + 0.1, float(this.y) / 10 + 0.1, float(frameCount) / 200);
    }

    void draw() {
        pushMatrix();
        translate(this.x * _space, this.y * _space, this.z * 150);

        stroke(255);
        strokeWeight(1);
        if(this.x * _space < width) {
            line(0, 0, 0, this.getPosX(this.x + 1, this.y), 0, this.getPosZ(this.x + 1, this.y));
        }
        if(this.y * _space < height) {
            line(0, 0, 0, 0, this.getPosY(this.x, this.y + 1), getPosZ(this.x, this.y + 1));
        }
        if(this.x * _space < width && this.y * _space < height && (this.x + this.y) % 2 == 0) {
            line(0, 0, 0, getPosX(this.x + 1, this.y + 1), this.getPosY(this.x + 1, this.y + 1), this.getPosZ(this.x + 1, this.y + 1));
            if(this.y > 0) {
                line(0, 0, 0, this.getPosX(this.x + 1, this.y - 1), this.getPosY(this.x + 1, this.y - 1), this.getPosZ(this.x + 1, this.y - 1));
            }
        }

        popMatrix();
    }

    float getPosX(int _x, int _y) {
        return points[_x][_y].x * _space - this.x * _space;
    }

    float getPosY(int _x, int _y) {
        return points[_x][_y].y * _space - this.y * _space;
    }

    float getPosZ(int _x, int _y) {
        return points[_x][_y].z * 150 - this.z * 150;
    }
}