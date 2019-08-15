
PVector playerPos = new PVector();
PVector playerVel = new PVector();
float playerSpd = 5;

PVector bulletPos = new PVector();
float bSpd = 15;
int i;

int Screen = 0;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

Player player = new Player();

boolean canShoot = true;
boolean fire = true;
float canShootCounter;

void setup(){
  fullScreen();
}

void draw(){
  if(Screen == 0){
    StartScreen();}
  else if(Screen == 1){
    MenuScreen();}
  else if(Screen == 2){
    GameScreen();}
  else if(Screen == 3){
    GameOverScreen();}
}

void StartScreen(){
  Screen = 0;
  
  if (mousePressed == true){
   Screen = 1; 
  }
}

void MenuScreen(){
  Screen = 1;
  
  if (keyCode == 'Z'){
   Screen = 2; 
  }
  else if (keyCode == 'X'){
   Screen = 2; 
  }
  
  else if (keyCode == 'C'){
   Screen = 2;
  }
}

void GameScreen(){
  Screen = 2;
  background(0);
  
  player.update();
  
  for (i = bullets.size() -1; i >= 0; i--){
  Bullet bullet = bullets.get(i);
  bullet.update();
  }
}

void GameOverScreen(){
  Screen = 3;
}

class Player{
  
  Player(){
   playerPos.x = width/2;
   playerPos.y = height/2;
  }
  void update(){
   if (mousePressed == true){
     if(canShoot == true){
       bullets.add(new Bullet());
       canShoot = false;
       canShootCounter = 0;
     }
   }
   if (canShoot == false){
     canShootCounter ++;
     if (canShootCounter == 5){
       canShoot = true;
     }
   }
   pushMatrix();
   translate(playerPos.x, playerPos.y);
   rotate(-atan2(mouseX - playerPos.x, mouseY - playerPos.y)+(90*PI/180));
   fill(0, 0, 255);
   triangle(5, 0, -15, 10, -15, -10);
   popMatrix();
   playerPos.add(playerVel);
   
   playerPos.x = constrain(playerPos.x, 0, width);
   playerPos.y = constrain(playerPos.y, 0, height);
  }
}

class Bullet{
  float rotation;
  PVector bulletPos;
  Bullet(){
    bulletPos = new PVector(playerPos.x, playerPos.y);
    rotation = atan2(mouseY - playerPos.y, mouseX - playerPos.x)/PI*180;
 }
  void update(){
    bulletPos.x = bulletPos.x + cos(rotation/180*PI)*bSpd;
    bulletPos.y = bulletPos.y + sin(rotation/180*PI)*bSpd;
    fill(255, 255, 255);
    ellipse(bulletPos.x, bulletPos.y, 10, 10);
    if (bulletPos.x > 0 || bulletPos.x < width || bulletPos.y > 0 || bulletPos.y < height){
    }
    else{
      bullets.remove(i);
    }
    /*if (location.x >= enemyPos.x-25 && location.x <= enemyPos.x+25){
     if (location.y >= enemyPos.y-25 && location.y <= enemyPos.y+25){
      eHealth -= 1;
      bullets.remove(i);
     }
    }*/
 }
}


void keyPressed(){
 final int k = keyCode;
 
 if      (k == LEFT  | k == 'A') playerVel.x = -playerSpd;
 else if (k == RIGHT | k == 'D') playerVel.x =  playerSpd;
 else if (k == UP    | k == 'W') playerVel.y = -playerSpd;
 else if (k == DOWN  | k == 'S') playerVel.y =  playerSpd;
}

void keyReleased(){
  final int k = keyCode;
  
  if      ( k == LEFT  | k == 'A' && playerVel.x < 0
         || k == RIGHT | k == 'D' && playerVel.x > 0)
         playerVel.x = 0;
    
  else if ( k == UP   | k == 'W' && playerVel.y < 0
         || k == DOWN | k == 'S' && playerVel.y > 0)
         playerVel.y = 0;
}
