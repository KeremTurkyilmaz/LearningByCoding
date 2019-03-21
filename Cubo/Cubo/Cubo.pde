void setup() { 
  size(800, 800, P3D);
  pixelDensity(displayDensity());
  smooth();
  noCursor();
}

void draw() { 
  
  background(0); 
  
  smooth(); 
  for (int i = 1; i<150; i++) { 
    pushMatrix(); 
    
    stroke(255);
    if(i%2==0) stroke(0);
    
    //stroke(i * cos(radians(i / 200)), 40);
    
    strokeWeight(12);
    noFill(); 
   
    translate(width/2, height/2, -500);
    rotateX((frameCount+i*2) * 0.002111); 
    rotateY((frameCount+i*4) * 0.009222); 
    rotateZ((frameCount+i*6) * 0.005322); 
    
    scale(map(sin(frameCount*0.007),-1, 1, 0.7, 4));
    
    box(100+i*10,map(sin(frameCount*0.02),-5,5, 0, 1000), 1); 
    //box(100+i*10);
    popMatrix();
  }
  
   
}
