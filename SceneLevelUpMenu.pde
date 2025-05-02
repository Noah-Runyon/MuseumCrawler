// This is the Level Up Menu Tab

public class SceneLevelUpMenu {

  SceneLevelUpMenu() {
  }

  void update() {
    //if (Keyboard.onDown(Keyboard.L)) {
    //switchToPlay();
    //sceneLevelUpMenu = null;
    //println("Leaving Level Up");
    //}
    //if (Keyboard.onDown(Keyboard.I)) {
    //  println("Leveling HP");
    //}
    //if (Keyboard.onDown(Keyboard.O)) {
    //  println("Leveling ATTACK");
    //}
    //if (Keyboard.onDown(Keyboard.P)) {
    //  println("Leveling SPEED");
    //}
  }

  void draw() {
    //fill(#E06C1D);
    //ellipse(100, 100, 100, 100);
    //background(0);
    //if (sceneLevelUpMenu != null) {
    fill(255);
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);
    // Level Up Menu:
    textSize(50);
    text("Level Up Menu", width/2, height/2 - 300);
    // L to return:
    textSize(25);
    text("Press L to return to the game", width/2, height/2 - 200);
    // Level HP:
    textSize(25);
    text("Increase HP (I)", width/2, height/2 - 150);
    // Level ATTACK:
    textSize(25);
    text("Increase ATTACK (O)", width/2, height/2 - 100);
    // Level SPEED:
    textSize(25);
    text("Increase SPEED (P)", width/2, height/2 - 50);
    //}
  }
}
