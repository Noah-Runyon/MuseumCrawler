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
    //if (Keyboard.onDown(Keyboard.L)) {
    //switchToPlay();
    //sceneLevelUpMenu = null;
    //println("Leaving Level Up");
    //}
    //if (Keyboard.onDown(Keyboard.I)) {
    //  println("Leveling HP");
    //}
    //if (Keyboard.onDown(Keyboard.O)) {
    //  println("Leveling ATTACK");
    //}
    //if (Keyboard.onDown(Keyboard.P)) {
    //  println("Leveling SPEED");
    //}
  }

  void draw() {
    //fill(#E06C1D);
    //ellipse(100, 100, 100, 100);
    //background(0);
    //if (sceneLevelUpMenu != null) {

    fill(100, 150, 50); // Light Green
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);

    // Set Health Up image position:
    image(healthUpImage, width/3, height/2 - 50);
    // Set Attack Up image position:
    image(attackUpImage, width/3, height/2 + 50);
    // Set Speed Up image position:
    image(speedUpImage, width/3, height/2 + 150);

    // Level Up Menu:
    textSize(50);
    text("Level Up Menu", width/2, height/2 - 300);
    // Level Up Points:
    textSize(35);
    //text("Level Up Points: " + player.exp.levelUpSpendPoints, width/2, height/2 - 200);
    // L to return:
    textSize(25);
    text("Press L to return to the game", width/2, height/2 - 100);
    // Level HP:
    textSize(25);
    text("Increase HP (I)", width/2, height/2 - 0);
    // Level ATTACK:
    textSize(25);
    text("Increase ATTACK (O)", width/2, height/2 + 100);
    // Level SPEED:
    textSize(25);
    text("Increase SPEED (P)", width/2, height/2 + 200);
    //}
  }
}
