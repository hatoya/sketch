void setup(){
    size(600, 400, P3D);
    smooth();
}

void draw() {
    background(200);
    translate(width / 2, height / 2, 0);
    rotateX(frameCount * 0.01);
    rotateY(frameCount * 0.01);
    box(200, 200, 200);
}