class Box {

  int lato;
  int off;
  PVector pos;
  PVector rot;
  int weight;
  boolean wireframe = true;
  boolean debug;
  color c;

  Box(int o, color c_) {
    c = c_;
    off = o;
    lato = 40;
    pos = new PVector(width/2, height/2+off*4, 200);
    rot = new PVector(0, 0, 0);
  }

  void update() {
    // Position vector
    if (keys[UP])        pos.z += 10;
    else if (keys[DOWN]) pos.z -= 10;

    if (mousePressed) {
      rot.x += ((height/2 - mouseY)  * 0.01 - rot.x) * 0.1 ;
      rot.y += ((width /2  - mouseX) * 0.01 - rot.y) * 0.1;
    } else {
      rot.x = (millis() * 0.000949);
      rot.y = (millis() * 0.000949);
      rot.z = (millis() * 0.000949);
    }
  }

  void style() { 
    wireframe = !wireframe;
  }
  void debug() { 
    debug = !debug;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.y);



    if (wireframe) {
      strokeWeight(2);
      noFill();
      stroke(c);
    } else {
      stroke(0);
      strokeWeight(1);
      fill(c);
    }

    box(lato*3, lato, lato);
    box(lato, lato*3, lato);
    box(lato, lato, lato*3);

    if (debug) {
      pushMatrix();
      strokeWeight(3);
      float deg = 90.0;
      float rad = radians(deg);
      stroke(#D807F0);
      line(0, 0, lato*2.5, 0);
      rotate(rad);
      line(0, 0, lato*2.5, 0);
      rotateX(rad);
      line(0, 0, 0, lato*2.5);
      popMatrix();
    } 

    popMatrix();
  }
}
