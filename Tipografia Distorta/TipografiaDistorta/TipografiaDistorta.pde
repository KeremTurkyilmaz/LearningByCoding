import java.io.FilenameFilter;
File[] files;

PImage img;

int cols = 40;
int rows = 70;

float shiftX = 0;
float shiftY = 0;

int cw = (int)width  / cols;
int ch = (int)height / rows;

int num;
int index = 0;
int modo = 1;

int actRandomSeed = 0;

void setup() {
  size(640, 360, P2D);
  noCursor();
  File basePath = new File(sketchPath("data/"));
  files = basePath.listFiles(new FilenameFilter() {
    @Override  
      public boolean accept(File dir, String filename) {
      return !filename.startsWith(".");
    }
  }
  ); 

  num = files.length;
  img = loadImage(files[index].getAbsolutePath());
}

void draw() {

  background(0);
  randomSeed(actRandomSeed);

  translate(width/2, height/2);

  int cw = width  / cols;
  int ch = height / rows;

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int px = i*cw;
      int py = j*ch;
      
      if ( modo == 1 ) {
        shiftX = random(-mouseX, mouseX);
        shiftY = random(-mouseY, mouseY);
      } else if ( modo == 2 ) {
        shiftX = random(-mouseX, mouseX);
        shiftY = 0;
      } else if ( modo == 3 ) {
        shiftX = 0;
        shiftY = random(-mouseY, mouseY);
      }

      copy(img, px, py, cw, ch, px+(int)shiftX, py+(int)shiftY, cw, ch);
    }
  }
}

void mousePressed() {
  actRandomSeed = millis();
}

void keyPressed() {
  if (keyCode == UP) {
    index = (index + 1) % num;
    img = loadImage(files[index].getAbsolutePath());
  }
  if (keyCode == DOWN) {
    index = (index-1+num) % num;
    img = loadImage(files[index].getAbsolutePath());
  }

  if ( key == '1' ) modo = 1;
  if ( key == '2' ) modo = 2;
  if ( key == '3' ) modo = 3;
  
  if ( key == 'q' ){
    cols = floor(random(1, 14));
    rows = floor(random(1, 14));
  }
  
  
}
