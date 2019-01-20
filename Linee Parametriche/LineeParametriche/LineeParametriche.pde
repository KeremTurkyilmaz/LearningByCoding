float t = 0;
int NUMS = 50;
float space = 3.2;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  //background(255);

  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  // RED
  pushMatrix();
  translate(width/2 - ((width/2)/2), height/2);
  for (int i = 0; i < NUMS; i++) {
    strokeWeight(i*0.2);
    stroke(255, 0, 0, i*30);
    float tot = t+i;
    line(x1(tot), y1(tot), x2(tot), y2(tot));
  }
  popMatrix();

  //GREEN
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < NUMS; i++) {
    strokeWeight(i*0.2);
    stroke(0, 255, 0, i*30);
    float tot = t+i;
    line(x3(tot), y3(tot), x4(tot), y4(tot));
  }
  popMatrix();

  // BLUE
  pushMatrix();
  translate(width/2 + ((width/2)/2), height/2);
  for (int i = 0; i < NUMS; i++) {
    strokeWeight(i*0.2);
    stroke(0, 0, 255, i*30);
    float tot = t+i;
    line(x5(tot), y5(tot), x6(tot), y6(tot));
  }
  popMatrix();


  t+=0.5;
}

// RED
float x1 (float t) {
  return sin(t/10)*200+ sin(t/5)*20;
}
float y1 (float t) {
  return cos(t/10)*100;
}
float x2 (float t) {
  return sin(t/10)*40 + sin(t/20)*20;
}
float y2 (float t) {
  return cos(t/20) * 200 + cos(t/12)*20;
}


// GREEN
float x3 (float t) {
  return sin(t/10)*400+sin(t/5)*20;
}
float y3 (float t) {
  return cos(t/10)*100;
}
float x4 (float t) {
  return sin(t/10)*10 + sin(t/20)*2;
}
float y4 (float t) {
  return cos(t/20) * 200 + cos(t/12)*20;
}


// BLUE
float x5 (float t) {
  return sin(t/10)*100 + sin(t/5)*20;
}
float y5 (float t) {
  return cos(t/10)*100 + cos(t/12)*10;
}
float x6 (float t) {
  return sin(t/10)*10  + sin(t/20)*2;
}
float y6 (float t) {
  return cos(t/10)*200 + cos(t/100)*10;
}

// Example 01x
//float x1 (float t) {return sin(t/3)*40 + sin(t/5)*20; }
//float y1 (float t) {return cos(t/5)*40 + cos(t/12)*10;}
//float x2 (float t) {return sin(t/7)*10  + sin(t/20)*40;}
//float y2 (float t) {return cos(t/9)*3 + cos(t/100)*10;}
