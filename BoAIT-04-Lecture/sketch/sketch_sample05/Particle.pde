class Particle {
  PVector pos, vel;
  float life;
  color col;
  float r;
  Particle(PVector origin) {
    pos = origin.copy();
    vel = PVector.random2D().mult(random(80, 240)); // px/秒
    life = 1.0;                   // 1.0→0.0 で減衰
    r = random(3, 8);
    col = color(random(180, 240), random(120, 180), 255);
  }
  void update(float dt) {
    // 重力＋減衰
    vel.y += 400*dt;
    pos.add(PVector.mult(vel, dt));
    life -= 0.8*dt;               // 約1.25秒で消える
  }
  void draw() {
    float a = constrain(life, 0, 1);
    noStroke();
    fill(col, 255*a);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  boolean dead() {
    return life<=0;
  }
}
