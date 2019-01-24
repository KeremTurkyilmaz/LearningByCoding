import peasy.*;
import processing.video.*;

// Variable for capture device
Movie video;
PeasyCam cam;

// Size of each cell in the grid
int cellSize = 15;
int cols, rows;
int modo = 2;
float size = 10;
float amount = 10;
float view = cellSize;
int shape = 1;

boolean debug = false;
boolean rotation;
boolean strokes;
float damp = random(0.05, 0.15);

void setup() {

  //size(900, 600, P3D);  
  fullScreen(P3D);
  
  noCursor();

  pixelDensity(displayDensity());

  colorMode(RGB, 255, 255, 255, 100);

  cam = new PeasyCam(this, 900);

  video = new Movie(this, "AS.mp4");
  video.loop();  

  cols = 854 / cellSize;
  rows = 480 / cellSize;
  cam.setMaximumDistance(2000);
  cam.setMinimumDistance(20);
}


void draw() { 

  pushMatrix();

  //rotate(PI/2);
  translate(-video.width/2, -video.height/2);

  video.read();
  video.loadPixels();

  if (modo == 1) {
    background(0);
    stroke(255);
  } else if (modo == 2) {
    background(255);
    stroke(0);
  } 

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      // Where are we, pixel-wise?
      int x = i * cellSize;
      int y = j * cellSize;

      int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

      // Each rect is colored white with a size determined by brightness
      color c = video.pixels[loc];

      size = (brightness(c) / 255.0) * view;

      pushMatrix();

      translate(x, y, 0);

      if (debug) {
        stroke(255, 100);
        strokeWeight(1);
        noFill();
        rect(0, 0, cellSize, cellSize);
      } 

      float si = map(size, 0, cellSize, 0.3, 6);
      float s = (si*8)*damp;

      noFill();
      strokeWeight(si);

      if (strokes) {
        stroke(c);
        fill(c);
      }
      if (shape == 1) {
        line(s, s, cellSize-s, cellSize-s);
        line(cellSize-s, s, s, cellSize-s);
      } else if (shape == 2) {
        noFill();
        line(0, 0, cellSize, cellSize);
        line(cellSize, 0, 0, cellSize);
      } else if (shape == 3) {
        line(cellSize/2, 2, cellSize/2, cellSize-2);
        line(2, cellSize/2, cellSize-2, cellSize/2);
      } else if (shape == 4) {
        line(cellSize/2, 0, cellSize/2, cellSize);
        line(0, cellSize/2, cellSize, cellSize/2);
      }

      popMatrix();
    }
  }

  popMatrix();
}

void keyPressed() {
  if (key == '1') modo = 1;
  if (key == '2') modo = 2;

  if (keyCode == RIGHT) {
    shape++;
    if (shape > 4) shape = 1;
  }

  if (keyCode == LEFT) {
    shape--;
    if (shape < 1) shape = 4;
  }

  println("Shape Number: " + shape);

  if (key == 's') strokes = !strokes;

  if (key == 'w') saveFrame("line-######.tif");

  if (key == 'd') debug = !debug;
  if (key == '4') cam.setDistance(1371);
  if (key == '5') cam.setDistance(900);
  if (key == '6') cam.setDistance(792);
  if (key == '7') cam.setDistance(253);
  if (key == '0') cam.reset();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
