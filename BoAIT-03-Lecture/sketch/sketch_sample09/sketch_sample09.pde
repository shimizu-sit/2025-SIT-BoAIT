float angX, angY;
float distZ = -400;
float t;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(12);
  
  ambientLight(32, 32, 32);
  t+= 0.02;
  float lx = 300 * cos(t);
  float lz = 300 * sin(t);
  pointLight(255, 255, 255, lx, 120, lz);
   
  translate(width/2, height/2, 0);
  translate(0, 0, distZ);

  rotateX(angX);
  rotateY(angY);

  noStroke();
  fill(120, 140, 220);
  specular(255);
  shininess(40);

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
  if (key == 'p') save("sample09.png");
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
