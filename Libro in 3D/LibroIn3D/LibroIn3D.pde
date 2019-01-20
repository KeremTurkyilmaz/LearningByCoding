float w, h, d;
float rotx = 0;
float roty = 0;

PImage copertina, dorso, page, retro, sopra;
float angle = 0;

boolean control;

int modo = 1;

void setup() {
  size(900, 600, P3D);  

  copertina = loadImage("copertina.jpg");
  dorso     = loadImage("dorso.jpg");
  page      = loadImage("page.jpg");
  retro     = loadImage("retro.jpg");
  sopra     = loadImage("sopra.jpg");

  textureMode(NORMAL);

  pixelDensity(displayDensity());

  w = 210;
  h = 297;
  d = 30;

}

void draw() {  
  background(20);
  translate(width/2, height/2, 100);

  if ( control ) {
    if ( modo == 1) {
      rotateY(roty);
    } else if (modo == 2) {
      rotateX(rotx);
      rotateY(roty);
    } else if (modo == 3) {
      rotateY(roty);
    }
  } else {
    rotateY(angle);
  }

  scale(1.13);
  TexturedCube();
  
  angle += 0.016;
}

void TexturedCube() {

  stroke(0);
  strokeWeight(.5);
  noFill();
  //noStroke();
  
  //stroke(255, 0, 0);
  //line(0, 0, 0, 100, 0, 0);
  //stroke(0, 255, 0);
  //line(0, 0, 0, 0, 100, 0);
  //stroke(0, 0,255);
  //line(0, 0, 0, 0, 0, 100);
  
  // Copertina
  beginShape(QUADS);
  texture(copertina);  
  vertex(-w/2, -h/2, d/2, 0, 0);   
  vertex( w/2, -h/2, d/2, 1, 0);  
  vertex( w/2, h/2, d/2, 1, 1);   
  vertex(-w/2, h/2, d/2, 0, 1);   
  endShape();

  // Retro
  beginShape(QUADS);
  texture(retro); 
  vertex(-w/2, -h/2, -d/2, 0, 0);   
  vertex( w/2, -h/2, -d/2, 1, 0);   
  vertex( w/2, h/2, -d/2, 1, 1);   
  vertex(-w/2, h/2, -d/2, 0, 1);   
  endShape();

  // Dorso
  beginShape(QUADS);
  texture(dorso);
  vertex(-w/2, h/2, d/2, 0, 0);
  vertex(-w/2, h/2, -d/2, 1, 0);
  vertex(-w/2, -h/2, -d/2, 1, 1);
  vertex(-w/2, -h/2, d/2, 0, 1);
  endShape();

  // Pagina
  beginShape(QUADS);
  texture(page);
  vertex( w/2, -h/2, d/2, 0, 0);
  vertex( w/2, -h/2, -d/2, 1, 0);
  vertex( w/2, h/2, -d/2, 1, 1);
  vertex( w/2, h/2, d/2, 0, 1);
  endShape();

  // Sotto
  beginShape(QUADS);
  texture(sopra);
  vertex(-w/2, h/2, d/2, 0, 0);   
  vertex( w/2, h/2, d/2, 1, 0);    
  vertex( w/2, h/2, -d/2, 1, 1);   
  vertex(-w/2, h/2, -d/2, 0, 1); 
  endShape();

  // Sopra
  beginShape(QUADS);
  texture(sopra);
  vertex( w/2, -h/2, d/2, 0, 0);   
  vertex(-w/2, -h/2, d/2, 1, 0);    
  vertex(-w/2, -h/2, -d/2, 1, 1);  
  vertex( w/2, -h/2, -d/2, 0, 1); 
  endShape();
}

void keyPressed() {
  if ( key == 'q' ) control = !control;
  if ( key == '1' ) modo = 1;
  if ( key == '2' ) modo = 2;
  if ( key == '3' ) {
    modo = 3;
    roty = PI/4;
  }
  if ( key == 's' ) save("output.tiff");

}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
