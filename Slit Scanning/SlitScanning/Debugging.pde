void recorder() {
  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
  rect(pos, spacing, w, h);
}

void corner() {
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(spacing, spacing, w, h);
  rect(pos, spacing, w, h);
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  String names[] = file.list();
  return names;
}

// Save PDF
void savePDF() {
  String filename = "out/" + System.currentTimeMillis() + ".pdf";
  PGraphicsPDF pdf = (PGraphicsPDF) createGraphics(pg.width, pg.height, PDF, filename);
  pdf.beginDraw();
  pdf.image(pg, 0, 0);
  pdf.dispose();
  pdf.endDraw();
  println("PDF " + filename + " Saved!");
}

void info() {
  String data = "";
  data += "--------- Info ---------\n";
  data += "Images      : " + (num-1) +  "\n";
  data += "Image Index : " + filenames[index] +  "\n";
  data += "Modo        : " + modo    +  "\n";
  data += "Portion     : " + portion +  "\n"; 
  data += "\n";
  fill(255);
  text(data, 720, spacing+2);
}

// Interesting Effects with 'h' parameter -> Adjust velocity to 4
// pg.copy(img[index], 0, mouseY-spacing, img[index].width, h, 0, speed, pg.width, portion);
