int tick = 0;
PFont f;
String streaks = "SEND NUDES";
String title = "BLOCK SHOOTER", controls = "Mouse to Move", controls2 = "Click to Shoot", start = "start";
Player p = new Player();
final static ArrayList<Bullet> bullet = new ArrayList();
int cols = 10, rows = 18, w = 72, h = 20, gameState = 0;//gamestate refers to title screen, game, and ending
float colour;
Block[][] block = new Block[cols][rows];
int r = 0, g = 0, b = 0;
ArrayList<Fire> fireworks = new ArrayList();
final float G = 0.04;

void setup() {
  for(int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
      block[j][i] = new Block(j*w,i*h);
    }
  }
  
  size(720, 720);
  stroke(0);
  fill(255);
}

void draw() {
  if(gameState == 0){//title screen
    background(230);
    //draw all blocks
    for(int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        block[j][i].run();
      }
    }
    IntroScreen();
  }else if(gameState == 1){//the actual game
    background(230);
    displayText();
    p.run();
    checkCollisions();
    if(checkWin()) gameState++;
    
    //draw all bullets
    for (Bullet currentBullet : bullet ) { 
      currentBullet.run();
    }
    //draw all blocks
    for(int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        block[j][i].run();
      }
    }
  
  }else if(gameState == 2){//the end of the game
    //end fireworks
    background(230);
    displayText();
    p.run();
    
    //fireworks stuff
    for (int i = 0; i < fireworks.size(); i++) {
      fireworks.get(i).update();
      fireworks.get(i).draw();
    }
    if (tick % 30 == 0){
      float spawnx = random(20,700);
      float spawny = random(50,300);
      fireworks.clear();
      color c = color(random(50, 255), random(50, 255), random(50, 255));
      int numFires = (int)random(4, 1000);
      for (int i=0; i<numFires; i++) {
        float r = random(0, TWO_PI);
        float R = random(0, 2);
        fireworks.add(new Fire(spawnx, spawny, R*sin(r), R*cos(r), c));
      }
    }
  }
  //reset at the end of every frame
  //clear();
  tick ++;
  println(tick);
}


void mousePressed() {
  if (mousePressed == true && p.frame == 0) {
    p.frame = 1;
    bullet.add ( new Bullet(p.x+25));
  }
}




//displays the streaks message
void displayText(){
  f = createFont("Arial",80,true);
  textFont(f,80);
  
  for (int i = 0; i <= 9; i++){
    if (tick % 10 == 0){
      r = (int) random(100,255);
      g = (int) random(100,255);
      b = (int) random(100,255);
    }
    fill(r, g, b); 
    text(streaks.charAt(i), 60 + 60*i,128);
  }
}

//displays the into Message
void IntroScreen(){
  f = createFont("Arial",80,true);
  textAlign(CENTER);
  
  //title message
  textFont(f,80);
  fill(0);
  text(title, width/2, 150);
  textFont(f,79);
  fill(255);
  text(title, width/2, 145);
  
  //controls
  textAlign(LEFT);
  textFont(f,20);
  fill(0);
  text(controls, 50, 400);
  text(controls2, 50, 450);
  
  //start box
  noFill();
  if(mouseX > 220 && mouseX < 220 + 280 && mouseY > 500 && mouseY < 500 + 100){
    fill(0,255,0);
    if(mousePressed)fill(255,255,0);
  }
  stroke(0);
  strokeWeight(8);
  rect(220,500, 280, 100);
  
  textFont(f,75);
  fill(0);
  textAlign(CENTER);
  text(start, width/2,575);
  strokeWeight(1);
}

void mouseReleased(){
  if(mouseX > 220 && mouseX < 220 + 280 && mouseY > 500 && mouseY < 500 + 100 && gameState == 0){
    gameState = 1;
  }
}
void checkCollisions(){
  //handles all bullet and block collisions
  for(int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
      for (Bullet currentBullet : bullet ) { 
        if(currentBullet.x >= block[j][i].x && currentBullet.x <= block[j][i].x + w && currentBullet.y == block[j][i].y && block[j][i].alive == true){
          block[j][i].frame ++;
          block[j][i].alive = false;
          currentBullet.hit = true;
          currentBullet.health = currentBullet.health - 1;
          //bullet.remove(currentBullet);
        }
      }
    }
  }
}

boolean checkWin(){
  for (int j = 0; j < cols; j++){
    if(block[j][0].alive){
      return false;
    }
  }
  return true;
}
