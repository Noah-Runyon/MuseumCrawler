// This is the Enemy3 Tab
class Enemy3 extends Enemy {

  Enemy3() {
    // Set the sprite and size for Enemy1:
    enemyImage = loadImage("enemy_sprites/old_timey_enemy_sprites/old_timey_enemy_1.png");
    enemyImage.resize(96, 96);

    speedX = random(100, 200);
    speedY = random(100, 200);
  }

  void update() {
    super.update();
  }
}
