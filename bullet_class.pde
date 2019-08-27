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
