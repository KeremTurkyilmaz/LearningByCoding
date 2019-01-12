import processing.pdf.*;

PGraphics tail;
int num = 1;

boolean record;

boolean modo1 = false;
boolean modo2 = false;
boolean modo3 = false;
boolean modo4 = false;

boolean showGrid = true;

float sw = 1;

void setup() {
  size(800, 800);
  tail = createGraphics(width, height, JAVA2D);
}

void draw() {

  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }

  background(#1F1F1F); 
  render(tail);
  image(tail, 0, 0);

  if (record) {
    endRecord();
    record = false;
  }

  if (showGrid) {
    int w = width / num;
    int h = height/ num;
    for (int i = 0; i < num; i++) {
      for (int j = 0; j < num; j++) {
        int x = i * w;
        int y = j * h;
        stroke(255, 50);
        strokeWeight(2);
        if (modo1) line(x + w / 2, y, x + w / 2, y + h);
        if (modo2) line(x, y + h / 2, x + w, y + h / 2);
        if (modo3) line(x, y, x + w, y + h);
        if (modo4) line(x + w, y, x, y + h);
        stroke(255, 50);
        strokeWeight(1);
        noFill();
        rect(i*w, j*h, w-1, h-1);
      }
    }
  }
}

void render( PGraphics g) {
  g.beginDraw();
  if (mousePressed && mouseButton == LEFT) {
    int w = width / num;
    int h = height/ num;
    int x = mouseX % w;
    int y = mouseY % h;
    int px = x - (mouseX - pmouseX);
    int py = y - (mouseY - pmouseY);
    for (int i = 0; i < num; i++) {
      for (int j = 0; j < num; j++) {
        int ox = i * w;
        int oy = j * h;
        g.stroke(255);
        g.strokeWeight(sw);
        // Normal position
        g.line(x + ox, y + oy, px + ox, py + oy);
        // Horizontal mirror or all three other mirrors
        if (modo2 || modo4 && modo3 && modo1)g.line(x + ox, h - y + oy, px + ox, h - py + oy);
        // Vertical mirror
        if (modo1 || modo4 && modo3 && modo2)g.line(w - x + ox, y + oy, w - px + ox, py + oy);
        // Horizontal and vertical mirror
        if (modo1 && modo2 || modo4 && modo3) g.line(w - x + ox, h - y + oy, w - px + ox, h - py + oy);
        // When mirroring diagonally, flip X and Y inputs.
        if (modo3 || modo4 && modo1 && modo2) g.line(y + ox, x + oy, py + ox, px + oy);
        if (modo3 && modo2 || modo4 && modo1) g.line(y + ox, w - x + oy, py + ox, w - px + oy);
        if (modo3 && modo1 || modo4 && modo2) g.line(h - y + ox, x + oy, h - py + ox, px + oy);
        if (modo3 && modo1 && modo2 || modo4) g.line(h - y + ox, w - x + oy, h - py + ox, w - px + oy);
      }
    }
  }
  g.endDraw();
}


void keyPressed() {
  if (key == 'q') tail.clear();
  if (key == 'w') showGrid = !showGrid;
  if (key == '1') modo1 = !modo1;
  if (key == '2') modo2 = !modo2;
  if (key == '3') modo3 = !modo3;
  if (key == '4') modo4 = !modo4;
  if (key == '5') num = 1;
  if (key == '6') num = 10;

  if (keyCode == RIGHT) sw += .5;
  if (keyCode == LEFT)  sw -= .5;
  if ( key == 's') {
    record = true;
  }
}
