Point[][] points = {};
int _space = 5;

void setup(){
    size(600, 450);
    background(0);
    smooth();
    frameRate(50);

    for(int x = 0; x * _space < width; x++) {
        Point[] tmpPoints = {};
        for(int y = 0; y * _space < height; y++) {
            Point point = new Point(x * _space, y * _space);
            tmpPoints = (Point[])append(tmpPoints, point);
        }
        points = (Point[][])append(points, tmpPoints);
    }
}

void draw() {
    background(0);

    for(int x = 0; x * _space < width; x++) {
        for(int y = 0; y * _space < height; y++) {
            points[x][y].update();
            points[x][y].draw();
        }
    }
}

class Point {
    float x, y, z;

    Point(float _x, float _y) {
        this.x = _x;
        this.y = _y;
        this.z = noise(x / 100, y / 100, float(frameCount) / 100);
    }

    void update() {
        this.z = noise(x / 100, y / 100, float(frameCount) / 100);
    }

    void draw() {
        pushMatrix();
        if(this.x > 5 && this.y > 5) {
            translate(this.x, this.y);
            rotate(this.z * PI * 2);
            noStroke();
            fill(255);
            ellipse(10, 0, 3 * this.z, 3 * this.z);
        }
        popMatrix();
    }
}