import peasy.*;
import java.io.FilenameFilter;

File[] files;
PeasyCam cam;
Blob[] blobs = new Blob[7];


float rotation = 0;
PImage img;          // The source image
int cellSize = 15;   // Dimensions of each cell in the grid
int cols, rows;      // Number of columns and rows
int modo = 1;
float angle = 0;
int index = 0;
int num;

PGraphics p;

boolean rot;
boolean recording = false;

void setup() {

  //size(800, 800, P3D);
  fullScreen(P3D);

  File basePath = new File(sketchPath("data"));
  files = basePath.listFiles(new FilenameFilter() {
    @Override  
      public boolean accept(File dir, String filename) {
      return !filename.startsWith(".");
    }
  }
  );  

  num = files.length;
  img = loadImage(  files[index].getAbsolutePath() );


  cellSize = constrain(cellSize, 1, 100);
  p = createGraphics(img.width, img.height, JAVA2D);


  pixelDensity(displayDensity());

  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(p.width), random(p.height));
  }
  rectMode(CENTER);

  cam = new PeasyCam(this, 1200);
}

void draw() {

  background(0);
  noTint();

  p.beginDraw();
  p.loadPixels();

  for (int y = 0; y < p.height; y++) {
    for ( int x = 0; x < p.width; x++) {  
      int index = x  + y * p.width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 60 * b.r / d;
      }
      if (sum > 1) {
        p.pixels[index] = color(sum);
      } else {
        p.pixels[index] = color(0);
      }
    }
  }

  p.updatePixels();

  for (Blob b : blobs) {
    b.update();
  }

  p.updatePixels();
  p.endDraw();

  cols = round(img.width  / cellSize);
  rows = round(img.height / cellSize);

  img.loadPixels();

  if (rot) {
    rotateX(rotation);
    rotateY(rotation);
  }

  translate(-img.width/2, -img.height/2);
  //image(p, 0, 0);

  //Begin loop for cols and rows
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      int x = i * cellSize;
      int y = j * cellSize;

      int loc = x + y * p.width;
      int loc1 = x + y * img.width;

      color c = p.pixels[loc];
      color b = img.pixels[loc1];

      float sz = (brightness(c) / 255.0) * cellSize*2;

      float z = (mouseX/(float)width) * 2 * brightness(img.pixels[loc]);

      pushMatrix();
      translate(x, y, 0);
      fill(b);
      //fill(z);
      stroke(0);
      box(cellSize, cellSize, cellSize*sz);
      //box(sz*0.4);
      popMatrix();
    }
  }
  img.updatePixels();
  rotation+= 0.01;
}


void keyPressed() {
  if (key == 'q') cam.reset();
  if (key == 'w') rot = !rot;

  if (keyCode == UP) {
    index = (index+1)%num;
    img = loadImage(  files[index].getAbsolutePath() );
  }

  if (keyCode == DOWN) {
    index = (index-1+num)%num;
    img = loadImage(  files[index].getAbsolutePath() );
  }
}
