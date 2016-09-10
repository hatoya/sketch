import processing.opengl.*;

void setup(){
    size(800, 600, OPENGL);
    sphereDetail(40);
    background(255);
}

void draw() {
    background(255);

    translate(width / 2, height / 2, 0);
    sphere(200);
}