import peasy.*;
PeasyCam cam;

Rect[] rects;
PFont font;

boolean wireframe;

String s = "Nato il 7 ottobre 1952 in quella difficile metropoli che è Leningrado (l'attuale San Pietroburgo)," + "\n" +  
            "nel 1970 Putin si iscrive all'università, studia diritto e lingua tedesca, ma nel tempo libero" + "\n" + 
            "si dedica alla pratica dello judo, di cui è sempre stato un grande sostenitore. In questo sport," +  "\n" + 
            "lo zar di ghiaccio ha sempre ritrovato quell'unione fra disciplina del corpo e dimensione" + "\n" +
            "che ne fanno una guida per la vita di tutti i giorni. Forse qualcosa di questa disciplina gli è servita quando nel 1975 è entrato a far parte del Kgb, chiamato ad occuparsi di controspionaggio.";

void setup() {

  //size(1000, 700, P3D); 
  fullScreen(P3D);

  font = loadFont("HelveticaNeue-Bold-30.vlw");
  textFont(font);
  textSize(15);

  cam = new PeasyCam(this, 3400);
  cam.rotateY(-QUARTER_PI);

  rects = new Rect[33];

  for (int i = 0; i < rects.length; i++) {
    int spacing = 200;
    int pz = i * spacing - ((rects.length*spacing)/2);
    rects[i] = new Rect(0, -120, pz, i);
  }

  pixelDensity(displayDensity());
}

void draw() {
  if ( wireframe ) {
    background(127);
  } else {
    background(0);
  }

  for (int i = 0; i < rects.length; i++) {
    rects[i].display();
  }
}

class Rect {

  PImage img;
  PGraphics in;
  int x, y, z;
  int w = 500;
  int index;

  Rect(int px, int py, int pz, int j) {

    x = px;
    y = py;
    z = pz;
    index = j;
    img = loadImage("0" + index + ".jpg"); 

    style();
    generateSpot();
  }


  void style() {
    imageMode(CENTER);
    rectMode(CENTER);
    noStroke();
    noFill();
  }

  void generateSpot() {
    in = createGraphics(w, w, JAVA2D);
    img.resize(int(w), 0);
    int portionW = w/4;
    int portionH = w/4;
    int posX = 0;
    int posY = floor(random(w));
    in.beginDraw();
    in.background(0, 0);
    int m = w;
    int c = floor(random(20,100));
    //in.copy(img, posX, posY, m, c, posX, posY, m, c);
    in.copy(img, 0, 0, w, w, 0, 0, w, w);
    in.endDraw();
  }

  void display() {

    // Image
    pushMatrix();
    translate(x, y, z);
    tint(255, 30);
    image(in, 0, 0, w, w);
    if ( wireframe ) {
      stroke(255);
      noFill();
      rect(0, 0, w, w);
    }
    popMatrix();

    // Support 
    if (wireframe) {
      pushMatrix();
      translate(x, y+w/2+250/2, z);
      fill(255);
      stroke(0);
      box(w, 250, 60);
      translate(0, 0, 30.2);
      fill(0);
      textSize(15);
      textLeading(14);
      text("Vladimir Putin" +  "\n" + "07.10.1952", -235, -w/4+30);
      textSize(5);
      text(s, -117, -20, -235, -w/4+30);
      stroke(0);
      strokeWeight(2);
      line( -235, -w/4+15, -100, -w/4+15);
      strokeWeight(1);
      popMatrix();
    }
  }
}

void keyPressed() {
  if ( key == 'w' ) cam.reset();
  if ( key == 'e' ) cam.rotateY(radians(90));
  if ( key == '1' ) wireframe = !wireframe;
}
