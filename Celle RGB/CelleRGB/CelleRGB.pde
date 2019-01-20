cell[][] grid;
int numLine = 5;
int rows, cols;

int num = 50;

boolean Generate;

void setup() {

  //fullScreen();
  size(500, 500);

  background(0);
  noStroke();
  smooth();

  cols = floor(width /num);
  rows = floor(height  /num);


  grid = new cell[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new cell(i*num, j*num, num, num);
    }
  }
}

void draw() {

  if (frameCount % 10 == 0) {
    if (Generate) generate();
  }
  if (keyPressed) {
    if (key == 'b') background(0);
  }
}


void generate() {

  int r = floor(random(30, 200));
  if ((frameCount % r == 0)) {
    fill(0, 200);
    rect(-1, -1, width+1, height+1);
  }

  for (int i = 0; i < 10; i++) {
    grid[(int)random(cols)][(int)random(rows)].display();
  }
} 


class cell {

  float x, y, w, h;

  cell(float xpos, float ypos, float wdth, float hght) {
    x = xpos;
    y = ypos;
    w = wdth;
    h = hght;
  }

  void display() {

    int r = round(random(1, 3)); 
    strokeWeight(1);

    for (int i = 0; i < w+1; i+=numLine) {
      if ( r == 1) {
        stroke(255, 0, 0);
        line(x, y+i, x+w, y+i);
      } else if ( r == 2) {
        stroke(0, 255, 0);
        line(x+i, y, x+i, y+h);
      } else {
        stroke(0, 0, 255);
        line(x+i, y, x+i, y+h);
      }
    }
  }
} 

void keyPressed() {
  if (key == ' ') Generate = !Generate;

  if (key == 's') { 
    String f = "out/" + System.currentTimeMillis() + ".png";
    print("Salvo file: " + f + "... ");
    save(f);
    println("ok!");
  }
}
