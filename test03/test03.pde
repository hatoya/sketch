BoxClass[] boxObject = new BoxClass[10];

void setup(){
    size(600, 400, P3D);
    smooth();

    for( int i = 0; i < boxObject.length; i++) {
        boxObject[i] = new BoxClass(width / 4, height / 4);
    }
}

void draw() {
    background(200);

    for( int i = 0; i < boxObject.length; i++) {
        boxObject[i].update();
        boxObject[i].display();
    }
}

class BoxClass {
    float posX, posY;

    BoxClass(float x, float y) {
        posX = x;
        posY = y;
    }

    void update() {
        translate(posX, posY, 0);
        rotateX(frameCount * 0.01);
        rotateY(frameCount * 0.01);
    }

    void display() {
        box(200, 200, 200);
    }
}