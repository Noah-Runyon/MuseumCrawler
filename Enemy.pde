// This is the enemy Tab

class Enemy extends AABB {
  //float x, y;
  float diameter;

  float expAmount;
  float coinsAmount;
  int level = 1;

  float speedX = random(100, 200); // Speed of the enemy in the X axis
  float speedY = random(100, 200); // Speed of the enemy in the Y axis
  float angleToPlayer; // Angle to player

  boolean isDead = false; // Set isDead to false

  float maxHealth = 50; // Set Max HP
  float currentHealth = maxHealth; // Set current HP

  float mappedHealth;

  float barX, barY;
  float barWidth = 100, barHeight = 10;

  float distanceToPlayer = 0; // Set distance to player initially

  PImage enemyImage;

  float spawnLocation;

  float zeroFourRoomX = random(-3750, -2500);
  float zeroFourRoomY = random(-2000, -750);
  float roomZeroFourSpawn = (zeroFourRoomX + zeroFourRoomY);

  float zeroTwoRoomX = random(-3750, -4500);
  float zeroTwoRoomY = random(-2000, -2750);
  float roomZeroTwoSpawn = (zeroTwoRoomX + zeroTwoRoomY);

  // Spawn random enemies:
  Enemy() {
    // SPAWN:
    //x = random(width);
    //y = random(height);

    // LOWER LEFT ROOM:
    x = random(zeroFourRoomX, zeroTwoRoomX);
    y = random(zeroFourRoomY, zeroTwoRoomY);

    spawnLocation = random(roomZeroFourSpawn, roomZeroTwoSpawn);
    //spawnLocation = random(zeroFourRoomX && zeroFourRoomY || zeroTwoRoomX && zeroTwoRoomY);


    diameter = random(50, 150); // Set random diameter size in a range
    setSize(diameter, diameter);

    expAmount = 5 * level + (level * diameter/100); // Bigger enemies drop more XP
    coinsAmount = 5 * level + (level * diameter/100);
  }

  void update() {
    super.update();

    calcAngleToPlayer();

    calcDistanceToPlayer();

    // Make speed direction towards player
    // If player is within 500 pixels of enemy()
    // if (scenePlay.player.x <= 500 && scenePlay.player.y <= 500) {
    if (distanceToPlayer <= 500) { // It's less than 0, is not less than -1, and is not equal to -1, 0, or 1
      x += speedX * cos(angleToPlayer) * dt; // Make X towards player
      y += speedX * sin(angleToPlayer) * dt; // Make Y towards player
    }

    barX = x - 52;
    barY = y - 60;

    mappedHealth = map(currentHealth, 0, maxHealth, 0, barWidth); // Map the health

    if (currentHealth <= 0) {
      isDead = true;
      //player.exp.expPool += expAmount;

      // EXP Amount
      int numExp = (int)random(2, 5);
      float chunkExp = ceil(expAmount / numExp);
      for (int i = 0; i < numExp; i++) {
        ExpPoint e = new ExpPoint(x, y, chunkExp);
        scenePlay.expPoints.add(e);
      }

      // Coins Amount
      int numCoins = (int)random(2, 5);
      float chunkCoins = ceil(coinsAmount / numCoins);
      for (int i = 0; i < numCoins; i++) {
        Coins c = new Coins(x, y, chunkCoins);
        scenePlay.coins.add(c);
      }
    }
  }

  void draw() {
    //fill(#E06C1D);
    //ellipse(x, y, diameter, diameter);
    image(enemyImage, x-50, y-50); // Load enemy images

    // Draw Animated Health Bar:
    fill(128, 0, 0);
    noStroke();
    rect(barX, barY, mappedHealth, barHeight);

    // Draw Border of Health Bar:
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(barX, barY, barWidth, barHeight);
  }

  // Calculate the angle to the player:
  void calcAngleToPlayer() {
    //if (scenePlay == null) return;
    float dx = scenePlay.player.x - x;
    float dy = scenePlay.player.y - y;
    angleToPlayer = atan2(dy, dx);
  }

  // This is angle, adjust it, use Pythagoritm to figure out distance
  // Brett showed me how to do distance to player calculation
  void calcDistanceToPlayer() {
    float dx = scenePlay.player.x - x;
    float dy = scenePlay.player.y - y;
    //distanceToPlayer = atan2(dy, dx);
    distanceToPlayer = sqrt((dx * dx) + (dy * dy));
  }
}
