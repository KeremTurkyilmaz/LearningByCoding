Lettera[][] letters;

int cols, rows, cella;
int index = 0;

char[] alpha = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
int charNum = 0;

void setup() {
  size(600, 400);

  cella = 20;
  cols = width/cella;
  rows = height/cella;

  letters = new Lettera[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int px = i * cella;
      int py = j * cella;
      letters[i][j] = new Lettera(px, py, cella);
    }
  }
}

void draw() {

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      letters[i][j].display();
      letters[i][j].changeFont();
    }
  }
}

class Lettera {

  String[] fontList = PFont.list();
  PFont f;
  int x, y, c;
  int index = 0;
  int font;
  float angle;

  Lettera(int px, int py, int cella) {
    x = px;
    y = py;
    c = cella;
    f = createFont(fontList[floor(random(fontList.length))], cella);
    textFont(f);
    textAlign(CENTER, CENTER);
  }

  void changeFont() {
    int mousePosition = floor(dist(x, y, mouseX, mouseY));
    font = (int)map(mousePosition, 0, 1000, 1, 1200);
    if (frameCount/2 % font/50 == 0) {
      index = (index + 1) % fontList.length;
      f = createFont(fontList[index], cella);
    }
  }

  void display() {
    textFont(f);
    pushMatrix();
    translate(x+cella/2, y+cella/2);
    text(alpha[charNum], 0, 0);
    popMatrix();
  }
}

void mousePressed() {
  charNum = (charNum + 1) % alpha.length;
}

void keyPressed(){
  if ( key == 's' ) save("DistanzaFont.jpg");
}
