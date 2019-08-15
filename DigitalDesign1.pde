PVector playerVel = new PVector();
float playerSpd = 5;

PVector bulletPos = new PVector();
float bSpd = 15;

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
}

void MenuScreen(){
  Screen = 1;
}

void GameScreen(){
  Screen = 2;
}

void GameOverScreen(){
  Screen = 3;
}

class Player{
  
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
     if (canShootCounter >= 5){
       canShoot = true;
     }
   }
  }
}

class Bullet{
  
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
