class Circle {

  float x, y, r;
  boolean growing = true;
  
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 2;
  }
  
  void grow(){
    if(growing) r = r + 0.5;
  }
  
  boolean edges(){
   return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
  }

  void show() {
    stroke(255);
    noFill();
    strokeWeight(2);
    ellipse(x, y, r*2, r*2);
  }
}
