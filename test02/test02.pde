BoxClass boxObject1, boxObject2, boxObject3, boxObject4;

void setup(){
    size(600, 400, P3D);
    smooth();

    boxObject1 = new BoxClass(width / 4, height / 4);
    boxObject2 = new BoxClass(width / 6, height / 6);
    boxObject3 = new BoxClass(width / 8, height / 8);
    boxObject4 = new BoxClass(width / 10, height / 10);
}

void draw() {
    background(200);

    boxObject1.update();
    boxObject1.display();

    boxObject2.update();
    boxObject2.display();

    boxObject3.update();
    boxObject3.display();

    boxObject4.update();
    boxObject4.display();
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