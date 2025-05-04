// This is the Enemy3 Tab (Old-Timey Photograph)
class Enemy3 extends Enemy {

  Enemy3() {
    // Set the sprite and size for Enemy1:
    enemyImage = loadImage("enemy_sprites/old_timey_enemy_sprites/old_timey_enemy_1.png");
    enemyImage.resize(96, 96);

    speedX = random(50, 300); // Default: 100, 200
    speedY = random(50, 300); // Default: 100, 200
  } 

  void update() {
    super.update();
  }
}
