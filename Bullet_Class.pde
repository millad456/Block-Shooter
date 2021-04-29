class Bullet{

  float y = p.y-50, speed = 10,x;
  int frame = 0, radius = 20, health = (int)random(4,10);
  boolean hit = false;
  
  Bullet(float tempX) {
    x = tempX;
  }
  
  void run(){
    if(health <= 0){
      y = -20;
    }
    if(y == 0){
      destroy();
    }
    else
    {
      shoot();
    }
  }
  void shoot(){
    if(frame == 0){
      stroke(255,255,0);
      fill(255,255,0);
      ellipse(x,y,50,20);
      frame++;
    }
    else if (frame == 1){
      ellipse(x,y+10,50,20);
      frame++;
    }
    else{
      stroke(255,255,0);
      fill(255,255,0);
      ellipse(x,y,10,20);
      y = y - speed;
    }
  }
  
  void destroy(){
  if(radius < 120){
    stroke(0);
    noFill();
    circle(x,y,radius);
    radius = radius + 14;
  }
  else{
    y = -20;
  }
    
  }
}
