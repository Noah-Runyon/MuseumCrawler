// This is the Enemy1 Tab
class Enemy1 extends Enemy {

  Enemy1() {
    // Set the sprite and size for Enemy1:
    enemyImage = loadImage("enemy_sprites/targeting_enemy_sprites/targeting_enemy_sprite_1.png");
    enemyImage.resize(96, 96);

    speedX = random(100, 200);
    speedY = random(100, 200);
  }

  void update() {
    super.update();
  }
}
