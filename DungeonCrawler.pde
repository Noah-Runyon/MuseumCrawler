// This is the Main Tab
// DAGD 255 Dungeon Crawler Assignment
// Ferris State University
// Noah Runyon
// Finished 5/4/25

// Music by me, from my game Dusk Runner
// This game is called Museum Crawler, and is called Dungeon Crawler in the game files

import processing.sound.*;
SoundFile scenePlayMusic;
SoundFile playerDamaged;
SoundFile paintballFired;
SoundFile enemyDefeated;
SoundFile expCoinPickup;

float dt; // Delta Time
float prevTime = 0;
float startTime = 0;
Player player;

int playerScore = 0;
float totalGameTime = 0;

boolean keyEnter = false;

float zoomValue = 1;
float zoom;

boolean leftPressed, pLeftPressed, rightPressed, pRightPressed;

SceneTitle sceneTitle;
SceneInstructions sceneInstructions;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;
SceneLevelUpMenu sceneLevelUpMenu;
SceneShopMenu sceneShopMenu;
SceneMap sceneMap;

float enemySpawnDelay = 1;

void setup() {
  size(1280, 720); // 1000, 800 default

  scenePlayMusic = new SoundFile(this, "data/music_tracks/duskRunner-main-theme.wav");
  playerDamaged = new SoundFile(this, "data/sound_effects/aow.mp3");
  paintballFired = new SoundFile(this, "data/sound_effects/swish.mp3");
  enemyDefeated = new SoundFile(this, "data/sound_effects/explosion.mp3");
  expCoinPickup = new SoundFile(this, "data/sound_effects/powerup.mp3");

  switchToTitle(); // Switch to ScenePlay at the start
}

void draw() {
  calcDeltaTime();
  background(255);

  // Title:
  if (sceneTitle != null) {
    sceneTitle.update();
    if (sceneTitle != null) sceneTitle.draw();
  }

  // Instructions:
  if (sceneInstructions != null) {
    sceneInstructions.update();
    if (sceneInstructions != null) sceneInstructions.draw();
  }

  // Play:
  if (scenePlay != null) {
    scenePlay.update();
    if (scenePlay != null) scenePlay.draw();
  }
  // GameOver:
  if (sceneGameOver != null) {
    sceneGameOver.update();
    if (sceneGameOver != null) sceneGameOver.draw();
  }

  //Level Up Menu:
  if (sceneLevelUpMenu != null) {
    sceneLevelUpMenu.update();
    if (sceneLevelUpMenu != null) sceneLevelUpMenu.draw();
  }

  //Shop Menu:
  if (sceneShopMenu != null) {
    sceneShopMenu.update();
    if (sceneShopMenu != null) sceneShopMenu.draw();
  }

  if (sceneMap != null) {
    sceneMap.update();
    if (sceneMap != null) sceneMap.draw();
  }

  // Prep for next frame after this line:

  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  //println(mouseButton);
  Mouse.handleKeyDown(mouseButton);
}

void mouseReleased() {
  Mouse.handleKeyUp(mouseButton);
  // Mouse.update();
}

// Switch to Title:
void switchToTitle() {
  sceneTitle = new SceneTitle();
  sceneInstructions = null;
  scenePlay = null;
  sceneGameOver = null;
  sceneLevelUpMenu = null;
  sceneShopMenu = null;
  sceneMap = null;
}

// Switch to Instructions:
void switchToInstructions() {
  sceneTitle = null;
  sceneInstructions = new SceneInstructions();
  scenePlay = null;
  sceneGameOver = null;
  sceneLevelUpMenu = null;
  sceneShopMenu = null;
  sceneMap = null;
}

// Switch to Play:
void switchToPlay() {
  sceneTitle = null;
  sceneInstructions = null;
  scenePlay = new ScenePlay();
  sceneGameOver = null;
  sceneLevelUpMenu = null;
  sceneShopMenu = null;
  sceneMap = null;
  scenePlayMusic.loop();
  scenePlayMusic.amp(0.25);
}

// Switch to GameOver:
void switchToGameOver() {
  scenePlayMusic.stop();
  sceneTitle = null;
  sceneInstructions = null;
  scenePlay = null;
  sceneGameOver = new SceneGameOver();
  sceneLevelUpMenu = null;
  sceneShopMenu = null;
  sceneMap = null;
}

// Switch to Level Up:
void switchToLevelUpMenu() {
  sceneTitle = null;
  sceneInstructions = null;
  //scenePlay = ScenePlay();
  sceneGameOver = null;
  sceneLevelUpMenu = new SceneLevelUpMenu();
  sceneShopMenu = null;
  sceneMap = null;
}

// Switch to Shop:
void switchToShopMenu() {
  sceneTitle = null;
  sceneInstructions = null;
  //scenePlay = ScenePlay();
  sceneGameOver = null;
  sceneLevelUpMenu = null;
  sceneShopMenu = new SceneShopMenu();
  sceneMap = null;
}

// Switch to Map:
void switchToMap() {
  sceneTitle = null;
  sceneInstructions = null;
  //scenePlay = ScenePlay();
  sceneGameOver = null;
  sceneLevelUpMenu = null;
  sceneShopMenu = null;
  sceneMap = new SceneMap();
}

// ZOOM effect:
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoomValue += e * -0.1; // How much the camera zooms by
  zoomValue = constrain(zoomValue, 0.5, 2);
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
