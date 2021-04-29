class Player {

  float x = 480, easing = 0.1;
  int vel = 0, frame = 0, y = 600;
  
  void run(){
    
  //these three lines of code describe the easing
  float targetX = mouseX -25;
  float dx = targetX - x;
  x += dx * easing;
    
  shoot();
    
    //this increments the frame so long as it isn't 0 or the end of the animation. comment out to prevent animation
    if (frame > 0){
      frame++;
    }
    
  }
  
  void shoot(){
    
    //these are the animation frames
    if (frame == 0){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+15,6,-40);
      rect(x+16,y-30,18,6);
    }
    else if (frame == 1 || frame >= 9){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+15,6,-40);
      rect(x+16,y-30,18,6);
      
    }
    else if (frame == 2){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+30,6,-40);
      rect(x+16,y-20,18,6);
    }
    else if (frame == 3||frame == 4||frame == 5||frame == 6){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+45,6,-40);
      rect(x+16,y,18,6);
    }
    //pasue it for a few frames. then increase by 10 frames until it gets back to 515
    
    else if (frame == 7){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+35,6,-40);
      rect(x+16,y-5,18,6);
    }
    else if (frame == 8){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+25,6,-40);
      rect(x+16,y-20,18,6);
    }
    else if (frame == 9){
      stroke(0);
      fill(0,255,0);
      rect(x,y,50,50);  
      fill(0);
      rect(x+22,y+15,6,-40);
      rect(x+16,y-30,18,6);
    }
    if (frame == 15){
      frame = 0;
    }
    
    
    
    }
  
  }
