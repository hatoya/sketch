void setup(){
    smooth();
    size(800, 600, P3D);
    background(150);

    float xstart = random(10);
    float ynoise = random(10);
    translate(width / 2, height / 2, 0);
    for(float y = -(height / 8); y <= (height / 8); y+= 3) {
        ynoise += 0.03;
        float xnoise = xstart;
        for(float x = -(width / 8); x <= (width / 8); x += 3) {
            xnoise += 0.03;
            drawPoint(x, y, noise(xnoise, ynoise));
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    pushMatrix();
    translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
    float edgeSize = noiseFactor * 26;

    stroke(0, 50);
    fill(255, 200);
    ellipse(0, 0, edgeSize, edgeSize);
    popMatrix();
}