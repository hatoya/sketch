float startX, noiseX, noiseY;

void setup(){
    smooth();
    size(800, 600);
    noStroke();
    fill(255);
    background(0);

    float startX = random(10);
    float noiseX = startX;
    float noiseY = random(10);

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
    float len = 5 * noiseFactor;
    ellipse(x, y, len, len);
}