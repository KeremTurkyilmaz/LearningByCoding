void setup() { 
  fullScreen(P3D);
  pixelDensity(displayDensity());
  noCursor();
}

void draw() { 
  
  background(0); 
  
  smooth(); 
  for (int i = 1; i<150; i++) { 
    pushMatrix(); 
    stroke(255);
    if(i%2==0) stroke(0);
    strokeWeight(i*0.02);
    noFill(); 
   
    translate(width/2, height/2, 100);
    rotateX((frameCount+i*1) * 0.003111); 
    rotateY((frameCount+i*2) * 0.003222); 
    rotateZ((frameCount+i*3) * 0.003322); 

    //box(100+i*10, i*10, 10); 
    box(100+i*10);
    popMatrix();
  }
   
}
