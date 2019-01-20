PImage g;
PImage o;

int num = 6;
int index = 0;

int size = 500;

void setup() {

  //fullScreen(P3D);
  size(1200, 800, P3D);

  noCursor();
  g = loadImage("green.png");
  o = loadImage("0" + index + ".png");
  imageMode(CENTER);
  
  pixelDensity(displayDensity());

  //g.filter(GRAY);
}

void draw() {
  
  pushMatrix();
  translate(0, 0, -200);
  fill(0, 20);
  rect(-800, -800, width*4, height*4);
  popMatrix();

  translate(width/2, height/2, 100);

  if (frameCount % 220 == 0) g = loadImage("0" + (int)random(num) + ".png");
  image(g, 0, 0, size, size);  

  if (frameCount % 200 == 0) {
    index = (index+1)%num;
    o = loadImage("0" + index + ".png");
  }
  
  float d1 = map(sin(frameCount*0.008), -1, 1, 0, 180);
  pushMatrix();
  rotateY(radians(d1));
  image(o, 0, 0, size, size);
  popMatrix();
}
