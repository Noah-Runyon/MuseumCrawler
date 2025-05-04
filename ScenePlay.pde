// This is the Play Tab

public class ScenePlay {

  Camera camera;
  Player player;
  ExperienceSystem exs;
  float prevGameTime = 0;
  float elapsedGameTime = 0;

  int score = 0;

  boolean wallsMade = false;

  boolean starterEnemies = false; // Determine if the initial group of enemies spawns or not

  boolean gameEnemies = true;

  // ArrayLists:
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<MeleeSwing> meleeSwings = new ArrayList();
  ArrayList<ExpPoint> expPoints = new ArrayList();
  ArrayList<Coins> coins = new ArrayList();
  ArrayList<TileBG> tiles = new ArrayList();
  ArrayList<Wall> walls = new ArrayList();
  ArrayList<Particle> particles = new ArrayList();

  // Enemies:
  ArrayList<Enemy> enemy = new ArrayList();

  PImage sarahImage; // Sarah Image
  PImage carImage;

  ScenePlay() {
    player = new Player(width/2, height/2);
    camera = new Camera(player);
    exs = new ExperienceSystem();

    // Sarah Image:
    sarahImage = loadImage("shop_sprites/sarah_sprite_1.png"); // Set Sarah image
    sarahImage.resize(100, 100); // Sarah image size

    // Ford Model A (car) Image:
    carImage = loadImage("other_sprites/ford_model_a.png"); // Set Car image
    carImage.resize(400, 400); // Car image size

    //for(int i = 0; i < 5; i++) {
    //   for(int j = 0; j < 5, j++) {
    //    TileBG tile = new TileBG(j * bgWidth, i * bgHeight);
    //    tiles.add(tile);
    //   }
    //}

    // Add STARTING enemies:
    if (starterEnemies == true) {
      for (int i = 0; i < 10; i++) {
        Enemy e = new Enemy();
        enemies.add(e);
      }
    }
  }

  // Calculate the game's time:
  void calcGameTime() {
    float currGameTime = (millis() - startTime) / 1000.0; // Gets and stores the current time stamp
    dt = currGameTime - prevGameTime; // Calculate Delta Time
    prevGameTime = currGameTime; // Setup prevTime to be equal to the current time for next frame.
    elapsedGameTime = currGameTime;
  }

