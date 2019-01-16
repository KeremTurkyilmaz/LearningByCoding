int numImg = 33;
PImage[] img = new PImage[numImg];
PImage[] mask = new PImage[3];
int current1 = 0;
int current2 = 0;
int current3 = 0;

void setup() {

  size(500, 500);

  for (int i = 0; i< img.length; i++) {
    img[i] = loadImage("0"+i+".jpg");
  }

  for (int i = 0; i < mask.length; i++) {
    mask[i] = loadImage("mask_0"+i+".jpg");
  }
}

void draw() {
  img[current1].mask(mask[0]);
  image(img[current1], 0, 0);
  img[current2].mask(mask[1]);
  image(img[current2], 0, 0);
  img[current3].mask(mask[2]);
  image(img[current3], 0, 0);
  
  
 
  if( frameCount % 10  == 0){
    //int num = floor(random(1,4));
    //if(num == 1) current1 = floor(random(img.length));
    //if(num == 2) current2 = floor(random(img.length));
    //if(num == 3) current3 = floor(random(img.length));
    current1 = floor(random(img.length));
    current2 = floor(random(img.length));
    current3 = floor(random(img.length));
  }
  
  //if(frameCount % 10 == 0) saveFrame("image/" + "image-#####.png");
  
  
}

//void mousePressed() {
//  if ((mouseY > 0) && (mouseY<166)) {
//    current1++;
//  } else if ((mouseY > 166) && (mouseY < 332)) {
//    current2++;
//  } else {
//    current3++;
//  }
  
//  if (current1 == numImg) current1 = 0;
//  if (current2 == numImg) current2 = 0;
//  if (current3 == numImg) current3 = 0;
//}