// This is the Level Up Menu Tab

public class SceneLevelUpMenu {

  PImage attackUpImage;
  PImage healthUpImage;
  PImage speedUpImage;

  SceneLevelUpMenu() {
    // Attack Up:
    attackUpImage = loadImage("level_up_sprites/attack_up/attack_up.png");
    attackUpImage.resize(100, 100);

    // Health Up:
    healthUpImage = loadImage("level_up_sprites/health_up/health_up.png");
    healthUpImage.resize(100, 100);

    // Speed Up:
    speedUpImage = loadImage("level_up_sprites/speed_up/speed_up.png");
    speedUpImage.resize(100, 100);
  }

  void update() {
  }

  void draw() {

    fill(100, 150, 50); // Light Green
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);

    // Set Health Up image position:
    image(healthUpImage, width/3.7, height/2 - 150);
    // Set Attack Up image position:
    image(attackUpImage, width/3.7, height/2 - 0);
    // Set Speed Up image position:
    image(speedUpImage, width/3.7, height/2 + 150);

    // Level Up Menu:
    textSize(50);
    text("Level Up Menu", width/2, height/2 - 300);
    // Level Up Points:
    textSize(35);
    text("Level Up Points: " + scenePlay.player.exp.levelUpSpendPoints, width/2, height/2 - 225);
    // L to return:
    textSize(25);
    text("Press L to return to the game", width/2, height/2 - 175);
    // Level HP:
    textSize(25);
    text("Increase HP by 50 ('I')", width/2, height/2 - 100);
    text("Current HP: " + (int(scenePlay.player.currentHealth)) + " of " + (int(scenePlay.player.maxHealth)), width/2, height/2 - 50);
    // Level ATTACK:
    textSize(25);
    text("Increase ATTACK by 10 ('O')", width/2, height/2 + 50);
    text("Current Damage: " + (int(scenePlay.player.playerDamage)), width/2, height/2 + 100);
    // Level SPEED:
    textSize(25);
    text("Increase SPEED by 100('P')", width/2, height/2 + 200);
    text("Current Speed: " + (int(scenePlay.player.playerSpeedX)), width/2, height/2 + 250);
    //}
  }
}
