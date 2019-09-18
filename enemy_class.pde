class Enemy{
  PVector enemyPos;
  float rotation;
  float eSpd = 2;
  PVector enemyVel;
  PVector enemyAcc;
  Enemy(){
    spawnBox = int(random(1, 4));
    if(spawnBox == 1){
     enemyPos = new PVector(random(0, 300), random(0, height-200));
    }
    else if(spawnBox == 2){
     enemyPos = new PVector(random(0, width -300), random(height-200, height));
    }
    else if(spawnBox == 3){
     enemyPos = new PVector(random(width-300, width), random(200, height)); 
    }
    else if(spawnBox == 4){
     enemyPos = new PVector(random(300, width), random(0, 200)); 
    }
    eSpd = 2;
  }
  void update(){
    pushMatrix();
    translate(enemyPos.x, enemyPos.y);
    rotate(atan2(playerPos.y - enemyPos.y, playerPos.x - enemyPos.x));
    rectMode(RADIUS);
    fill(255, 0, 0);
    rect(0, 0, 25, 25);
    popMatrix();
    
    enemyPos.x = constrain(enemyPos.x, 0, width);
    enemyPos.y = constrain(enemyPos.y, 0, height);
  }
  void enemyMovement(){
    PVector enemyVel = PVector.sub(playerPos, enemyPos);
    enemyVel.setMag(3.0);
    enemyPos.add(enemyVel);
  }
  
}
