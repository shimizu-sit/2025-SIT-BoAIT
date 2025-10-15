PVector pos, vel, acc, gravity;
int pm;

void setup() {
  size(854,480);
  pm =millis();
  pos = new PVector(0, 80);
  vel = new PVector(40, 0);
  acc = new PVector();
  gravity = new PVector(0, 800);
}

void draw() {
  float dt = (millis() - pm)/1000.0;
  pm = millis();
  background(250);
  acc.add(PVector.mult(gravity, dt));
  vel.add(PVector.mult(acc, dt));
  pos.add(PVector.mult(vel, dt));
  acc.mult(0);
  
  float r=15;
  if(pos.y > height - r) {
    pos.y = height - r;
    vel.y = -abs(vel.y) * 0.7;
  }
  noStroke();
  fill(20, 120, 220);
  
  ellipse(pos.x, pos.y, r*2, r*2);
}

void keyPressed() {
  if(key == 's') save("sample04.png");
}
