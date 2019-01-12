import processing.pdf.*;

Lettera[] letters;

PFont f;
String typing = "";
String message = "";
int opacity = 60;

boolean move;

void setup() {

  size(960, 540);
  pixelDensity(displayDensity());

  f = loadFont("HelveticaNeue-Bold-70.vlw");
  textFont(f);

  opacity = constrain(opacity, 10, 250);

  beginRecord(PDF, "prova.pdf");
  background(0);

}

void draw() {

  if (move) {
    fill(0, opacity);
    rect(-10, -10, width+40, height+40);
  } else {
    fill(0);
    rect(-10, -10, width+40, height+40);
  }

  if (message.length() > 0) {
    for (int i=0; i < letters.length; i++) {
      letters[i].display();
      if (move) letters[i].shift();
    }
  } 

  fill(255);
  textAlign(CENTER, CENTER);
  text(typing, width/2, height/2);

  if (keyCode == UP) {
    println("done");
    endRecord();
    //noLoop();
  }
}

void splitString() {
  move = true;
  message = typing;
  typing = "";
  letters = new Lettera[message.length()];
  int x = (width - (int) textWidth(message)) / 2;
  int y = (height / 2);
  for (int i=0; i < message.length(); i++) {
    letters[i] = new Lettera(new PVector(x, y, 0), message.charAt(i));
    x += textWidth(message.charAt(i));
  }
}



void keyPressed() {

  if (key == '1') {
    move = !move;
  } else if (key == '2') {
    background(0);
    for (int i=0; i < letters.length; i++) {
      letters[i].goHome();
    }
  } else if (key == '3') {
    for (int i=0; i < message.length(); i++) {
      letters[i].modo = 1;
    }
  } else if (key == '4') {
    for (int i=0; i < message.length(); i++) {
      letters[i].modo = 2;
    }
  }

  if (key == BACKSPACE) {
    if (typing.length() > 0) typing = typing.substring(0, typing.length()-1); // Remove last character
  } else if (textWidth(typing+key) < width && key != ENTER && key != '1' && key != '2' && key != '3' && key != '4') {
    typing = typing + key;
  } else if (key == ENTER) {
    splitString();
    println(" ");
    println("--------------------");
    //println("Typing: " + typing);
    println("Message: " + message);
  }


}
