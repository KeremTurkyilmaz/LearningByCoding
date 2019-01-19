ArrayList<Cella> cells = new ArrayList<Cella>();
PGraphics preview;

int cellSize = 10;
int num = 10;

// Modo - max modo 2
int modo = 1;
int colorMode = 1;

color w = color(0);
color b = color(255);

boolean record;

// Autosave every X sec
// 1s = 60;
int sec = 10;
int autoSaveSec = sec*60;
boolean autoSave = false;


void setup() {

  size(560, 800);

  preview = createGraphics(width, height, JAVA2D);

  for (int i = 0; i < num; i++) {
    int posX = floor(random(width/cellSize )) * cellSize;
    int posY = floor(random(height/cellSize)) * cellSize;
    cells.add(new Cella(posX, posY, cellSize, w, b));
  }
}

void draw() {

  //background(w);

  // AutoSave mode
  if (autoSave) if ((frameCount % autoSaveSec) == 0) record = !record;

  if (record) savePDF(); // START recording PDF

  preview.beginDraw();
  render(preview);
  preview.endDraw();
  image(preview, 0, 0, width, height);

  if (record) closePDF();// END recording PDF
}

void render(PGraphics gfx) {
  for (Cella c : cells) {
    c.edges();
    if (frameCount % 2 == 0) {
      c.move();
    }
    c.modeColor(gfx);
    c.display(gfx);
  }
}

void keyPressed() {
  if (key == 's') record = true;
  if (key == '1') modo = 1;    
  if (key == '2') modo = 2; 
  if (key == '3') modo = 3;    
  if (key == 'p') modo = 5;
  if (key == 'q') colorMode = 1;
  if (key == 'w') colorMode = 2;
  if (key == 'e') {
    for (Cella c : cells) {
      c.clearB();
    }
  }
}
