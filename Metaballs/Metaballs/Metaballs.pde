Blob[] blobs = new Blob[10];

PFont font;
boolean show;

void setup() {
  size(900, 600);
  colorMode(HSB);
  font = loadFont("HelveticaLT-Bold-20.vlw");
  textFont(font);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw() {

  background(51);
  loadPixels();

  for (int y = 0; y < height; y++) {
    for ( int x = 0; x < width; x++) {  
      int index = x  + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 55 * b.r / d;
      }
      pixels[index] = color(sum, 255, 255); 
    }
  }

  updatePixels();

  for (Blob b : blobs) {
    b.update();
    if(show) b.show();
  }

}

void mousePressed(){
  show = !show;
}
