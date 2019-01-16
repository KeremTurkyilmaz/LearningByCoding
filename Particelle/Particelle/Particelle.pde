int diam = 20;
int modo = 4;
int maxModo = 4;

// Declare the array
ArrayList<Spot> spots;

boolean changeModo = false;

void setup() {
  size(900, 600);
    
  noStroke();
  smooth();

  // Initialize the ArrayList and add One Spot to the center
  spots = new ArrayList<Spot>();
  spots.add(new Spot(width/2, height/2, diam, random(-4, 4), random(-4, 4)));
}

void draw() {
  fill(0, 35);
  rect(0, 0, width, height);

  //Change modo Automatically
  if ( changeModo ) {
    if ((frameCount % 40) == 0) {
      modo++;
      if (modo > maxModo) modo = 1;
      //println("Modo: " + modo);
    }
  }

  for (int i = 0; i < spots.size(); i++) {
    switch(modo) {
    case 1:
      fill(255, 0, 0); 
      break;
    case 2:
      fill(0, 255, 0);
      break;
    case 3:
      fill(0, 0, 255);
      break;
    case 4:
      fill(255);
      break;
    }
    Spot sp = spots.get(i);
    sp.move();
    sp.display();
  }
}

void mousePressed() {
  spots.add(new Spot(mouseX, mouseY, diam, random(-4, 4), random(-4, 4)));
}

void mouseDragged() {
  spots.add(new Spot(mouseX, mouseY, diam, random(-4, 4), random(-4, 4)));
}

void keyPressed() {
  if (keyCode == UP)   modo++;
  if (keyCode == DOWN) modo--;
  if (modo > maxModo)  modo = 1;
  if (modo < 1)        modo = 1;
  if (key == 'c') spots.remove(spots.size()-1);
  if (key == 'w') spots = new ArrayList<Spot>();
  if (key == 'q') changeModo = !changeModo;
  if (spots.size() == 0) spots.add(new Spot(width/2, height/2, diam, random(-4, 4), random(-4, 4)));
}
