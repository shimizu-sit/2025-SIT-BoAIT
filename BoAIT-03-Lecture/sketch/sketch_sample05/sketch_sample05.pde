float angX, angY;
float distZ = -400;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(12);
  translate(width/2, height/2, 0);
  translate(0, 0, distZ);

  rotateX(angX);
  rotateY(angY);

  box(200);
}

void mouseDragged() {
  angX -= (mouseY - pmouseY) * 0.01;
  angY += (mouseX - pmouseX) * 0.01;
}

void keyPressed() {
  if(key == 's') save("sample05.png");
}
