// This is the Title Tab

public class SceneTitle {

  SceneTitle() {
  }

  void update() {
    if (Keyboard.onDown(Keyboard.ENTER)) {
      switchToPlay();
    }
  }

  void draw() {
    background(0);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Dungeon Crawler", width/2, height/2 - 30);
    textSize(12);
    text("Press ENTER to play!", width/2, height/2);
  }
}
