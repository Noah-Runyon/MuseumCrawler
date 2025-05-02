// This is the Enemy2 Tab
class Enemy2 extends Enemy {

  Enemy2() {
    // Set the sprite and size for Enemy1:
    enemyImage = loadImage("enemy_sprites/abstract_enemy_sprites/abstract_enemy_1.png");
    enemyImage.resize(96, 96);

    speedX = random(100, 200);
    speedY = random(100, 200);
  }

  void update() {
    super.update();
  }
}
