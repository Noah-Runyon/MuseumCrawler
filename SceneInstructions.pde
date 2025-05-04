// This is the Instructions Tab

public class SceneInstructions {

  PImage instructions1Image;

  SceneInstructions() {
    // Set the background image and size:
    instructions1Image = loadImage("title_sprites/instructions_1.png");
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
    text("Dungeon Crawler Instructions", width/2, height/2 - 50);
    textSize(20);
    text("Press T to return to title", width/2, height/2);
  }
}
