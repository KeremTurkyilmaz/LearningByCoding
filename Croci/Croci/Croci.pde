Box[] boxes;
boolean[] keys = new boolean[256]; // Key state.

void setup() {
  size(500, 800, P3D);  
  pixelDensity(displayDensity());  

  // Box class setup
  boxes = new Box[3];
  boxes[0] = new Box(-40, color(255, 0, 0));
  boxes[1] = new Box(0, color(0, 255, 0));
  boxes[2] = new Box(40, color(0, 0, 255));
}

void draw() {
  
  background(220);
  lights();
  
  for (int i = 0; i < boxes.length; i++) {
    boxes[i].update();
    boxes[i].display();
  }
}

void keyPressed() {
  if (keyCode < keys.length) keys[keyCode] = true;
  for (int i = 0; i < boxes.length; i++) {
    if (key == 'e') boxes[i].style();
    if (key == 'r') boxes[i].debug();
  }
  if (key == 's') save("Croci.jpg");
}

void keyReleased() {
  if (keyCode < keys.length) keys[keyCode] = false;
}
