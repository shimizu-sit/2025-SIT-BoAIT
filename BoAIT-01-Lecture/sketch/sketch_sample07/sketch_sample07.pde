void setup(){
  size(854, 480);
}

void draw(){
  background(245);
  translate(width/2, height/2); // 
  for(int i=0;i<12;i++){
    pushMatrix();
    rotate(TWO_PI*i/12.0 + frameCount*0.01);
    fill(20,120,220,160);
    noStroke();
    rect(200, 0, 120, 16, 8); // 花弁風
    popMatrix();
  }
}
