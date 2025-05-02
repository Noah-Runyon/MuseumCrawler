// This is the Instructions Tab

public class SceneInstructions {
  
  PImage instructions1Image;

  SceneInstructions() {
    // Set the background image and size:
    instructions1Image = loadImage("title_sprites/instructions_1.png");
    instructions1Image.resize(width, height);
  }

  void update() {
  }

  void draw() {
    background(100);
    fill(45, 178, 45);
    
    image(instructions1Image, 0, 0); // Set the background image and position
  }
}
