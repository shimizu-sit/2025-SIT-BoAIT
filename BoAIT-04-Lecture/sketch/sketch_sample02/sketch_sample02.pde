int pm;
float x=80, y=240, vx=120, vy=0, ax=0, ay=400; // ay=重力

void setup() {
  size(854, 480);
  pm = millis();
}

void draw() {
  float dt = (millis()-pm)/1000.0;
  pm = millis();
  // 速度・位置
  vx += ax*dt;
  vy += ay*dt;    // px/s, px/s^2
  x  += vx*dt;
  y  += vy*dt;    // px
  
  // 床反発
  float r=12;
  
  if (y>height-r) {
    y=height-r;
    vy = -abs(vy)*0.7;
  }
  background(245);
  noStroke();
  fill(40, 120, 220);
  ellipse(x, y, r*2, r*2);
}

void keyPressed() {
  if(key == 's') save("samele01.png");
}
