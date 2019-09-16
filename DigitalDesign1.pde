static final PVector playerPos = new PVector();
PVector playerVel = new PVector();
float playerSpd = 5;

PVector bulletPos = new PVector();
float bSpd = 15;
int i, e;

static final PVector enemyPos = new PVector();
PVector enemyVel = new PVector();
float ax, ay;
PVector p1 = new PVector(ax, ay);
int enemySpd = 3;

int spawnBox;
boolean canSpawn = true;

int Screen = 0;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Player player = new Player();

boolean canShoot = true;
float canShootCounter;

void setup(){
  fullScreen();
  player = new Player();
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
  e = enemies.size();
  player.update();
  
  for (i = bullets.size() -1; i >= 0; i--){
  Bullet bullet = bullets.get(i);
  bullet.update();
  }
  
  if (e <= 5 && canSpawn == true){
    enemies.add(new Enemy());
    //Enemy enemy = enemies.get(e);
    //enemy.update();
  }
  if (e >= 5){
   canSpawn = false;
  }
  
  for(Enemy a : enemies){
    a.update();
  }
}

void GameOverScreen(){
  Screen = 3;
}
