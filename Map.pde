// This is the Map Tab

public class SceneMap {

  PImage mapImage;

  SceneMap() {
    // Attack Up:
    mapImage = loadImage("other_sprites/map.png");
    mapImage.resize(540, 540);
  }

  void update() {
  }

  void draw() {

    fill(100, 150, 50); // Light Green
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);

    // Set Map image position:
    image(mapImage, width/2 - 270, height/2 - 270);

    // Level Up Menu:
    textSize(50);
    text("Map Menu", width/2, height/2 - 310);
    // L to return:
    textSize(25);
    text("Press M to return to the game", width/2, height/2 + 310);
  }
}
