void setup() {
  background(255);
  noFill();
  size(1200, 700);
  int center_x=width/2;
  int center_y=height/2;
  for (int i=0; i < myCircleArray.length; i++) {
    myCircleArray[i] = new MovingCircle(center_x, center_y);
  }
}


MovingCircle[] myCircleArray = new MovingCircle[10];

class MovingCircle {

  int max_radius=300;
  //  int max_linewidth=100;
  int center_x=width/2;
  int center_y=height/2;
  float delay= random(1)*100+5;
  float minSize=random(20, 60);
  float maxSize=random(100, 500);
  float sizeSpeed = 0.025;
  float size=10;


  MovingCircle(int center_x, int center_y) {
    float radius = random(1)*max_radius;

  }

  void update() {
    //oscillating width of the circles
    float linewidth= sin(frameCount*sizeSpeed)*20+20;         
    strokeWeight(linewidth);      
    //oscillating size of circles
    size = map(sin(frameCount * sizeSpeed), -1.0, 1.0, minSize, maxSize);
    //making the circles follow the cursor, delay used so that some are slower to follow
    center_x+=(mouseX - center_x)/delay;
    center_y+= (mouseY - center_y)/delay;
    //make color random
    stroke(random(200), random(0), random(200));
  }

  void drawCircle() {
    circle(center_x, center_y, size);
  }
};

void draw() {
  // Always erase the screen first
  background(255);
  //updating each of the circles
  for (int i=0; i < myCircleArray.length; i++) {  
    myCircleArray[i].update();
    myCircleArray[i].drawCircle();
  }
}
