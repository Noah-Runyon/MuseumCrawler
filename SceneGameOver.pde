// This is the Game Over Tab

public class SceneGameOver {
  
  PImage gameover1Image;

  SceneGameOver() {
    // Get the GameOver background image and size:
    gameover1Image = loadImage("title_sprites/game_over_1.png");
    gameover1Image.resize(width, height);
  }

  void update() {
    //if(Keyboard.onDown(Mouse.LEFT)) {
    // switchToTitle();
    //}
    if (Keyboard.onDown(Keyboard.ENTER)) {
      switchToPlay();
    }
  }

  void draw() {
    background(0);
    
    image(gameover1Image, 0, 0); // Set the background image and image position
    
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2 - 30);
    textSize(12);
    text("Press ENTER to return to title", width/2, height/2);
  }
}
