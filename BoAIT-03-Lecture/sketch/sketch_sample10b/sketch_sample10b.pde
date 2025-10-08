PImage earthImg;
PShape globe;

void setup() {
  size(1280, 720, P3D);
  smooth(8);
  earthImg = loadImage("earth.png");    // data/ に配置
  globe = createShape(SPHERE, 160);
  globe.setTexture(earthImg);
  globe.setStroke(false);
}

void draw() {
  background(10);
  translate(width/2, height/2, 0);

  shape(globe);
}

void keyPressed() {
  if (key == 'p') save("sample10b.png");
}
