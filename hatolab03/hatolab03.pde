import gifAnimation.*;

GifMaker gifExport;

Point[][] points = {};
int _space = 10;

int _gifFrame = 0;
boolean _gifFlag = false;

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
    float x, y, p;

    Point(float _x, float _y) {
        this.x = _x;
        this.y = _y;
        this.p = sin(radians(_x)) - sin(radians(_y));
    }

    void update() {
        this.p += 0.05;
    }

    void draw() {
        pushMatrix();
        if(this.x > 5 && this.y > 5) {
            translate(this.x, this.y);
            rotate(PI * this.p);
            noStroke();
            fill(255);
            ellipse(3, 0, 3 * abs(sin(PI * this.p)), 3 * abs(sin(PI * this.p)));
        }
        popMatrix();
    }
}