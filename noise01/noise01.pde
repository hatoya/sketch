void setup(){
    smooth();
    size(800, 600, P3D);
    background(255);
    strokeWeight(5);

    stroke(0, 30);
    line(0, height / 2, width, height / 2);

    stroke(20, 50, 70);
    int step = 10;
    float lastX = -999;
    float lastY = -999;
    float ynoise = random(10);
    float y;

    for(int x = 0; x <= width; x += step) {
        y = height / 2 - 40 + noise(ynoise) * 80;
        if(lastX > -999) {
            line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;
        ynoise += 0.1;
    }
}