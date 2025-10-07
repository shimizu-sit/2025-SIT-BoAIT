void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
}

void draw() {
  background(245);
  fill(0, 120, 255, 160); // RGBA
  ellipse(mouseX, mouseY, 120, 120);
}
