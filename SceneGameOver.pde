// This is the Game Over Tab

public class SceneGameOver {

  SceneGameOver() {
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
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2 - 30);
    textSize(12);
    text("Press ENTER to return to title", width/2, height/2);
  }
}
