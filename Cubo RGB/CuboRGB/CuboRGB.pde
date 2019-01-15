PVector pos, rot;
boolean wireframe = true;

int num = 50;
float a = 0;
int q = 1;
int r = 5;
boolean[] keys = new boolean[256]; // Key state.

void setup() {

  size(400, 600, P3D);  
  pixelDensity(displayDensity());  

  r = constrain(r, 5, 100);

  pos = new PVector(width/2, height/2, 0);
  rot = new PVector(0, 0, 0);
}

void draw() {

  // Position vector
  if (keys[UP]) {
    pos.z += 10;
    //println("pos = " + pos);
  } else if (keys[DOWN]) {
    pos.z -= 10;
    //println("pos = " + pos);
  }

  // Rotation vector (smoothed)
  if (mousePressed) {
    rot.x += ((height/2 - mouseY) * 0.01 - rot.x) * 0.1 ;
    rot.y += ((width/2 - mouseX)  * 0.01 - rot.y) * 0.1;
  } else {
    rot.x += 0.008;
    rot.y += 0.00823;
  }

  float l = 200;  //Dimensione del cubo.

  translate(pos.x, pos.y, pos.z);
  background(0);
  noFill();

  strokeWeight(q);
  rotateX(rot.x);
  rotateY(rot.y);
  rotateZ(rot.y);

  pushMatrix();
  for (int i = 0; i < num; i += r) {
    if ((i % 10) == 0) {
      stroke(255, 0, 0);
    } else {
      stroke(255);
    }
    box(l+i, l+i, l+i);
  }
  popMatrix();

  pushMatrix();
  translate(l/2, l/2);
  for (int i = 0; i < num; i += r) {
    if ((i % 10) == 0) {
      stroke(0, 255, 0);
    } else {
      stroke(255);
    }
    box(l+i, l+i, l+i);
  }
  popMatrix();

  pushMatrix();
  translate(-l/2, -l/2);
  for (int i = 0; i < num; i += r) {
    if ((i % 10) == 0) {
      stroke(0, 0, 255);
    } else {
      stroke(255);
    }
    box(l+i, l+i, l+i);
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode < keys.length) keys[keyCode] = true;
  if (keyCode == LEFT) num-=5;
  if (keyCode == RIGHT)num+=5;
  if (key == 'q') q--;
  if (key == 'w') q++;

  if ( r > 5) {
    if (key == 'e') r-=5;
  } else {
    if (key == 'r') r+=5;
  }

  if (key == 's') { 
    String f = "out/" + System.currentTimeMillis() + ".png";
    print("Salvo file: " + f + "... ");
    save(f);
    println("ok!");
  }
}

void keyReleased() {
  if (keyCode < keys.length) keys[keyCode] = false;
}
