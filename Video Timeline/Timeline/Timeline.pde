import processing.video.*;
import java.util.Calendar;

Movie movie;

int tileCountX = 40;
int tileCountY = 60;
float tileWidth, tileHeight;
int imageCount = tileCountX*tileCountY; 
int currentImage = 0;
int gridX = 0;
int gridY = 0;


void setup() {
  size(1024, 800);
  background(#1F1F1F); 

  movie = new Movie(this, "OUTPUT9.mov");
  movie.play();

  tileWidth  = width / (float)tileCountX;
  tileHeight = height / (float)tileCountY;

}


void draw() {
  
  float posX = tileWidth*gridX;
  float posY = tileHeight*gridY;

  // calculate the current time in movieclip
  float moviePos = map(currentImage, 0,imageCount, 0,movie.duration());
  movie.jump(moviePos);
  movie.read();
  image(movie, posX, posY, tileWidth, tileHeight);

  gridX++;
  if (gridX >= tileCountX) {
    gridX = 0;
    gridY++;
  }

  currentImage++;
  if (currentImage >= imageCount) noLoop();

}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
