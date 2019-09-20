PImage background;
PImage infoScreen;
PImage gameOverScreen;

static final PVector playerPos = new PVector();
PVector playerVel = new PVector();
float playerSpd = 5;
int life = 5;

PVector bulletPos = new PVector();
float bSpd = 15;
int i, e;

static final PVector enemyPos = new PVector();
static final PVector enemyVel = new PVector();
static final PVector enemyAcc = new PVector();
float ax, ay;
PVector p1 = new PVector(ax, ay);
float enemyHP = 5;
boolean enemyDie = false;
int score;
int spawnNum, killNum;

int spawnBox;
boolean canSpawn = true;

int Screen = 0;
int timeS = 0;
int time= 0;
int timeAdd;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Player player = new Player();

boolean canShoot = true;
float canShootCounter;

void setup() {
  fullScreen();
  player = new Player();
  background = loadImage("wallhaven-42r6gy.jpg");
  background.resize(width, height);
  infoScreen = loadImage("Info Screen Shoot Em Up.jpg");
  infoScreen.resize(width, height);
  gameOverScreen = loadImage("Clean Game Over Screen.jpg");
  gameOverScreen.resize(width, height);
}

void draw() {
  if (Screen == 0) {
    StartScreen();
  } else if (Screen == 1) {
    MenuScreen();
  } else if (Screen == 2) {
    GameScreen();
  } else if (Screen == 3) {
    GameOverScreen();
  }
}

void StartScreen() {
  Screen = 0;
  time = 0;
  background(infoScreen);
  if (mousePressed == true) {
    Screen = 1;
  }
}

void MenuScreen() {
  Screen = 1;
  if (keyCode == 'Z') {
    Screen = 2;
    timeS = second();
  } else if (keyCode == 'X') {
    Screen = 2;
    timeS = second();
  } else if (keyCode == 'C') {
    Screen = 2;
    timeS = second();
  }
}

void GameScreen() {
  Screen = 2;
  spawnNum = 5;
  background(background);
  e = enemies.size();
  player.update();
  playerDeath();
  textSize(35);
  fill(255);
  textAlign(LEFT, BOTTOM);
  text("Score:"+ " " + score, width/99, height/15);

  for (i = bullets.size() -1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
  }
  
  if (e < spawnNum && canSpawn == true){
    enemies.add(new Enemy());
    //Enemy enemy = enemies.get(e);
    //enemy.update();
  }
  if (e > spawnNum){
   canSpawn = false;
  }
  
  
  
  for(int i2 = enemies.size()-1; i2>=0; i2--){
   Enemy enemy = enemies.get(i2);
   enemy.update();
   enemy.enemyMovement();
  }
  
  /*for(Enemy a : enemies){
    a.enemyMovement();
    a.update();
  }*/
  
  if(second() != timeS && Screen == 2){
   time++;
   timeS = second();
  }
  
}

void GameOverScreen() {
  Screen = 3;
  background(gameOverScreen);
  textSize(35);
  fill(255);
  textAlign(LEFT, BOTTOM);
  text("Total Score:"+ " " + score, width/99, height/2);
  text("Enemies Killed:"+ " " + killNum, width/99, height/3);
}


void playerDeath() {
  for (Enemy enemy : enemies) {
    if (playerPos.x >= enemy.enemyPos.x-25 && playerPos.x <= enemy.enemyPos.x+25) {
      if (playerPos.y >= enemy.enemyPos.y-25 && playerPos.y <= enemy.enemyPos.y+25) {
        //GameOverScreen();
        Screen = 3;
        println("Game Over");
      }
    }
  }
}
