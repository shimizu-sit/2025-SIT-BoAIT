float angle = 0;
float distZ = -400;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(12);
  translate(width/2, height/2, 0);
  translate(0, 0, distZ);

  rotateX(angle);
  rotateY(angle * 0.8);

  box(200);
  angle += 0.01;
  //save("sample04.png");
}
