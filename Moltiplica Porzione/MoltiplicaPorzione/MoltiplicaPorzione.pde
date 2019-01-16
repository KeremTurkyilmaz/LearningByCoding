PImage img;
int area = 100;
int num =10;

void setup() {
  size(500, 500);
  img = loadImage("Harder.jpg");  
  imageMode(CENTER);
  background(img);
  //rectMode(CENTER);
}

void draw() {

  //background(img);

  if (mousePressed) {
    int passo = area;
    for (int i = 0; i < num; i++) {
      int px = mouseX - area / 2;
      int py = mouseY - area / 2;
      int p = (1 + i) * passo;
      int total = num * area;
      copy(img, px, py, area, area, px - ((total/2)) + p, py, area, area);
      copy(img, px, py, area, area, px, py - ((total/2)) + p, area, area);
    }
  }


}

void keyPressed() {
  if (key == 'w') background(img);
}
