ArrayList<Particle> ps = new ArrayList<>();
PVector emitter;
int pm;

void setup() {
  size(854, 480);
  emitter = new PVector(width/2, height-60);
  pm = millis();
}

void draw() {
  float dt = (millis()-pm)/1000.0;
  pm = millis();
  background(12);
  // 毎フレーム数個ずつ放出
  for (int i=0; i<8; i++) ps.add(new Particle(emitter));
  // 更新＆描画（後ろから消す）
  for (int i=ps.size()-1; i>=0; i--) {
    Particle p = ps.get(i);
    p.update(dt);
    p.draw();
    if (p.dead()) ps.remove(i);
  }
  // エミッタの目印
  stroke(80);
  noFill();
  ellipse(emitter.x, emitter.y, 16, 16);
}

void mouseMoved() {
  emitter.set(mouseX, mouseY);
}

void keyPressed() {
  if(key == 's') save("sample05.png");
}
