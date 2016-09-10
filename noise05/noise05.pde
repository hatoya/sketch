float startX, noiseX, startY, noiseY;
float startNoiseX, startNoiseY;

void setup(){
    smooth();
    size(800, 600);
    background(255);
    frameRate(24);

    float startX = random(10);
    float noiseY = random(10);

    float startNoiseX = random(20);
    float startNoiseY = random(20);
}

void draw() {
    background(255);

    startNoiseX += 0.01;
    startNoiseY += 0.01;
    startX += (noise(startNoiseX) * 0.5) - 0.25;
    startY += (noise(startNoiseY) * 0.5) - 0.25;

    noiseX = startX;
    noiseY = startY;

    for(int y = -10; y <= height + 10; y += 5) {
        noiseY += 0.1;
        noiseX = startX;
        for(int x = -10; x <= width + 10; x += 5) {
            noiseX += 0.1;
            drawPoint(x, y, noise(noiseX, noiseY));
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    pushMatrix();
    translate(x, y);
    rotate(noiseFactor * radians(360));
    stroke(0, 150);
    line(0, 0, 20, 0);
    popMatrix();
}