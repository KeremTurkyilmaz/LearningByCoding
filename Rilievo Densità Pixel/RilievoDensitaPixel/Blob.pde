class Blob {
  
  PVector pos;
  int r;
  PVector vel;
  
  Blob(float x, float y){
    pos = new PVector(x,y);
    vel = PVector.random2D();
    vel.mult(random(2, 5));
    r = round(random(60, 80));
  }

  void update(){
    pos.add(vel);    
    if(pos.x > width - r/2  || pos.x < r/2 )  vel.x *= -1;
    if(pos.y > height - r/2 || pos.y <  r/2 ) vel.y *= -1;
  }

  void show(){
    noFill();
    stroke(0);
    strokeWeight(2);
    //line(pos.x, pos.y, width/2, height/2);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
