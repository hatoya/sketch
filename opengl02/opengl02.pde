import processing.opengl.*;

float startX, noiseX, startY, noiseY;

void setup(){
    size(800, 600, OPENGL);
    sphereDetail(20);
    background(0);
    noStroke();

    startX = random(10);
    startY = random(10);
}

void draw() {
    background(0);

    startX += 0.01;
    startY += 0.01;

    noiseX = startX;
    noiseY = startY;

    for(int y = 0; y <= height; y += 5) {
        noiseY += 0.1;
        noiseX = startX;
        for(int x = 0; x <= width; x += 5) {
            noiseX += 0.1;
            drawPoint(x, y, noise(noiseX, noiseY));
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    pushMatrix();
    translate(x, y, y);
    float sphereSize = noiseFactor * 35;
    float grey = noiseFactor * 255;
    float alph = noiseFactor * 255;
    fill(grey, alph);
    sphere(sphereSize);
    popMatrix();
}