float x=200, y=200, vx=3, vy=2;

void setup() {
  size(854,480);
}

void draw() {
  background(245);
  x += vx;
  y += vy;
  
  if(x < 15 || x > width - 15) {
    vx *= -1;
  }
  if(y < 15 || y > height - 15) {
    vy *= -1;
  }
  
  noStroke();
  fill(40,120,220);
  ellipse(x, y, 30, 30);
}

void keyPressed() {
  if(key == 's') save("samele01.png");
}
