class Spot {
  float x, y;            // X-coordinate, Y-coordinate
  float diameter;        // Diameter of the circle
  float speedX, speedY;  // Distance moved each frame
  int directionX = 1;    // Direction of motion (1 is down, -1 is up)
  int directionY = 1;    // Direction of motion (1 is down, -1 is up)

  // Constructor
  Spot(float xpos, float ypos, float dia, float spx, float spy) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speedX = spx;
    speedY = spy;
  }

  void move() {
    x += (speedX*directionX);
    if ((x<diameter/2)||(x>(width -diameter/2))) directionX *= -1;
    y += (speedY*directionY);
    if ((y<diameter/2)||(y>(height-diameter/2))) directionY *= -1;
  }

  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
