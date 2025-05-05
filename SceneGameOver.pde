// This is the Game Over Tab

public class SceneGameOver {

  PImage gameover1Image;

  SceneGameOver() {
    // Get the GameOver background image and size:
    gameover1Image = loadImage("title_sprites/game_over.png");
    gameover1Image.resize(width, height);
  }

  void update() {
    if (Keyboard.onDown(Keyboard.T)) {
      switchToTitle();
    }
  }

  void draw() {
    background(0);

    image(gameover1Image, 0, 0); // Set the background image and image position

    fill(255);
    rect(500 - 100, 200, 280 + 200, 280); //X Pos, Y Pos, X Size, Y Size

    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2 - 50);
    textSize(20);
    text("Press 'T' to return to Title", width/2, height/2);
  }
}
