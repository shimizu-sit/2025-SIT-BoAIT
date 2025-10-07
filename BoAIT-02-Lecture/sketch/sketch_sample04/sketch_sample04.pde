void setup(){
  size(854,480);
}

void draw(){
  background(250);
  noStroke();
  for(int i=0;i<40;i++){
    float x = map(i, 0, 39, 60, width-60);
    float s = 8 + i*2;
    fill(40+5*i, 120, 220, 140);
    ellipse(x, height*0.5 + sin(frameCount*0.02+i*0.2)*40, s, s);
  }
}
