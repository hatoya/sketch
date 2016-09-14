int _numChildren = 4;
int _maxLevels = 5;

Branch trunk;

void setup(){
    size(800, 600);
    background(255);
    noFill();
    smooth();

    newTree();
}

void draw() {
    background(255);

    trunk.updateBranchs(width / 2, height / 2);
    trunk.drawBranchs();
}

void newTree() {
    trunk = new Branch(1, 0, width / 2, height / 2);
    trunk.drawBranchs();
}

class Branch {
    float level, index;
    float x, y;
    float endX, endY;
    float strokeW, alph;
    float len, lenChange;
    float rot, rotChange;

    Branch[] children = new Branch[0];

    Branch(float lev, float ind, float ex, float why) {
        level = lev;
        index = ind;
        strokeW = 2;
        alph = 255 / level;
        len = random(200) / level;
        rot = random(360);
        lenChange = random(10) - 5;
        rotChange = random(10) - 5;

        this.updateBranchs(ex, why);

        if(level < _maxLevels) {
            children = new Branch[_numChildren];
            for(int x = 0; x < _numChildren; x++) {
                children[x] = new Branch(level + 1, x, endX, endY);
            }
        }
    }

    void updateBranchs(float ex, float why) {
        x = ex;
        y = why;

        rot += rotChange;
        if(rot > 360) {
            rot = 0;
        } else if(rot < 0) {
            rot = 360;
        }

        len -= lenChange;
        if(len < 0) {
            lenChange *= -1;
        } else if(len > 200) {
            lenChange *= -1;
        }

        float radian = radians(rot);
        endX = x + (len * cos(radian));
        endY = y + (len * sin(radian));

        for(int i = 0; i < children.length; i++) {
            children[i].updateBranchs(endX, endY);
        }
    }

    void drawBranchs() {
        strokeWeight(strokeW);
        stroke(0, 70);
        line(x, y, endX, endY);
        ellipse(endX, endY, len / 24, len / 24);
        for(int i = 0; i < children.length; i++) {
            children[i].drawBranchs();
        }
    }
}