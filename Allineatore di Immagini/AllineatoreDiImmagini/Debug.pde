void debug() {
  
    //Rect
  noFill();
  strokeWeight(5);
  if (mousePressed) {
    stroke(255, 0, 0, 200);
    rect(beginCorner.x, beginCorner.y, mouseX, mouseY);
    stroke(255);
    point(beginCorner.x, beginCorner.y);
    point(mouseX, mouseY);
  } else {
    stroke(255, 0, 0, 200);
    rect(beginCorner.x, beginCorner.y, endCorner.x, endCorner.y);
    stroke(255);
    point(beginCorner.x, beginCorner.y);
    point(endCorner.x, endCorner.y);
  }
 
  stroke(255);
  strokeWeight(10);
  point(posX, posY);
  point(posX+img.width*scl, posY);
  point(posX+img.width*scl, posY+img.height*scl);
  point(posX, posY+img.height*scl);
}

void Info() {
  String out = "";
  out += "Info\n";
  out += "FPS:        "  + round(frameRate) + "\n";
  out += "X:          "  + x   + "\n"; 
  out += "Y:          "  + y   + "\n"; 
  out += "Width:      "  + rw  + "\n"; 
  out += "Heigth:     "  + rh  + "\n"; 
  fill(255);
  text(out, 20, 20);
}
