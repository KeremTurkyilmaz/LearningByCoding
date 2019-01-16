// TO DO
// Il cerchio all'interno deve rappresentare la media dei 4 colori all'esterno
import processing.pdf.*;
import java.util.Calendar;

PImage img;
int celle = 25;
int detail;

int num = 0;
int index = 0;

boolean preventLoop = true;
boolean savePDF = false;

color bg = color(31, 31, 31);

void setup() {

  size(600, 600);

  File file = new File(sketchPath("") +"data/");
  String[] listPath = file.list();
  println("The Directory contains " + listPath.length + " elements.");

  num = listPath.length - 1;
  img = loadImage("0" + index + ".jpg");
  background(bg);
  
}

void draw() {

  if (savePDF) {
    beginRecord(PDF, "out/" + timestamp() + ".pdf");
    background(bg);
  }  

  translate(50, 50);
  constrain(celle, 5, 50);
  detail = floor(img.width/celle);

  for (int i=0; i<img.width; i+=detail) {
    for (int j=0; j<img.height; j+=detail) {
      PImage newImg = img.get(i, j, detail, detail);
      //PImage newImg1 = newImg.get(i, j, detail*4, detail*4);
      noStroke();
      fill(estrareIlColoreDallaFoto(newImg));
      if ( i < img.width - detail && j < img.height-detail) ellipse(detail + i, detail + j, detail/3.5, detail/3.5);
      ellipse(i+detail/2, j+detail/2, detail-3, detail-3);
    }
  }

  if (savePDF) {
    endRecord();
    savePDF = false;
  }
}

void keyPressed() {
  background(bg);
  if ( keyCode == UP ) {
    index = (index + 1 ) % num;
    img = loadImage("0" + index + ".jpg");
  }
  if ( keyCode == DOWN ) {
    index = (index - 1 + num) % num;
    img = loadImage("0" + index + ".jpg");
  }
  if ( key=='s' || key=='S' ) {
    savePDF = true;
  }

  if ( keyCode == RIGHT ) {
    celle += 5;
  }
  if ( keyCode == LEFT  ) {
    celle -= 5;
    if ( celle == 0 ) celle = 5;
  }
}

color estrareIlColoreDallaFoto(final PImage img) {
  img.loadPixels();
  color r = 0, g = 0, b = 0;
  for (final color c : img.pixels) {
    r += c >> 020 & 0xFF;
    g += c >> 010 & 0xFF;
    b += c        & 0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
  return color(r, g, b);
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
