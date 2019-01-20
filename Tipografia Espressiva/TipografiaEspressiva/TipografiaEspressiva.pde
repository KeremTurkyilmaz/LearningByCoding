/*
 * Tipografia Espressiva
 * ----------------------------------------------------
 * Tasti:     
 *     TAB :     Aggiungi Tabulazione alla stringa
 *     BACK:     Rimuovi l'ultima lettera
 *     §   :     Cancella stringa
 *     à   :     Maiuscole
 * ----------------------------------------------------
 * Mode:     
 *     1   :     Alfabeto
 *     2   :     Stile libero
 * ----------------------------------------------------
 */

import controlP5.*;
import processing.pdf.*;

PFont[] SF   = new PFont[4];

String[][]text = new String[1][];
PGraphics preview;

RadioButton alignButton, modeButton, textButton;

// Slider Variable
float size, leading, opacity;
int posX, posY;

// Font Weight
int fontSelect = 0;
int weight = 0;

String keys = "";

// PGraphics Width & Height
int w, h;

// Some variable
int counter = 0;
int tAlign = 0;
int mode   = 1;

boolean upper;
color c, b;

void setup() {
  size(900, 690);
  smooth();
  frameRate(30);

  // Inizializza l'immagine di anteprima:
  w = round(mm(480)); // creimo un documento grande 13cm x 18cm
  h = round(mm(680));
  preview = createGraphics(w, h, JAVA2D);

  // Load font
  for (int i = 0; i < SF.length; i++) { 
    SF[i] = createFont("font/" + "0" + i + ".otf", 100);
  }

  textFont(SF[weight]);

  // Load text
  for (int i = 0; i < text.length; i++) {
    text[i] = loadStrings("text" + i + ".txt");
  }
  
  mode = 1;
  c = color(255);
  b = color(0);
  

  initGUI();
}

void draw() {
  background(50);

  // Rendering sull'anteprima:  
  preview.beginDraw();
  textGenerate(preview);
  preview.endDraw();

  // Display dell'anteprima:
  float scala = 0.3;                 // ridimensioniamo l'antepirma
  float w =  preview.width * scala;   // nuova larghezza
  float h =  preview.height * scala;  // nuova altezza
  image(preview, width - 20 - w, 20, w, h);

  noFill();
  strokeWeight(0.5);
  stroke(255);
  rect(width - 20 - w, 20, w, h);
  info();
}

void info() {
  textSize(7);
  textAlign(LEFT);
  text("FrameRate: " + round(frameRate), 20, height-20);
  text(nf(day(), 2)+ "." + nf(month(), 2)+ "." + nf(year(), 4)+ " - " + nf(hour(), 2)+ ":" + nf(minute(), 2)+ ":" + nf(second(), 2), 150, height-20);
}

void textGenerate(PGraphics gfx) {
  // Text
  gfx.textFont(SF[weight]);
  gfx.textSize(size);
  gfx.textLeading(leading);

  gfx.background(b);
  gfx.fill(c, opacity);

  align(tAlign, gfx); // Text align mode
  mode(mode, gfx);    // Select mode
}

void keyPressed() {
  int len = keys.length();

  if (key == 'à') upper = !upper;
  if (key == '§') keys  = "";

  if (mode == 2) {
    if (key == BACKSPACE) {
      if (len == 0) return;
      if (len > 0) keys = keys.substring(0, int(len-1));
    } else {
      if (key != '§' && key != 'à') {
        keys += key;
      }
      if (keyCode == TAB) keys += "          ";
    }
  }
}

// Converte punti mm in punti PostScript
// esempio: mm(29) diventano 29 mm 
float mm(float pt) {
  return pt * 2.83464567f;
}
