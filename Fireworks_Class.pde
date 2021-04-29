//fireworks from https://cs.brynmawr.edu/Courses/cs110/fall2012/section001/examples/week13/Fireworks/applet/index.html

class Fire {
  float x;
  float y;
  float vx;
  float vy;
  color col;
  float lifetime = 100;
  
  //constructor
  Fire(float x, float y, float vx, float vy, color col) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.col = col;
  }

  void draw() {
    if (lifetime-50>0) {
      noStroke();
      fill(col, lifetime-50);
      ellipse(x, y, 4, 4);
      lifetime -= 0.5;
    }
  } 

  void update() {
    vy += G;
    x += vx;
    y += vy;
  }
}
