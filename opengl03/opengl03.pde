float startX, startY, startZ;
float noiseX, noiseY, noiseZ;

int sideLength = 200;
int spacing = 5;

void setup(){
    size(800, 600, P3D);
    sphereDetail(20);
    background(0);
    noStroke();

    startX = random(10);
    startY = random(10);
    startZ = random(10);
}

void draw() {
    background(0);

    startX += 0.01;
    startY += 0.01;
    startZ += 0.01;

    noiseX = startX;
    noiseY = startY;
    noiseZ = startZ;

    translate(width / 2, height / 2, -150);
    rotateY(frameCount * 0.1);
    rotateZ(frameCount * 0.1);

    for(int z = 0; z <= sideLength; z += spacing) {
        noiseY = startY;
        noiseZ += 0.1;
        for(int y = 0; y <= sideLength; y += spacing) {
            noiseX = startX;
            noiseY += 0.1;
            for(int x = 0; x <= sideLength; x += spacing) {
                noiseX += 0.1;
                drawPoint(x, y, z, noise(noiseX, noiseY, noiseZ));
            }
        }
    }
}

void drawPoint(float x, float y, float z, float noiseFactor) {
    pushMatrix();
    translate(x, y, z);
    float grey = noiseFactor * 255;
    fill(grey, 100);
    box(spacing, spacing, spacing);
    popMatrix();
}