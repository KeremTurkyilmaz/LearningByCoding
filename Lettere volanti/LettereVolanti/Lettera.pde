class Lettera {
  char letter;
  PVector home, pos, delta;
  int modo = 1;

  Lettera(PVector pos, char letter) {
    this.home = pos.get();
    this.pos =  pos.get();
    this.letter = letter;
    setDeltas();
  }

  void setDeltas() {
    int l = -3;
    int h = 4;
    delta = new PVector(random(l, h), random(l, h), random(-0.1, 0.1));
  }

  void display() {
    fill(255);
    noStroke();
    textAlign(LEFT, CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(pos.z);
    text(letter, 0, 0);
    popMatrix();
  }

  void goHome() {
    pos = home.get();
  }

  void shift() {
    if (modo == 1) {
      if ((pos.x > width-10)||(pos.x < 10)) {
        delta.x *= -1;
      }
      if ((pos.y > height-10)||(pos.y < 10)) {
        delta.y *= -1;
      }
      pos.add(delta);
    } else if (modo == 2) {

      if (pos.x > width)  pos.x = 0;
      if (pos.x < 0)      pos.x = width;
      if (pos.y > height) pos.y = 0;
      if (pos.y < 0)      pos.y = height;
      pos.add(delta);
    }
  }
}
