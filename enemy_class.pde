//Class for everything related to Enemies such as look, spawn and attributes 
class EnemyA {
  PVector enemyPos, bulletPos;
  float rotation;
  PVector enemyVel;
  PVector enemyAcc;
  int enemyHP = 5;
  EnemyA() {
    spawnBox = int(random(1, 4));
    if (spawnBox == 1) {
      enemyPos = new PVector(random(0, 300), random(0, height-200));
    } else if (spawnBox == 2) {
      enemyPos = new PVector(random(0, width -300), random(height-200, height));
    } else if (spawnBox == 3) {
      enemyPos = new PVector(random(width-300, width), random(200, height));
    } else if (spawnBox == 4) {
      enemyPos = new PVector(random(300, width), random(0, 200));
    }
    enemyHP = 5;
  }

  void update() {
    pushMatrix();
    translate(enemyPos.x, enemyPos.y);
    rotate(atan2(playerPos.y - enemyPos.y, playerPos.x - enemyPos.x));
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(0, 0, 50, 50);
    popMatrix();

    rectMode(CENTER);
    fill(255);
    rect(enemyPos.x, enemyPos.y, 25, 25);

    enemyPos.x = constrain(enemyPos.x, 0, width);
    enemyPos.y = constrain(enemyPos.y, 0, height);

    if (enemyHP <= 0) {
      score += 100;
      enemyHP = 5;
      killNum++;
      enemiesA.remove(this);
    }
  }

  void enemyMovement() {
    PVector enemyVel = PVector.sub(playerPos, enemyPos);
    enemyVel.setMag(2.5);
    enemyPos.add(enemyVel);
  }
}

class EnemyB{
 PVector enemyPos, enemyVel;
 float newAngle;
 int enemyHP2 = 5;
  EnemyB(){
    spawnBox = int(random(1, 4));
    if (spawnBox == 1) {
      enemyPos = new PVector(random(50, 300), random(50, height-200));
    } else if (spawnBox == 2) {
      enemyPos = new PVector(random(50, width -300), random(height-200, height-50));
    } else if (spawnBox == 3) {
      enemyPos = new PVector(random(width-300, width), random(200, height-50));
    } else if (spawnBox == 4) {
      enemyPos = new PVector(random(300, width-50), random(50, 200));
    }
    enemyVel = PVector.random2D();
    enemyHP2 = 5;
  }
  
  void update(){
   pushMatrix();
   translate(enemyPos.x, enemyPos.y);
   rotate(enemyVel.heading());
   fill(0, 255, 0);
   triangle(10, 0, -20, -30, -20, 30);
   popMatrix();
   
   if(enemyPos.y+30 > height){
     enemyVel.y *= -1;
   }
   if(enemyPos.y-30 < 0){
     enemyVel.y *= -1;
   }
   if(enemyPos.x+30 > width){
    enemyVel.x *= -1; 
   }
   if(enemyPos.x-30 < 0){
    enemyVel.x *= -1;
   }
    if (enemyHP2 <= 0) {
      score += 100;
      enemyHP = 5;
      killNum++;
      enemiesB.remove(this);
    }
  }
  
  void enemyMovement(){
    enemyVel.setMag(4);
    enemyPos.add(enemyVel);
  }
  
}
