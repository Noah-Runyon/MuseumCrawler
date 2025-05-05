// This is the Instructions Tab

public class SceneInstructions {

  PImage instructions1Image;

  SceneInstructions() {
    // Set the background image and size:
    instructions1Image = loadImage("title_sprites/instructions.png");
    instructions1Image.resize(width, height);
  }

  void update() {
    // Switch to SceneTitle if the right-mouse button is clicked:
    if (rightPressed == true && pRightPressed == false) {
      switchToTitle();
    }

    if (Keyboard.onDown(Keyboard.T)) {
      switchToTitle();
    }
  }

  void draw() {
    background(100);
    fill(45, 178, 45);

    image(instructions1Image, 0, 0); // Set the background image and position

    fill(255);
    rect(500 - 100, 200, 280 + 200, 280 + 200); //X Pos, Y Pos, X Size, Y Size

    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Museum Crawler Instructions", width/2, height/2 - 125);
    textSize(20);
    text("Press 'T' to return to title", width/2, height/2 - 75);
    text("You are infiltrating Oddity Museum", width/2, height/2 - 30);
    text("Defeat enemies to get EXP and Coins", width/2, height/2 + 0);
    text("WSAD for Movement", width/2, height/2 + 30);
    text("Left-Click for Melee Paintbrush Attack", width/2, height/2 + 60);
    text("Right-Click for Ranged Paintball Attack", width/2, height/2 + 90);
    text("Press 'L' to access the level-up menu and get upgrades", width/2, height/2 + 120);
    text("Press 'H' while at the shop to spend Coins", width/2, height/2 + 150);
    text("Press 'M' to access your Oddity Museum Map", width/2, height/2 + 180);
    text("Press 'SPACE BAR' to Dash", width/2, height/2 + 210);
    text("You start with 150 HP, 10 ATTACK, 500 SPEED", width/2, height/2 + 240);
    text("and 1500 DASH", width/2, height/2 + 270);
  }
}
