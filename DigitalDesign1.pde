PImage background;
PImage infoScreen;
PImage gameOverScreen;
PImage lifePNG;

static final PVector playerPos = new PVector();
PVector playerVel = new PVector();
float playerSpd = 5;
int life = 10;

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
int spawnNum = 5, killNum, newWave = 5;

int spawnBox;
boolean canSpawn = true;

int Screen = 0;
int timeS = 0;
int time= 0;
int timeW;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<EnemyA> enemiesA = new ArrayList<EnemyA>();
ArrayList<EnemyB> enemiesB = new ArrayList<EnemyB>();

Player player = new Player();

boolean canShoot = true;
float canShootCounter;

//Setup of the program where images are loaded 
void setup() {
  fullScreen();
  player = new Player();
  background = loadImage("wallhaven-42r6gy.jpg");
  background.resize(width, height);
  infoScreen = loadImage("InfoScreen Shoot Em Up Game.jpg");
  infoScreen.resize(width, height);
  gameOverScreen = loadImage("Clean Game Over Screen.jpg");
  gameOverScreen.resize(width, height);
  lifePNG = loadImage("Heart Shoot em up.png");
  lifePNG.resize(width/20, height/15);
  frameRate(60);
}

//Draws the different screens
void draw() {
  if (Screen == 0) {
    StartScreen();
  } else if (Screen == 1) {
    GameScreen();
  } else if (Screen == 2) {
    GameOverScreen();
  }
}

//AKA the Infoscreen with information about movement of the game
void StartScreen() {
  Screen = 0;
  killNum = 0;
  time = 0;
  background(infoScreen);
  //Button to continue to game screen
  rectMode(CENTER);
  fill(255, 255, 255);
  rect(width/2, height/12, 600, 120);
  textSize(35);
  fill(55);
  textAlign(CENTER, BOTTOM);
  text("Press To Continue", width/2, height/10);
  if (mouseX >= width/2-300 && mouseX <= width/2+300 && mouseY >= height/12-60 && mouseY <= height/12+60) {
    if (mousePressed) {
      Screen = 1;
    }
  }
}

//Where the action and slaying monsters happen
void GameScreen() {
  Screen = 1;
  enemyHP = 5;
  background(background);
  e = enemiesA.size();
  player.update();
  playerDeath();
  textSize(35);
  fill(255);
  textAlign(LEFT, BOTTOM);
  text("Score:"+ " " + score, width/99, height/15);
  textSize(40);
  fill(255);
  textAlign(RIGHT, BOTTOM);
  text(life/2 + "   ", width/2, height/13);
  image(lifePNG, width/2.5, height/60);

  for (i = bullets.size() -1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
  }

  if (enemiesA.size() < spawnNum) {
    enemiesA.add(new EnemyA());
    //Enemy enemy = enemies.get(e);
    //enemy.update();
  }

  playerDeath();

  if (life <= 0) {
    GameOverScreen();
  }

  for (int i2 = enemiesA.size()-1; i2>=0; i2--) {
    EnemyA enemyA = enemiesA.get(i2);
    enemyA.update();
    enemyA.enemyMovement();
  }
  
  for (int i3 = enemiesB.size()-1; i3>=0; i3--){
   EnemyB enemyB = enemiesB.get(i3);
   enemyB.update();
   enemyB.enemyMovement();
  }
  
  if (enemiesB.size() < spawnNum + 3){
    enemiesB.add(new EnemyB());
  }

  if (second() != timeS && Screen == 2) {
    time++;
    timeS = second();
  }
  if(killNum >= newWave){
   spawnNum = spawnNum+1;
   newWave = killNum+5;
  }
  
}

//The end screen where the player's stats appear
void GameOverScreen() {
  Screen = 2;
  background(gameOverScreen);
  //Display of Score
  textSize(35);
  fill(255);
  textAlign(LEFT, BOTTOM);
  text("Total Score:"+ " " + score, width/99, height/2);
  text("Enemies Killed:"+ " " + killNum, width/99, height/3);
  //Retry button to contiune playing the game without having to relaunch the game
  rectMode(CENTER);
  fill(255);
  rect(width/2-300, height-100, 200, 50, 7);
  textSize(35);
  fill(55);
  textAlign(CENTER, BOTTOM);
  text("Retry", width/2-300, height-80);
  if (mouseX >= width/2-300-100 && mouseX <= width/2-300+100 && mouseY >= height-100-25 && mouseY <= height-100+25) {
    if (mousePressed) {
      Screen = 1;
      life = 10;
      enemyHP = 0;
      score = 0;
      time = 0;
      killNum = 0;
    }
  }
}

//Checks if Player has been hit by an enemy
void playerDeath() {
  for (EnemyA enemyA : enemiesA) {
    if (playerPos.x >= enemyA.enemyPos.x-25 && playerPos.x <= enemyA.enemyPos.x+25) {
      if (playerPos.y >= enemyA.enemyPos.y-25 && playerPos.y <= enemyA.enemyPos.y+25) {
        life--;
        enemyHP = 0;
        enemyA.enemyHP = 0;
      }
    }
  }
  for (EnemyB enemyB : enemiesB) {
    if (playerPos.x >= enemyB.enemyPos.x-25 && playerPos.x <= enemyB.enemyPos.x+25) {
      if (playerPos.y >= enemyB.enemyPos.y-25 && playerPos.y <= enemyB.enemyPos.y+25) {
        life--;
        enemyHP = 0;
        enemyB.enemyHP2 = 0;
      }
    }
  }
}
