import peasy.*;
import processing.video.*;

PeasyCam cam;
Capture video;

float angle = 0;
int index = 0;

PImage[] img = new PImage [8];          // The source image
int cellSize = 10;   // Dimensions of each cell in the grid
int cols, rows;      // Number of columns and rows
int modo = 1;
boolean rotation, scale;

void setup() {
  size(800, 800, P3D);

  for (int i = 0; i < img.length; i++) {
    img[i] = loadImage("image0" + i + ".jpg");
  }

  cam = new PeasyCam(this, 850);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(3000);

  cellSize = constrain(cellSize, 1, 100);

  video = new Capture(this, 640, 640);
  video.start();
  rectMode(CENTER);

  //ortho();
}

void draw() {

  background(0);

  if (rotation) {
    //rotateX(angle + 0.24);
    rotateY(angle + 0.21);
    rotateZ(angle + 0.26);
  }



  if (video.available()) {
    video.read();
    video.loadPixels();

    cols = round(img[index].width  / cellSize);
    rows = round(img[index].height / cellSize);

    img[index].loadPixels();

    translate(-img[index].width/2, -img[index].height/2);

    //Begin loop for cols and rows
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {

        int x = i * cellSize;
        int y = j * cellSize;

        int loc = x + y * img[index].width;
        int loc1= x + y * video.width;

        color b = video.pixels[loc1];
        color c = img[index].pixels[loc];

        float sz = (brightness(b) / 255.0) * cellSize;

        int off = 0;
        float z = (mouseX/(float)width) * 2 * brightness(img[index].pixels[loc])-off;
        if (scale) z = (map(cos(frameCount * 0.0183), -1, 1, 0, 2)) * brightness(img[index].pixels[loc])-off;
        pushMatrix();
        translate(x, y, z);
        noStroke();
        fill(c, 200);
        box(cellSize-sz,cellSize-sz, sz*10);
        popMatrix();
      }
    }

    img[index].updatePixels();
    angle += 0.01;
  }
}

void keyPressed() {
  if (key == 'q') cam.reset();
  if (key == 'w') rotation =! rotation;
  if (key == 'e') scale =! scale;
  if (keyCode == UP) index = (index + 1) % img.length;
  if (keyCode == DOWN) {
    if (index != 0) {
      index = (index - 1);
    }
  }
}
