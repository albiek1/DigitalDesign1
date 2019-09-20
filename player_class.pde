class Player {

  Player() {
    playerPos.x = width/2;
    playerPos.y = height/2;
  }
  void update() {
    if (mousePressed == true) {
      if (canShoot == true) {
        bullets.add(new Bullet());
        canShoot = false;
        canShootCounter = 0;
      }
    }
    if (canShoot == false) {
      canShootCounter ++;
      if (canShootCounter == 5) {
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

void keyPressed() {
  final int k = keyCode;

  if      (k == LEFT  | k == 'A') playerVel.x = -playerSpd;
  else if (k == RIGHT | k == 'D') playerVel.x =  playerSpd;
  else if (k == UP    | k == 'W') playerVel.y = -playerSpd;
  else if (k == DOWN  | k == 'S') playerVel.y =  playerSpd;
}

void keyReleased() {
  final int k = keyCode;

  if      ( k == LEFT  | k == 'A' && playerVel.x < 0
    || k == RIGHT | k == 'D' && playerVel.x > 0)
    playerVel.x = 0;

  else if ( k == UP   | k == 'W' && playerVel.y < 0
    || k == DOWN | k == 'S' && playerVel.y > 0)
    playerVel.y = 0;
}
