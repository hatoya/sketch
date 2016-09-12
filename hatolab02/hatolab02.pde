void setup(){
    smooth();
    size(800, 600);
    noStroke();
    background(0);

    for(int y = 0; y <= height; y += 5) {
        for(int x = 0; x <= width; x += 5) {
            drawPoint(x, y, abs(sin(float(x) / width * PI * 3) - cos(float(y) / height * PI)) * 5);
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    pushMatrix();
    translate(x, y);
    fill(noiseFactor * 255);
    ellipse(0, 0, 2, 2);
    popMatrix();
}