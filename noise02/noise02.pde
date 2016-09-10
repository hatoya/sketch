void setup(){
    smooth();
    size(800, 600);
    background(255);
    strokeWeight(0.5);

    float radius = 100;
    int centerX = width / 2;
    int centerY = height / 2;

    stroke(20, 50, 70);
    for(int i = 0; i < 100; i++) {
        float x, y;
        float lastX = -999;
        float lastY = -999;
        float radiusNoise = random(10);
        radius = 10;
        for(float ang = 0; ang <= 1440; ang += 1) {
            radiusNoise += 0.01;
            radius += 0.1;
            float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
            float rad = radians(ang);
            x = centerX + (thisRadius * cos(rad));
            y = centerY + (thisRadius * sin(rad));
            if(lastX > -999) {
                line(x, y, lastX, lastY);
            }
            lastX = x;
            lastY = y;
        }
    }
}