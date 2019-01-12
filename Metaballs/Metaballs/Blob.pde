class Blob {
  
  PVector pos;
  int r;
  PVector vel;
  
  Blob(float x, float y){
    pos = new PVector(x,y);
    vel = PVector.random2D();
    vel.mult(random(2, 5));
    r = round(random(20, 130));
  }

  void update(){
    pos.add(vel);    
    if(pos.x > width  || pos.x < 0) vel.x *= -1;
    if(pos.y > height || pos.y < 0) vel.y *= -1;
  }

  void show(){
    noFill();
    stroke(0);
    strokeWeight(2);
    line(pos.x, pos.y, width/2, height/2);
    text(r, pos.x, pos.y);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
