import processing.pdf.*;

String[] filenames;
PImage[] img;
PGraphics pg;

// Image Array
int num;
int index = 0;
int modo = 1;

// Declare variable
int spacing = 20;
int velocity = 5;
int w, h, pos, posY, portion;

// Scale image
float scala = 0.285;

// Show Debung and Corner
boolean Corner, Recorder, Info;

void setup() {
  size(900, 747, P2D);
  smooth();
  
  Info = true;

  stroke(236, 38, 140);
  noFill();
  strokeCap(CORNER);
  strokeWeight(velocity);
  textFont(loadFont("assets/Monospaced-10.vlw"));

  // Count data
  String path = sketchPath("data");
  filenames = listFileNames(path);
  num = (filenames.length)-1;
  img = new PImage[num];
  printArray(filenames);

  // Load and scale the image (1500px x 1000px)
  for (int i = 0; i < img.length; i++) {
    img[i] = loadImage("0" + i + ".jpg");
  }

  w = round(img[index].width  * scala);
  h = round(img[index].height * scala);

  pg = createGraphics(img[index].width, img[index].height, P2D);

  // Speed and Position
  Corner  = true;
  posY    = 0;
  pos     = (spacing*2) + w;
}

void draw() {

  background(50);

  portion = velocity;

  //Change image
  index = constrain(index, 0, img.length);
  if (index == num) index = 0;
  image(img[index], spacing, spacing, w, h);

  // Condition
  boolean cond1 = mouseX > spacing;
  boolean cond2 = mouseX < spacing + w;
  boolean cond3 = mouseY > spacing;
  boolean cond4 = mouseY < spacing + h;

  // Adjust mouse Position
  int mouseYScale  = int(mouseY/scala) - int(spacing/scala);
  int mouseXScale  = int(mouseX/scala) - int(spacing/scala);

  // Pixel Selection
  strokeWeight(1);
  stroke(0, 255, 0);
  line(spacing, mouseY, spacing+w, mouseY);
  line(spacing, mouseY + portion * scala, spacing+w, mouseY + portion * scala);

  // Slit Scan Effect
  if (cond1 && cond2 && cond3 && cond4 && Recorder) {
    if      (modo == 1) pg.copy(img[index], 0, mouseYScale, img[index].width, portion, 0, posY, pg.width, portion);
    else if (modo == 2) pg.copy(img[index], mouseXScale, mouseYScale, img[index].width, portion, 0, posY, pg.width, portion);

    // Increment Y-Coordinate
    posY+=velocity;
    if (posY >= spacing + pg.height) posY = pg.height+1000; // Somewhere in the space
  }

  // Display PGraphics scaled
  image(pg, pos, spacing, w, h);

  // Show Debug function
  if (Corner)  corner();
  if (Recorder)recorder();
  if (Info)    info();
}

void keyPressed() {
  if (key == 'q')      posY = 0;
  if (key == 'c')      Corner= !Corner;
  if (key == 'r')      Recorder = !Recorder;
  if (key == 'i')      Info = !Info;
  if (keyCode == UP)   index = (index+1)%num;
  if (keyCode == DOWN) index = (index-1+num)%num;
  if (keyCode == LEFT) velocity-=5;
  if (keyCode == RIGHT)velocity+=5;
  if (key == 's')      savePDF();
  if (keyCode == 49)   modo = 1;
  if (keyCode == 50)   modo = 2;

  // Print Data  
  String out = "";
  out += "---------------------"  + "\n";
  out += "Index     : " + index   + "\n";
  out += "Portion   : " + portion + "\n";
  out += "Modo      : " + modo    + "\n";
  if (key == 'p')   println(out);
}
