import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

int cellSize = 10 ;

int cols, rows;
float cw, ch;

boolean showImage = false;

void setup() {

  size(640, 480, JAVA2D);
  noCursor();
  rectMode(CENTER);

  video  = new Capture(this, 640, 480);
  opencv = new OpenCV (this, 640, 480);
  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();

  cols = width/cellSize;
  rows = height/cellSize;

  cw = width / cols;
  ch = height/ rows;

}

void draw() {
  opencv.loadImage(video);
  Rectangle[] faces = opencv.detect();

  if (showImage) image(video, 0, 0);  
  else background(255);
  
  for (int c = 0; c < faces.length; c++) {

    float posX = faces[c].x + (faces[c].width /2);
    float posY = faces[c].y + (faces[c].height/2);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int px = floor(i * cw + cw/2);
        int py = floor(j * ch + ch/2);
        fill(0);
        noStroke();
        float dist = dist(px, py, posX, posY);
        float m = map(dist, width, 0, 1, 20);        
        rect(px, py, m*0.6, m*0.6);
      }
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

void mousePressed() {
  showImage = !showImage;
}
