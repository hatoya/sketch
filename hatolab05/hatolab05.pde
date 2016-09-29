import gifAnimation.*;

GifMaker gifExport;

Point[][] points = {};
int _space = 50;

int _gifFrame = 0;
boolean _gifFlag = false;

void setup(){
    size(600, 450);
    background(0);
    smooth();
    frameRate(50);

    for(int x = 0; x * _space <= width; x++) {
        Point[] tmpPoints = {};
        for(int y = 0; y * _space <= height; y++) {
            Point point = new Point(x * _space, y * _space);
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
            points[x][y].draw(x, y);
        }
    }

    if(_gifFlag) {
        if(frameCount <= _gifFrame + 50 * 3){
            gifExport.addFrame();
        } else {
            gifExport.finish();
            _gifFlag = false;
        }
    }
}

void keyPressed() {
    if(key == 's') {
        gifExport = new GifMaker(this, "../../gif/" + split(sketchPath(), '/')[split(sketchPath(), '/').length - 1] + '/' + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + ".gif");
        gifExport.setRepeat(0);
        gifExport.setDelay(20);

        _gifFrame = frameCount;
        _gifFlag = true;
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

    void draw(int _x, int _y) {
        pushMatrix();
        translate(this.x, this.y);

        noStroke();
        fill(255);
        ellipse(0, 0, 3, 3);

        stroke(255);
        strokeWeight(1);
        line(0, 0, _space, 0);
        line(0, 0, 0, _space);
        if((_x + _y) % 2 == 0) line(0, 0, _space, _space);
        if((_x + _y) % 2 == 0) line(0, 0, _space, -_space);

        popMatrix();
    }
}