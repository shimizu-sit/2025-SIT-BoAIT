void setup(){
  size(854, 480);
  background(255);
}

void draw(){}

void keyPressed(){
  if(key=='s') saveFrame("shot-####.png");
  if(key=='c') background(255); // クリア
}
void mouseDragged(){
  stroke(0,40); strokeWeight(12);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
