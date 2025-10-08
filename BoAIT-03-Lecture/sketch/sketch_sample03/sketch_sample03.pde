void setup() {
  size(1280, 720, P3D);
}

void draw() {
  translate(width/2, height/2, 0);
  box(200);
  save("sample03.png");
}
