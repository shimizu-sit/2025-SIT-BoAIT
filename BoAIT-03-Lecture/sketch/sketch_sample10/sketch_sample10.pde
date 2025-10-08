PImage earthImg;
PShape globe;
float ry;
float angX, angY;
float distZ = -400;

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
  translate(0, 0, distZ);
  rotateX(angX);
  rotateY(angY);

  ambientLight(24, 24, 24);
  directionalLight(255, 255, 255, -0.6, -0.5, -0.6);

  pushMatrix();
  rotateY(ry);
  ry += 0.01;  // 自転（物体側）
  shape(globe);
  popMatrix();
}

void mouseDragged() {
  angX -= (mouseY - pmouseY) * 0.01;
  angY += (mouseX - pmouseX) * 0.01;
}

void keyPressed() {
  if (key == 'w') distZ += 20;
  if (key == 's') distZ -= 20;
  if (key == 'p') save("sample10.png");
}