  void update() {
    // Update


    // UPDATE BLOCK

    camera.update(); // Update the camera

    //for(int i = 0; i < tiles.size9); i++) {
    // tiles.get(i).draw();
    //}

    if (wallsMade == false) { // Make it so the walls are only made once

      //makeWall(200, 200, 100, 100); // Position X, Position Y, Width, Height

      // WALLS {
      //float wallGroup = (random(0, 0));
      float wallGroup = 1;

      //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height

      //float yPosGroup1 = random(595, height - 595); // Original
      //float yPosGroup1;

      // 1,5
      if (wallGroup <= 1) {
        float wallGroup1X = -2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 2,5
      if (wallGroup <= 1) {
        float wallGroup1X = -1250; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // START ROOM 3,5
      if (wallGroup <= 1) {
        float wallGroup1X = 0; // X Location, default 1
        float wallGroup1Y = -750; // Y Location, default 1
        float wallGroup1Scale1 = 500; // Y
        float wallGroup1Scale2 = 50; // Wall Thickness
        float wallGroup1Scale3 = 1225; // X
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //float xPosition = 1;
        //float yPosition = 1;
        //makeWall(width + 150, yPos, random(200, 200), 50); // Default: makeWall(width + 150, yPos, random(200, 300), 50);
        //makeWall(0, 0, 200, 50); // X, Y, width, height
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical

        scenePlay.wallsMade = true; // Set it so the walls aren't made again
      }

      // Gift Shop 3,5
      if (wallGroup <= 1) {
        float wallGroup1X = 312.5; // X Location
        float wallGroup1Y = -437.5; // Y Location // Default 312.5
        float wallGroup1Scale1 = 250;
        float wallGroup1Scale2 = 25;
        float wallGroup1Scale3 = 612.5;
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical

        makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height

        scenePlay.wallsMade = true; // Set it so the walls aren't made again
      }

      // 4,5
      if (wallGroup <= 1) {
        float wallGroup1X = 1250; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal // 2.5 for center and width for full wall
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 5,5
      if (wallGroup <= 1) {
        float wallGroup1X = 2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical FULL
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 5,4
      if (wallGroup <= 1) {
        float wallGroup1X = 2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -2000; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 5,3
      if (wallGroup <= 1) {
        float wallGroup1X = 2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -3250; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical FULL
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 5,2
      if (wallGroup <= 1) {
        float wallGroup1X = 2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -4500; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 5,1
      if (wallGroup <= 1) {
        float wallGroup1X = 2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -5750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 4,1
      if (wallGroup <= 1) {
        float wallGroup1X = 1250; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -5750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal // 2.5 for center and width for full wall
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 3,1
      if (wallGroup <= 1) {
        float wallGroup1X = 0; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -5750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal // 2.5 for center and width for full wall
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 2,1
      if (wallGroup <= 1) {
        float wallGroup1X = -1250; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -5750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal // 2.5 for center and width for full wall
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 1,1
      if (wallGroup <= 1) {
        float wallGroup1X = -2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -5750; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 1,2
      if (wallGroup <= 1) {
        float wallGroup1X = -2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -4500; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical FULL
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 1,3
      if (wallGroup <= 1) {
        float wallGroup1X = -2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -3250; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical FULL
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 1,4
      if (wallGroup <= 1) {
        float wallGroup1X = -2500; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -2000; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical
        // Top Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical FULL
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // PAINTING ROOMS:

      // 3,0 TOP MIDDLE
      if (wallGroup <= 1) {
        float wallGroup1X = 0; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -7000; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        //makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 0,2 UPPER LEFT
      if (wallGroup <= 1) {
        float wallGroup1X = -3750; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -4500; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 ); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 0,4 LOWER LEFT
      if (wallGroup <= 1) {
        float wallGroup1X = -3750; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -2000; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 ); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        //makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 6,4 LOWER RIGHT
      if (wallGroup <= 1) {
        float wallGroup1X = 3750; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -2000; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2  * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // 6,2 UPPER RIGHT
      if (wallGroup <= 1) {
        float wallGroup1X = 3750; // X Location // Greatest X distance + wall thickness
        float wallGroup1Y = -4500; // Y Location
        float wallGroup1Scale1 = 500;
        float wallGroup1Scale2 = 50;
        float wallGroup1Scale3 = 1225;
        float wallGroupFullWallScaleMultiplier = 2.5; // wallGroupFullWallScaleMultiplier // 2.5 position and multiply for center full wall
        //makeWall(440, -300, 240, 25); // Position X, Position Y, Width, Height
        // Top Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Top-Left Horizontal FULL
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1/2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Top-Left Vertical FULL
        // Top Right:
        //makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale2/2 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Top-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1/2  * wallGroupFullWallScaleMultiplier + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier); // Top-Right Vertical
        // Bottom Left:
        makeWall(wallGroup1Scale1/2 * wallGroupFullWallScaleMultiplier + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1 * wallGroupFullWallScaleMultiplier, wallGroup1Scale2); // Bottom-Left Horizontal
        makeWall(wallGroup1Scale2/2 + wallGroup1X, wallGroup1Scale1*2 + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Left Vertical
        // Bottom Right:
        makeWall(wallGroup1Scale1*2  + wallGroup1X, wallGroup1Scale3 + wallGroup1Y, wallGroup1Scale1, wallGroup1Scale2); // Bottom-Right Horizontal
        makeWall(wallGroup1Scale3 + wallGroup1X, wallGroup1Scale1*2  + wallGroup1Y, wallGroup1Scale2, wallGroup1Scale1); // Bottom-Right Vertical
      }

      // OUTSIDE ROAD
      if (wallGroup <= 1) {
        makeWall(-2500 + 25, 500 + 625, 50, 1250); // X Pos, Y Pos, Width, Height // LEFT WALL
        makeWall(3725, 500 + 625, 50, 1250); // X Pos, Y Pos, Width, Height // RIGHT WALL
        makeWall(625, 1750, 6250, 50); // X Pos, Y Pos, Width, Height // BOTTOM WALL
      }
    } // wallsMade


    // UPDATES:
    for (int i = 0; i < walls.size(); i++) {
      Wall w = walls.get(i);
      w.update();

      // Check for overlap with the player
      if (w.checkOverlap(player)) {
        player.applyFix(player.findOverlapFix(w));
      }

      // Check for overlap with enemy
      //if (w.checkOverlap(enemy)) {
      //  enemy.applyFix(enemy.findOverlapFix(w));
      //}

      //for (int j = 0; j < enemies.size(); j++) {
      //  Enemy e = enemies.get(j);
      //  w.update();
      //  if (w.checkOverlap(enemy)) {
      //    enemy.applyFix(enemy.findOverlapFix(w));
      //  }
      //}
    }
    // } End Walls

    // Update enemies:
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.update();

      // Check enemy overlap with the player:
      if (e.checkOverlap(player)) { // Check if overlapping with the player
        player.applyFix(player.findOverlapFix(e)); // Set collision
        //player.currentHealth -= 1; // Set it so the player takes damage
        //playerDamaged.play();
      }

      // Check enemy overlap with the walls:
      for (int w = 0; w < walls.size(); w++) {
        Wall wall = walls.get(w);
        if (e.checkOverlap(wall)) { // Check if overlapping with the player
          e.applyFix(e.findOverlapFix(wall)); // Set collision
        }
      }

      // Check Enemy collision with Walls:
      //for (int j = 0; j < walls.size(); j++) {
      //  Wall w = walls.get(j);

      //  if (w.checkOverlap(e)) { // Check overlap with bullets and enemies
      //    //e.currentHealth -= 20; // Remove enemy HP
      //    //e.isDead = true; // Set bullets to be dead
      //    //enemy.applyFix(enemy.findOverlapFix(w));
      //    //player.applyFix(player.findOverlapFix(e));
      //    //if (w.checkOverlap(player)) {
      //    //  player.applyFix(player.findOverlapFix(w));
      //    //}
      //  }
      //}


      if (e.isDead) enemies.remove(e); // Remove dead enemies
    }

    // Update EXP Points:
    for (int i = 0; i < expPoints.size(); i++) {
      ExpPoint e = expPoints.get(i);
      e.update();

      if (e.checkOverlap(player)) { // Check if overlapping with the player
        player.exp.expPool += e.expAmount;
        e.isDead = true; // If overlapping with the player, set isDead to true
        expCoinPickup.play();
      }

      if (e.isDead) expPoints.remove(e); // Remove dead EXP points
    }

    // Update Coins:
    for (int i = 0; i < coins.size(); i++) {
      Coins c = coins.get(i);
      c.update();

      if (c.checkOverlap(player)) { // Check if overlapping with the player
        player.coin.coinsPool += c.coinsAmount;
        c.isDead = true; // If overlapping with the player, set isDead to true
        expCoinPickup.play();
      }

      if (c.isDead) coins.remove(c); // Remove dead coins
    }

    // Update BULLETS:
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();

      // Check Bullet collision with Enemies
      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);

        if (e.checkOverlap(b)) { // Check overlap with bullets and enemies
          e.currentHealth -= player.playerDamage; // Remove enemy HP // Default 20
          b.isDead = true; // Set bullets to be dead
        }
      }

      // Check Bullet collision with Walls:
      for (int j = 0; j < walls.size(); j++) {
        Wall w = walls.get(j);

        if (w.checkOverlap(b)) { // Check overlap with bullets and enemies
          //e.currentHealth -= 20; // Remove enemy HP
          b.isDead = true; // Set bullets to be dead
        }
      }
      if (b.isDead) bullets.remove(b); // Remove dead bullets
    }

    // Update MeleeSwings:
    for (int i = 0; i < meleeSwings.size(); i++) {
      MeleeSwing m = meleeSwings.get(i);
      m.update();

      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);

        if (e.checkOverlap(m)) {
          e.currentHealth -= player.playerDamage; // Default 20
          m.isDead = true;
        }
      }
      if (m.isDead) meleeSwings.remove(m);
    }

    // Update Enemies:
    if (gameEnemies == true) {
      enemySpawnDelay -= dt;
      if (enemySpawnDelay <= 0) {
        int random = (int)random(1, 4);
        if (random == 1) {
          Enemy e = new Enemy1();
          enemies.add(e);
          //println("Enemy1");
        }
        if (random == 2) {
          Enemy e = new Enemy2();
          enemies.add(e);
          //println("Enemy2");
        }
        if (random == 3) {
          Enemy e = new Enemy3();
          enemies.add(e);
          //println("Enemy3");
        }
        enemySpawnDelay = (int)random(1, 2); // Default: 4, 5
      }
    }

    // PARTICLES:
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update(dt);
      if (p.isDead) particles.remove(p);
    }

    player.update(); // Update the player

    // QUIT the Game
    if (Keyboard.onDown(Keyboard.K)) {
      switchToGameOver();
    }

    // Activate SceneLevelUpMenu:
    if (Keyboard.onDown(Keyboard.L) && sceneLevelUpMenu == null) {
      switchToLevelUpMenu();
      println("Entering Level Up Menu");
    }
    // Deactivate SceneLevelUpMenu:
    else if (Keyboard.onDown(Keyboard.L) && sceneLevelUpMenu != null) {
      sceneLevelUpMenu = null;
      println("Exiting Level Up Menu");
    }

    // Activate SceneShopMenu:
    if (Keyboard.onDown(Keyboard.H) && sceneShopMenu == null) {
      switchToShopMenu();
      println("Entering Level Up Menu");
    }
    // Deactivate SceneShopMenu:
    else if (Keyboard.onDown(Keyboard.H) && sceneShopMenu != null) {
      sceneShopMenu = null;
      println("Exiting Level Up Menu");
    }

    // Activate SceneMap:
    if (Keyboard.onDown(Keyboard.M) && sceneMap == null) {
      switchToMap();
      println("Entering Map Menu");
    }
    // Deactivate SceneMap:
    else if (Keyboard.onDown(Keyboard.M) && sceneMap != null) {
      sceneMap = null;
      println("Exiting Map Menu");
    }

    // LEVEL UP:
    if (sceneLevelUpMenu != null) {
      // Level HP:
      //println("In-Menu Points: ", exs.levelUpSpendPoints, player.exp.levelUpSpendPoints); // Use the player.exp one
      if (Keyboard.onDown(Keyboard.I) && player.exp.levelUpSpendPoints >= 1) { // ExperienceSystem.currentExperience >= 2 // ExperienceSystem.level >= 2 // && ExperienceSystem.levelUpSpendPoints >= 1
        println("Leveling HP");
        player.maxHealth += 10; // Increase Max Health
        player.currentHealth += 10; // Increase Current Health
        player.exp.levelUpSpendPoints -= 1; // Decrease levelUpSpendPoints by 1
      }
      // Level ATTACK:
      if (Keyboard.onDown(Keyboard.O) && player.exp.levelUpSpendPoints >= 1) {
        println("Leveling ATTACK");
        player.playerDamage += 5; // Increase Player Damage
        player.exp.levelUpSpendPoints -= 1; // Decrease levelUpSpendPoints by 1
      }
      // Level SPEED:
      if (Keyboard.onDown(Keyboard.P) && player.exp.levelUpSpendPoints >= 1) {
        println("Leveling SPEED");
        player.playerSpeedX += 10; // Increase Player X Speed
        player.playerSpeedY += 10; // Increase Player Y Speed
        player.exp.levelUpSpendPoints -= 1; // Decrease levelUpSpendPoints by 1
      }
    }

    // SHOP:
    if (sceneShopMenu != null) {
      // Buy Water:
      //println("In-Menu Coins: ", player.coin.currentCoins); // Use the player.exp one
      if (Keyboard.onDown(Keyboard.I) && player.coin.currentCoins >= 20) { // ExperienceSystem.currentExperience >= 2 // ExperienceSystem.level >= 2 // && ExperienceSystem.levelUpSpendPoints >= 1
        println("Buying Water");
        player.exp.currentExperience += 20; // Increase the player's current EXP
        player.coin.currentCoins -= 20; // Decrease levelUpSpendPoints by 1
      }
      // Buy Energy Drink:
      if (Keyboard.onDown(Keyboard.O) && player.coin.currentCoins >= 20) {
        println("Buying Energy Drink");

        player.coin.currentCoins -= 20; // Decrease levelUpSpendPoints by 1
      }
      // Buy Trail Mix:
      if (Keyboard.onDown(Keyboard.P) && player.coin.currentCoins >= 20) {
        println("Buying Trail Mix");
        // Increase the player's current HP:
        if (player.currentHealth < player.maxHealth) {
          player.currentHealth += 20;
        }
        // Cap the player's HP:
        if (player.currentHealth > player.maxHealth) {
          player.currentHealth = player.maxHealth;
        }
        player.coin.currentCoins -= 20; // Decrease levelUpSpendPoints by 1
      }
    }
  }

  void draw() { // DRAW
    // THE MAGIC LINE.
    pushMatrix();
    // Translate the entire world:
    translate(width/2, height/2); // Moves the camera to be centered on the player. When you do something between the push-pop, it only affects the inside content.
    zoom = lerp(zoom, zoomValue, .08);
    scale(zoom);
    translate(-width/2 - camera.x, -height/2 - camera.y);

    // DRAW BLOCK

    // Floors:
    // South Wing:
    fill(210);
    rect(-1250, -750, 3750, 1250); // X Pos, Y Pos, X Size, Y Size

    // West Wing:
    fill(240);
    rect(-2500, -5750, 1250, 6250);

    // 0,4 Lower-Left West
    rect(-3750, -2000, 1250, 1250);

    // 0,2 Upper-Left West
    rect(-3750, -4500, 1250, 1250);

    // East Wing:
    fill(#a58366); // Brown
    rect(2500, -5750, 1250, 6250);

    // 6,2 Upper-Right East
    rect(3750, -4500, 1250, 1250);

    // 6,4 Lower-Right East
    rect(3750, -2000, 1250, 1250);

    // North Wing:
    fill(150);
    rect(-1250, -5750, 3750, 1250); // X Pos, Y Pos, X Size, Y Size

    // 3,0 Upper-Middle North
    rect(0, -7000, 1250, 1250);

    // Courtyard:
    fill(0, 100, 0);
    rect(-1250, -4500, 3800, 3800);

    // Road Base:
    fill(155);
    rect(-3750, 500, 8750, 1250);

    // Road Line 1:
    fill(#dee11f); // Yellow
    rect(-3750, 1075, 8750, 25);

    // Road Line 2:
    rect(-3750, 1125, 8750, 25);

    // Shop rug:
    fill(200, 0, 0);
    rect(335, -425, 228, 237);

    // Shop rug inner:
    fill(240);
    rect(355, -405, 188, 197);

    // Sarah Image:
    image(sarahImage, 400, -415); // Sarah image position

    // Car Image:
    image(carImage, 500, 500); // Car image position

    // Draw Walls:
    for (int i = walls.size() - 1; i >= 0; i--) {
      walls.get(i).draw();
      //println("Drawing");
    }

    // Draw enemies:
    for (int i = 0; i < enemies.size(); i++) {
      enemies.get(i).draw();
    }

    // DRAW THE BULLETS:
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.draw();
    }

    // DRAW THE MeleeSwings:
    for (int i = 0; i < meleeSwings.size(); i++) {
      MeleeSwing m = meleeSwings.get(i);
      m.draw();
    }

    // DRAW the EXP:
    for (int i = 0; i < expPoints.size(); i++) {
      ExpPoint e = expPoints.get(i);
      e.draw();
    }

    // DRAW the Coins:
    for (int i = 0; i < coins.size(); i++) {
      Coins c = coins.get(i);
      c.draw();
    }

    // DRAW the enemies:
    for (int i = 0; i < enemy.size(); i++) {
      Enemy e = enemy.get(i);
      e.draw();
    }

    // DRAW the Particles:
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.draw();
    }

    player.draw(); // Draw the player

    popMatrix();
    // DRAW HUD AFTER THIS LINE. (So it's not incorrectly translated)

    player.exp.draw(); // Draw the exp from the Player tab

    player.coin.draw();

    //player.coins.draw(); // Draw the exp from the Player tab

    // DRAW PLAYER HEALTH HERE
    //translate(player.x, player.y);
    // Draw the animated health bar:
    textSize(20); // Set the text size
    textAlign(CENTER, CENTER); // Set the text alignment
    //text("HP", width/2, height/2);
    fill(0, 102, 0); // Green color
    noStroke();
    rect(535, 660, player.mappedHealth, player.barHeight);

    // Health bar boarder:
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(535, 660, player.barWidth, player.barHeight);

    // Health bar text:
    fill(255);
    textSize(22);
    text("HP: " + player.currentHealth + "/" + player.maxHealth, width/2, 670);

    // PREP FOR NEXT FRAME BLOCK
    Keyboard.update();
    Mouse.update();
  }
}

// Make the walls:
private void makeWall(float X, float Y, float W, float H) {
  Wall w = new Wall(X, Y, W, H);
  scenePlay.walls.add(w);
}
