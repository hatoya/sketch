float startX, noiseX, noiseY;

void setup(){
    smooth();
    size(800, 600);
    background(255);

    float startX = random(10);
    float noiseX = startX;
    float noiseY = random(10);

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