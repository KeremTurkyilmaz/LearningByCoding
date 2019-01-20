void setup() {
  size(500, 500);
  rectMode(CENTER);
  generate();
  pixelDensity(displayDensity());
}

void draw() {
}

void keyPressed() {
  if (key == 's') salvaImmagine();
  else generate();
}

void salvaImmagine() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame(timestamp+".png");
}

void generate() {
  background(0);

  int cc = int(random(10, 60));
  float ss = width*1./cc;

  float det = random(0.02);
  int sub = int(random(8, 12));
  
  for (int j = 0; j < cc+1; j++) {
    for (int i = 0; i < cc+1; i++) {
      float x = (i+0.5)*ss;
      float y = (j+0.5)*ss;

      float ang = noise(x*det, y*det)*2*TWO_PI;
      float d = ss;
      float da = TWO_PI/sub;
      float dc = 255./sub*2;

      noStroke();
      fill(255);
      for (int k = 0; k < sub; k++) {
        float a1 = (k-0.5)*da+ang;
        float a2 = (k+0.5)*da+ang+0.05;
        float col = abs(k-sub/2)*dc;
        //fill(col);
        fill(col, 120, 200);
        arc(x, y, d, d, a1, a2);
      }
    }
  }
}
