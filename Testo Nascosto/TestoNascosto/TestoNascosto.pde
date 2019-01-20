int numCircleForFrame = 5;
int attempsStop = 100;

int total, attemps;

Circle c;
boolean gen = true;

ArrayList<Circle> circles;
ArrayList<PVector> spots;

PImage img;

void setup() {
  size(1000, 700);
  smooth();
  
  total = numCircleForFrame;
  attemps = attempsStop;
  
  spots = new ArrayList<PVector>();

  img = loadImage("Senza-titolo-1.png");
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if(b > 1) {
        spots.add(new PVector(x, y));
      }
    }
  }
  circles = new ArrayList<Circle>();
}

void draw() {
  background(0);

  int count = 0;

  while (count < total) {
    Circle newC = newCircle( );
    if (newC != null) {
      circles.add(newC);
      count++;
    }
    attemps++;
    if (attemps > 10000) {
      noLoop();
      println("FINISHED");
      break;
    }
  }

  for (Circle c : circles) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Circle other : circles) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            if (d - 2 < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }

    c.show();
    c.grow();
  }
}


Circle newCircle() {

  int r = int(random(0, spots.size()));
  
  PVector spot = spots.get(r);
  
  float x = spot.x;
  float y = spot.y;

  boolean valid = true;

  for (Circle c : circles) {
    float d = dist(x, y, c.x, c.y);
    if ( d < c.r + 2) {
      valid = false;
      break;
    }
  }

  if (valid) {
    return new Circle(x, y);
  } else {
    return null;
  }
}

void keyPressed() {
  if (key == 'g' || key == 'G') gen = !gen;
}

//if (mousePressed) circles.add( new Circle(mouseX, mouseY));
