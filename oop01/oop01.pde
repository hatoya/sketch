int _num = 10;
Circle[] circle = {};

void setup(){
    size(800, 600, OPENGL);
    strokeWeight(1);
    fill(150, 50);
    background(255);
    smooth();

    drawCircles();
}

void draw() {
    for(int i = 0; i < _num; i++) {
        Circle thisCircle = circle[i];
        thisCircle.updateCircles();
    }
}

void mouseReleased() {
    drawCircles();
}

void drawCircles() {
    for(int i = 0; i < _num; i++) {
        Circle thisCircle = new Circle();
        thisCircle.drawCircles();
        circle = (Circle[])append(circle, thisCircle);
    }
}

class Circle {
    float x, y;
    float radius;
    color linecol, filcol;
    float alph;
    float moveX, moveY;

    Circle() {
        x = random(width);
        y = random(height);
        radius = random(100) + 10;
        linecol = color(random(255), random(255), random(255));
        filcol = color(random(255), random(255), random(255));
        alph = random(255);
        moveX = random(10) - 5;
        moveY = random(10) - 5;
    }

    void drawCircles() {
        noStroke();
        fill(filcol, alph);
        ellipse(x, y, radius * 2, radius * 2);
        stroke(linecol, 150);
        noFill();
        ellipse(x, y, 10, 10);
    }

    void updateCircles() {
        x += moveX;
        y += moveY;
        if(x > (width + radius)) x = -radius;
        if(x < -radius) x = width + radius;
        if(y > (height + radius)) y = -radius;
        if(y < -radius) y = height + radius;

        boolean touching = false;

        for(int i = 0; i < _num; i++) {
            Circle otherCircle = circle[i];
            if(otherCircle != this) {
                float dis = dist(x, y, otherCircle.x, otherCircle.y);
                if((dis - radius - otherCircle.radius) < 0) {
                    touching = true;
                    break;
                }
            }
        }
        if(touching) {
            if(alph > 0) alph--;
        } else {
            if(alph < 255) alph += 2;
        }

        this.drawCircles();
    }
}