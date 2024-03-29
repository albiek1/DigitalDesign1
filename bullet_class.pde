//Class for Bullet with all attributes as well as the remove bullet when it either hits an enemy or goes out of bounds
class Bullet {
  float rotation;
  PVector bulletPos;
  Bullet() {
    bulletPos = new PVector(playerPos.x, playerPos.y);
    rotation = atan2(mouseY - playerPos.y, mouseX - playerPos.x)/PI*180;
  }
  void update() {
    bulletPos.x = bulletPos.x + cos(rotation/180*PI)*bSpd;
    bulletPos.y = bulletPos.y + sin(rotation/180*PI)*bSpd;
    fill(255, 255, 255);
    ellipse(bulletPos.x, bulletPos.y, 10, 10);
    if (bulletPos.x > 0 || bulletPos.x < width || bulletPos.y > 0 || bulletPos.y < height) {
    } else {
      bullets.remove(this);
    }

    for (EnemyA e : enemiesA) {
      if (bulletPos.x >= e.enemyPos.x-25 && bulletPos.x <= e.enemyPos.x+25) {
        if (bulletPos.y >= e.enemyPos.y-25 && bulletPos.y <= e.enemyPos.y+25) {
          e.enemyHP -= 1;
          bullets.remove(this);
        }
      }
    }
   for (EnemyB e2 : enemiesB){
     if (bulletPos.x >= e2.enemyPos.x-25 && bulletPos.x <= e2.enemyPos.x+25) {
       if (bulletPos.y >= e2.enemyPos.y-25 && bulletPos.y <= e2.enemyPos.y+25) {
         e2.enemyHP2 -= 1;
         bullets.remove(this);
    }
   }
   }
  }
}
