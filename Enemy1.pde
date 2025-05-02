// This is the Enemy1 Tab
class Enemy1 extends Enemy {

  Enemy1() {
    // Set the sprite and size for Enemy1:
    enemyImage = loadImage("enemy_sprites/gingerbread_enemy_with_knife_sprites/gingerbread_man_with_knife_1.png");
    enemyImage.resize(96, 96);

    speedX = random(100, 200);
    speedY = random(100, 200);
  }

  void update() {
    super.update();
  }
}
