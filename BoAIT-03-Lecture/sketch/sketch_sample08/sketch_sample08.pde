float angX, angY;
float distZ = -400;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(12);

  ambientLight(32, 32, 32);
  directionalLight(220, 220, 220, -1, -1, -1);

  translate(width/2, height/2, 0);
  translate(0, 0, distZ);

  rotateX(angX);
  rotateY(angY);

  noStroke();
  fill(120, 140, 220);  // 拡散色
  specular(255);      // 鏡面色
  shininess(40);      // 鋭さ

  box(200);
  drawAxes(240);
}

void mouseDragged() {
  angX -= (mouseY - pmouseY) * 0.01;
  angY += (mouseX - pmouseX) * 0.01;
}

void keyPressed() {
  if (key == 'w') distZ += 20;
  if (key == 's') distZ -= 20;
  if (key == 'p') save("sample08.png");
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
