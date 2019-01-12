PImage g;
PImage o;

int num = 6;
int index = 0;

int size = 1000;

void setup() {

  fullScreen(P3D);

  noCursor();
  g = loadImage("green.png");
  o = loadImage("0" + index + ".png");
  imageMode(CENTER);
  
  pixelDensity(displayDensity());

  //g.filter(GRAY);
}

void draw() {
  //background(0);
  
  pushMatrix();
  translate(0, 0, -200);
  fill(0, 20);
  rect(-800, -800, width*4, height*4);
  popMatrix();

  translate(width/2, height/2, 100);

  if (frameCount % 220 == 0) {
    g = loadImage("0" + (int)random(num) + ".png");
  }

  
  //scale(map(sin(frameCount*0.004), -1, 1, 0.1, 2));
  
  
  //float f = map(sin(frameCount*0.004),-1,1, -360, 360);
  pushMatrix();
  //rotateY(radians(f*1.6095));
  image(g, 0, 0, size, size);  
  popMatrix();


  if (frameCount % 200 == 0) {
    index = (index+1)%num;

    o = loadImage("0" + index + ".png");
  }
  
  float d1 = map(sin(frameCount*0.004), -1, 1, -360, 360);
  float d2 = map(sin(frameCount*0.004), -1, 1, 0, 20);
  pushMatrix();
  rotateY(radians(d1*1.1495));
  rotateX(radians(d2*1.1495));
  

  image(o, 0, 0, size, size);

  popMatrix();
}

void keyPressed() {
  saveFrame("CIao.tiff");
}
