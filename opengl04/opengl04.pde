import processing.opengl.*;

float radius = 100;

void setup(){
    size(800, 600, OPENGL);
    stroke(0);
    background(255);
}

void draw() {
    background(255);

    translate(width / 2, height / 2, 0);
    rotateX(frameCount * 0.04);
    rotateY(frameCount * 0.03);

    float s = 0;
    float lastX = 0;
    float lastY = 0;
    float lastZ = 0;

    for(float x = 0; x <= 180; x++) {
        s += 18;
        float radianS = radians(s);
        float radianT = radians(x);

        float thisX = radius * cos(radianS) * sin(radianT);
        float thisY = radius * sin(radianS) * sin(radianT);
        float thisZ = radius * cos(radianT);

        if(lastX != 0) {
            line(thisX, thisY, thisZ, lastX, lastY, lastZ);
        }

        lastX = thisX;
        lastY = thisY;
        lastZ = thisZ;
    }
}