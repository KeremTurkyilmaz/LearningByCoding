PImage img;
PGraphics in;

int celle = 20;
int actRandomSeed = 0;

int mode = 1;

void setup() {
  size(800, 600);
  img = loadImage("psycho.jpg");
  in = createGraphics(img.width, img.height, JAVA2D);
}

void draw() {

  background(0);

  randomSeed(actRandomSeed);

  int ch = height / celle;

  in.beginDraw();
  in.background(img);
  in.rectMode(CENTER);
  for (int i = 0; i < celle; i++) {
    int py = i*ch;
    in.fill(255);

    float shiftX = 0;
    float shiftY = 0;
    
    if ( mode == 1 ) {
      shiftX = random(-mouseX, mouseX);
      shiftY = random(-mouseY, mouseY);
    } else {
      shiftX = random(mouseX, -mouseX);
      shiftY = random(mouseY, -mouseY);
    }
    //in.rect(in.width/2+shiftX, py+ch/2, in.width, ch);
    copy(img, 0, py, width, ch, (int)shiftX, py, in.width,ch);
  }
  in.endDraw();
  //image(in, 0, 0);
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}

void keyPressed() {
  if ( key == '1') mode = 1;
  if ( key == '2') mode = 2;
  
  if ( keyCode == UP ) celle++;
  if ( keyCode == DOWN)celle--;



}
