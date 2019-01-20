import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int x = 0;
int y = 0;
int scl = 20;

Minim minim;
AudioInput in;

void setup() {
  size(600, 600); 
  background(0);
  minim = new Minim( this );
  in = minim.getLineIn( Minim.STEREO, 512 );
}

void draw() {

  float p = 0;
  for ( int i = 0; i < in.bufferSize(); i++ ) {
    p += abs( in.mix.get( i ) ) * 1;
  }
  fill(p, 0, 0);
  rect(x, y, scl, scl);

  if (p > 3) {
    x+=scl;
    if (x > width) {
      x = 0;
      y += scl;
    }
    if (y > height-1) {
      background(0);
      x = 0;
      y = 0;
    }
  }
}
