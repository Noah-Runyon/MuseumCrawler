// This is the Title Tab

public class SceneTitle {
  
  PImage title1Image;

  SceneTitle() {
    // Set the background image and size:
    title1Image = loadImage("title_sprites/title_1.png");
    title1Image.resize(width, height);
  }

  void update() {
    if (Keyboard.onDown(Keyboard.ENTER)) {
      switchToPlay();
    }
  }

  void draw() {
    background(0);
    fill(255);
    
    image(title1Image, 0, 0); // Set the background image and position
    
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Dungeon Crawler", width/2, height/2 - 30);
    textSize(12);
    text("Press ENTER to play!", width/2, height/2);
  }
}
