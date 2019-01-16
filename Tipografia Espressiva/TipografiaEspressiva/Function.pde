void align(int theC, PGraphics g) {
  switch(theC) {
    case(0): 
    g.textAlign(LEFT);          
    break;
    case(1): 
    g.textAlign(CENTER);        
    break;
    case(2): 
    g.textAlign(RIGHT);         
    break;
    case(3): 
    g.textAlign(CENTER, CENTER); 
    break;
  }
} 

void mode(int theC, PGraphics g) {  
  switch(theC) {
    case(1):
    for (int i = 0; i < text[counter].length; i++) {
      if (upper)g.text(text[counter][i].toUpperCase(), posX, posY, w, h);
      else      g.text(text[counter][i], posX, posY, w, h);
    }
    break;
    case(2):
    if (upper) g.text(keys.toUpperCase(), posX, posY, w, h);
    else       g.text(keys, posX, posY, w, h);
    break;
  }
} 

void radio(int theC) {
  switch(theC) {
    case(0):
    b = color(0);
    c = color(255);
    break;
    case(1):
    b = color(255);
    c = color(0);
    break;
    case(2):
    b = color(random(100, 255), random(100), random(100));
    c = color(b*4);
    break;
  }
} 

public void savePDF() {
  int d = day();
  int m = month();
  int y = year();
  int h = hour();
  int mi = minute();
  int s = second();
  String filename = "out/" + nf(d, 2) + nf(m, 2) + nf(y, 4) + nf(h, 2) + nf(mi, 2) + nf(s, 2) + ".pdf";
  PGraphicsPDF pdf = (PGraphicsPDF) createGraphics(preview.width, preview.height, PDF, filename);
  pdf.beginDraw();
  pdf.textMode(SHAPE);
  textGenerate(pdf);
  pdf.dispose();
  pdf.endDraw();
  println("PDF " + filename + " salvato...!");
}
