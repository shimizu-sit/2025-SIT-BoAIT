void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
  textSize(40);
}

void draw() {
 background(250);
 stroke(220);
 for(int x = 0; x<width; x +=40) line(x, 0, x, height);
 for(int y=0; y<height; y+=40) line(0, y, width, y);
 fill(30);
 text(mouseX+","+mouseY, 10, 50);
}
