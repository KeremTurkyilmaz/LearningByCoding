void setup() { 
  size(600, 600, P3D); 
  pixelDensity(displayDensity());
}

void draw() { 
  background(0); 
  smooth(); 
  for (int i = 1; i<15; i=i+1) { 
    pushMatrix(); 
    stroke(255); 
    noFill(); 
    translate(width/2, height/2, -100);
    rotateX((frameCount+i*1) * 0.005111); 
    rotateY((frameCount+i*2) * 0.005222); 
    rotateZ((frameCount+i*3) * 0.005322); 
    box(i*25); 
    popMatrix();
  }
}

void keyPressed(){
  if (key == 's') save("img.tiff");
}
