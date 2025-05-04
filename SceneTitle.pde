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

    // Switch to SceneInstructions if the right-mouse button is clicked:
    //if (rightPressed == true && pRightPressed == false) {
    // switchToInstructions();
    //}

    if (Keyboard.onDown(Keyboard.I)) {
      switchToInstructions();
    }
  }

  void draw() {
    background(0);

    image(title1Image, 0, 0); // Set the background image and position

    fill(255);
    rect(500 - 100, 200, 280 + 200, 280); //X Pos, Y Pos, X Size, Y Size

    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Dungeon Crawler", width/2, height/2 - 50);
    textSize(20);
    text("Press ENTER to play!", width/2, height/2);
    text("Press I for Instructions", width/2, height/2 + 30);
  }
}
