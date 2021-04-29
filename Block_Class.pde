
class Block{
  int y,x,frame = 0;
  float radius = 20;
  float colour = (random(128));
  boolean alive = true;
  
  Block(int tempX,int tempY) {
    x = tempX;
    y = tempY;
  }
  void run(){
    if (frame == 0){
      stroke(0);
      fill(colour + 128);
      rect(x,y,w,h);
    }
    else{
      if (radius < 120){
      stroke(0);
      noFill();
      circle(x + w/2,y + h/2,radius);
      radius = radius + 14;
      }
    }
  }
  
}
