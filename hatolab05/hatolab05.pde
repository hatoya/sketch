import gifAnimation.*;

GifMaker gifExport;

Point[][] points = {};
int _space = 30;

int _gifFrame = 0;
boolean _gifFlag = false;

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