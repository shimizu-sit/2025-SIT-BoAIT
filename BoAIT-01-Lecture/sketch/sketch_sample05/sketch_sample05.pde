float t;
void setup(){
  size(854, 480);
}

void draw(){
  background(250);
  noStroke();
  t += 0.01;
  for(int i=0; i<300; i++){
    float x = random(width);
    float y = noise(t + i*0.01) * height;
    fill(0, 80);
    ellipse(x, y, 10, 10);
  }
}
