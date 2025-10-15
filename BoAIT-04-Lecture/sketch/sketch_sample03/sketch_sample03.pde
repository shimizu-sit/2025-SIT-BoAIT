int pm;
float x = 200, vx = 200;

void setup() {
  size(854, 480);
  pm = millis();
}

void draw() {
  int now = millis();
  float dt = (now - pm) / 1000.0;
  pm = now;
  background(245);
  x += vx * dt;
  if (x < 15 || x > width - 15) {
    vx *= -1;
  }
  ellipse(x, height * 0.5, 30, 30);
}

void keyPressed() {
  if(key == 's') save("sample03.png");
}
