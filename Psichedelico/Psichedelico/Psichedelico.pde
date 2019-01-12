import java.io.FilenameFilter;

File[] files;
int num;
int index = 0;

PImage img;
float angle = 0;
float scl = 0.05;

void setup() {
  size(900, 600, P3D);

  File basePath = new File(sketchPath("data/"));
  files = basePath.listFiles(new FilenameFilter() {
    @Override  
      public boolean accept(File dir, String filename) {
      return !filename.startsWith(".");
    }
  }
  );  
  num = files.length;
  img = loadImage(files[index].getAbsolutePath());

  imageMode(CENTER);
  background(0);
  pixelDensity(displayDensity());
  noStroke();
}

void draw() {
  
  if(frameCount % 600 == 0 ){
    index = (index+1)%num;
    img = loadImage(files[index].getAbsolutePath());
  }
  
  pushMatrix();
  translate(width/2, height/2);
  scale(map(sin(frameCount * 0.005), -1, 1, 1, 30));  // distance from looked-at point
  rotateX(angle);
  rotateY(angle*3.0245);
  rotateZ(angle*3.394);
  image(img, 0, 0, img.width*scl, img.height*scl);
  popMatrix();
  angle += 0.004;

}
