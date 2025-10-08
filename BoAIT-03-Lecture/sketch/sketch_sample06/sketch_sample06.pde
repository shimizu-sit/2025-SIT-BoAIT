float angX, angY;
//float distZ = -400;
float distZ = 0;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(12);
  translate(width/2, height/2, 0);
  translate(0, 0, distZ);

  rotateX(angX);
  rotateY(angY);

  drawAxes(240);
  noStroke();
  fill(80, 160, 255);
  box(200);
}

void mouseDragged() {
  angX -= (mouseY - pmouseY) * 0.01;
  angY += (mouseX - pmouseX) * 0.01;
}

void keyPressed() {
  if (key == 's') save("sample06.png");
}

void drawAxes(float s) {
  strokeWeight(6);
  stroke(255, 60, 60);
  line(0, 0, 0, s, 0, 0);   // +X（赤）
  stroke(60, 255, 60);
  line(0, 0, 0, 0, s, 0);   // +Y（緑）
  stroke(60, 120, 255);
  line(0, 0, 0, 0, 0, s);   // +Z（青）
}
