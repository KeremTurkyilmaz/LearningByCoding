PrintWriter data;
PImage img;

File[] files;
int num;
int index = 0;

PFont f;

PVector beginCorner = new PVector();
PVector endCorner = new PVector();
float posX, posY;
float scl = 0.3;

// Data output
int x, y, iw, ih, rw, rh;

void setup() {

  size(1000, 800, P2D);

  data = createWriter("data.txt");

  File file = new File(sketchPath("data/"));
  String[] listPath = file.list();
  println("The Directory contains " + listPath.length + " elements.");
  

  f = createFont("HelveticaLT-Bold-48", 10);
  textFont(f);

  num = listPath.length - 2;
  img = loadImage("0" + index + ".jpg");

  imageMode(CORNER);
  rectMode(CORNERS);
}


void draw() {

  background(20);

  // Store image resolution
  iw = img.width;
  ih = img.height;

  if ( iw > 2000 ) {
    scl = 0.15;
  } else {
    scl = 0.4;
  }

  // Align Image to the center
  posX = (width  - iw*scl) / 2;
  posY = (height - ih*scl) / 2;


  // Display Image
  image(img, posX, posY, iw*scl, ih*scl);

  stroke(255, 0, 0);
  strokeWeight(2);
  line(0,posY, width, posY);
  line(posX, 0, posX, height);
  line(posX+iw*scl,0,posX+iw*scl,height);
  line(0, posY+ih*scl, width, posY+ih*scl);

  x = floor((beginCorner.x-posX)/scl);
  y = floor((beginCorner.y-posY)/scl);
  rw=floor((endCorner.x-beginCorner.x)/scl);
  rh=floor((endCorner.y-beginCorner.y)/scl);

  debug();
  Info();
}

void mousePressed() { 
  beginCorner = new PVector(mouseX, mouseY);
}
void mouseReleased() { 
  endCorner = new PVector(mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == UP) { 
    index = (index+1)%num;  
    img = loadImage("0" + index + ".jpg");
  }  
  if (keyCode == DOWN) { 
    index = (index-1+num)%num;
    img = loadImage("0" + index + ".jpg");
  }
  if ( key == 's' ) { 
    data.println(x+","+y+","+rw+","+rh);
  }
  if (key == '1') { 
    data.flush(); 
    data.close();
  }
}
