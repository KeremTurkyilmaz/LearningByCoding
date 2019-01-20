import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fft;

PGraphics pg;
String[] filenames;
String nomeFile;
float c = 1.4;
float dist, spacing;
float angle = 0;
float opacity = 20;
float num = 25;

void setup() {

  size(800, 800, P3D);
  smooth();

  pg = createGraphics(1080, 1080, P3D);

  String path = sketchPath("");
  filenames = listFileNames(path);

  minim = new Minim(this);

  for (int i = 0; i < filenames.length; i++) {
    if (filenames[i].endsWith(".mp3")) {
      nomeFile = filenames[i];
    }
  }

  player = minim.loadFile(nomeFile);
  fft = new FFT(player.bufferSize(), player.sampleRate());
  player.play();

}

void draw() {


  if (frameCount % 120 == 0) {
    num = round(random(10, 55));
    opacity = round(random(0, 10));
  }

  // Round number of rect and spacing, constrain opacity
  spacing = round(pg.width/num);
  dist = spacing*2;
  opacity = constrain(opacity, 0, 50);

  // Start Recording the PGraphics
  pg.beginDraw();
  pg.background(0);
  fft.forward(player.mix);

  for (int i = 0; i < fft.specSize(); i++) {
    pg.pushMatrix();
    pg.translate(pg.width/2, 150+i*dist, -(pg.width/4));
    pg.rotateY(angle);
    pg.fill(fft.getBand(i)*c+opacity);
    float rectHeigth = constrain(fft.getBand(i)*c, 10, pg.width);
    pg.box(rectHeigth, spacing*2, 400);
    pg.popMatrix();
  }

  angle += 0.0185;

  // End Recording the PGraphics
  pg.endDraw();

  image(pg, 0, 0, width, height);

}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  String names[] = file.list();
  return names;
}

void keyPressed() {
  if (keyCode == UP)     num+=5;  
  if (keyCode == DOWN)   num-=5; 
  if (keyCode == LEFT)   opacity-=5;
  if (keyCode == RIGHT)  opacity+=5;
  if (key  == 'x')       pg.noStroke();
  if (key  == 'y')       pg.stroke(0);
}
