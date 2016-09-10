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
        for(int x = 0; x <= width; x += 5) {
            drawPoint(x, y, sin(float(x) / width * PI * 2) - cos(float(y) / height * PI));
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    float len = 2 * noiseFactor + 0.5;
    ellipse(x, y, len, len);
}