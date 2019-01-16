import processing.pdf.*;

String filename() {
  int d = day();
  int m = month();
  int y = year();
  int h = hour();
  int mi = minute();
  int s = second();
  String filename = nf(d, 2) + nf(m, 2) + nf(y, 4) + nf(h, 2) + nf(mi, 2) + nf(s, 2) + ".pdf";
  return filename;
}

void savePDF() {
  beginRecord(PDF, filename()); 
  background(w);
}

void closePDF() {
  endRecord();
  println("PDF Salvato " + filename());
  record = false;
}
