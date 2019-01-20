class Cella {

  int cx, cy;
  int size;
  color c1, c2;
  boolean back;

  Cella(int x, int y, int s, color c1_, color c2_ ) {
    cx = x;
    cy = y;
    size = s;
    c1 = c1_;
    c2 = c2_;
    background(w);
  }

  // Torna al centro quando tocca i bordi
  void edges() {
    if (cx >= width || cx <= 0 || cy <= 0 || cy >= height) {
      size = size/2;
      if (size == 10) size = 40;
      cx = width /2-size;
      cy = height/2-size;
    }
  }

  void move() {
    float r = random(1);
    if (r <= 0.5) {
      if (r <= 0.25) cx += size;
      else cx -= size;
    } else { 
      if (r <= 0.75)cy += size;
      else cy -= size;
    }
  }

  void modeColor(PGraphics g) {
    g.strokeWeight(1);
    if (colorMode == 1) {
      g.fill(w);
      g.stroke(b);
    } else if (colorMode == 2) {
      float dist = dist(cx, cy, width/2, height/2);
      g.stroke(b*dist);
      g.fill(dist*0.2, dist*0.6, dist*0.5);
    }
  }

  void clearB() {
    back = true;
  }

  void backgroundClear(PGraphics g) {
    g.noStroke();
    g.fill(w);
    g.rect(0, 0, width, height); 
    back = false;
  }

  void display(PGraphics g) {    
    if (back) backgroundClear(g);
    
    fill(0, 20);
    rect(0, 0, width, height);
    
    if (modo == 1) {
      //g.fill(255, 20);
      //g.noStroke();
      //g.noStroke();
      g.rect(width-cx-size, cy, size, size);
      g.rect(cx, cy, size, size);
    } else if (modo == 2) {
      //g.fill(100,100,255, 20);
      //g.noStroke();
      g.rect(width-cx-size, cy, size, size);
      g.rect(cx, height-cy, size, size);
    } else if (modo == 3) {
      g.fill(255, 50);
      g.noStroke();
      g.rect(cx+size/2, cy+size/2, size, size);
      //g.ellipse(cx+size/2, cy+size/2, size, size);
    }
  }
}

// Void edges random position
//cx = floor(random(width/cellSize)) * cellSize;
//cy = floor(random(height/cellSize)) * cellSize;
