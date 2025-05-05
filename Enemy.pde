// This is the Enemy Tab

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

  float maxHealth = random(40, 60); // Set Max HP
  float currentHealth = maxHealth; // Set current HP

  float mappedHealth;

  float barX, barY;
  float barWidth = 100, barHeight = 10;

  float distanceToPlayer = 0; // Set distance to player initially

  PImage enemyImage;

  PVector spawnLocation = new PVector();

  // Chase and Attack state radius:
  float detectionRadius = 700;
  float attackRadius = 200;
  float enemyDamage = 0.5;

  // Set up an arary
  ArrayList<PVector> spawnLocations = new ArrayList<PVector>();

  public int IDLE_STATE = 1;
  public int CHASING_STATE = 2;
  public int ATTACKING_STATE = 3;
  private int currentState = 1;

  float wallSpacingDistance = 50;

  // Room 0,2
  float zeroTwoRoomX = random(-3750 + wallSpacingDistance, -2500 - wallSpacingDistance); // Default: (-3750, -2500);
  float zeroTwoRoomY = random(-4500 + wallSpacingDistance, -3250 - wallSpacingDistance); // Default: (-4500, -3250);
  PVector roomZeroTwoVector = new PVector(zeroTwoRoomX, zeroTwoRoomY);

  // Room 0,4
  float zeroFourRoomX = random(-3750 + wallSpacingDistance, -2500 - wallSpacingDistance); // Default: (-3750, -2500);
  float zeroFourRoomY = random(-2000 + wallSpacingDistance, -750 - wallSpacingDistance); // Default: (-2000, -750);
  PVector roomZeroFourVector = new PVector(zeroFourRoomX, zeroFourRoomY);

  // Room 6,4
  float sixFourRoomX = random(3750 + wallSpacingDistance, 5000 - wallSpacingDistance); // Default: (3750, 5000);
  float sixFourRoomY = random(-2000 + wallSpacingDistance, -750 - wallSpacingDistance); // Default: (-2000, -750);
  PVector roomSixFourVector = new PVector(sixFourRoomX, sixFourRoomY);

  // Room 6,2
  float sixTwoRoomX = random(3750 + wallSpacingDistance, 5000 - wallSpacingDistance); // Default: (3750, 5000);
  float sixTwoRoomY = random(-4500 + wallSpacingDistance, -3250 - wallSpacingDistance); // Default: (-4500, -3250);
  PVector roomSixTwoVector = new PVector(sixTwoRoomX, sixTwoRoomY);

  // Room 3,0
  float threeZeroRoomX = random(0 + wallSpacingDistance, 1250 - wallSpacingDistance); // Default: (0, 1250);
  float threeZeroRoomY = random(-7000 + wallSpacingDistance, -5750 - wallSpacingDistance); // Default: (-7000, -5750);
  PVector roomThreeZeroVector = new PVector(threeZeroRoomX, threeZeroRoomY);

  // West Wing:
  float westWingX = random(-2500 + wallSpacingDistance, -1250 - wallSpacingDistance); // Default: (-2500, -1250)
  float westWingY = random(-5750 + wallSpacingDistance, 500 - wallSpacingDistance); // Default: (-5750, 500)
  PVector westWingVector = new PVector(westWingX, westWingY);

  // East Wing:
  float eastWingX = random(2500 + wallSpacingDistance, 3750 - wallSpacingDistance); // Default: (2500, 3750)
  float eastWingY = random(-5750 + wallSpacingDistance, 500 - wallSpacingDistance); // Default: (-5750, 500)
  PVector eastWingVector = new PVector(eastWingX, eastWingY);

  // North Wing:
  float northWingX = random(-2500 + wallSpacingDistance, 3750 - wallSpacingDistance); // Default: (-2500, 3750)
  float northWingY = random(-5750 + wallSpacingDistance, -4500 - wallSpacingDistance); // Default: (-5750, -4500)
  PVector northWingVector = new PVector(northWingX, northWingY);

  // Spawn random enemies:
  Enemy() {
    // SPAWN:

    // 0,2:
    spawnLocations.add(roomZeroTwoVector);
    // 0,4:
    spawnLocations.add(roomZeroFourVector);
    // 6,4:
    spawnLocations.add(roomSixFourVector);
    // 6/2:
    spawnLocations.add(roomSixTwoVector);
    // 3,0:
    spawnLocations.add(roomThreeZeroVector);

    // West Wing:
    spawnLocations.add(westWingVector);

    // East Wing:
    spawnLocations.add(eastWingVector);

    // North Wing:
    spawnLocations.add(northWingVector);

    // Randomize spawn location:
    int rand = (int)random(spawnLocations.size()); // Randomize spawn location
    spawnLocation = spawnLocations.get(rand); // Randomize spawn location
    x = spawnLocation.x; // Set X
    y = spawnLocation.y; // Set Y
    //println(spawnLocation); // Print Coordinates

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
    if (distanceToPlayer <= detectionRadius) { // It's less than 0, is not less than -1, and is not equal to -1, 0, or 1
      currentState = CHASING_STATE;
      if (distanceToPlayer <= attackRadius) {
        currentState = ATTACKING_STATE;
      }
    }

    if (distanceToPlayer >= 500) {
      currentState = IDLE_STATE;
    }

    // IDLE State:
    if (currentState == IDLE_STATE) {
    }

    // CHASING State:
    if (currentState == CHASING_STATE) {
      x += speedX * cos(angleToPlayer) * dt; // Make X towards player
      y += speedX * sin(angleToPlayer) * dt; // Make Y towards player
    }

    // ATTACKING State:
    if (currentState == ATTACKING_STATE) {
      scenePlay.player.currentHealth -= enemyDamage; // Reduce Player HP
      playerDamaged.play(); // Player damage noise on collision
    }

    barX = x - 52;
    barY = y - 60;

    mappedHealth = map(currentHealth, 0, maxHealth, 0, barWidth); // Map the health

    if (currentHealth <= 0) {
      isDead = true;
      //player.exp.expPool += expAmount;

      enemyDefeated.play();

      // EXP Amount
      int numExp = (int)random(2, 5) * scenePlay.exs.level;
      float chunkExp = ceil(expAmount / numExp);
      for (int i = 0; i < numExp; i++) {
        ExpPoint e = new ExpPoint(x, y, chunkExp);
        scenePlay.expPoints.add(e);
      }

      // Coins Amount
      int numCoins = (int)random(2, 5) * scenePlay.exs.level;
      float chunkCoins = ceil(coinsAmount / numCoins);
      for (int i = 0; i < numCoins; i++) {
        Coins c = new Coins(x, y, chunkCoins);
        scenePlay.coins.add(c);
      }

      Particle r = new Particle(x, y);
      // Particle Type: p.particleType = 1;
      scenePlay.particles.add(r);

      int numParticles = (int)random(20, 40); // Amount of particles
      for (int i = 0; i < numParticles; i++) {
        Particle p = new Particle(x, y);
        p.velocity.x = random(-200, 200); // Particle speed in the X
        p.velocity.y = random(-200, 200); // Particle speed in the Y
        // p.particleType = 1;
        scenePlay.particles.add(p);
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

  void applyFix(PVector fix) {
    x += fix.x;
    y += fix.y;
    if (fix.x != 0) {
      // If we move the Enemy left or right, the Enemy must have hit a wall, so we set horizontal velocity to zero.
      //velocity.x = 0;
    }
    if (fix.y != 0) {
      // If we move the Enemy up or down, the Enemy must have hit a floor or ceiling, so we set vertical velocity to zero.
      //velocity.y = 0;
      if (fix.y < 0) {
        // If we move the Enemy up, we must have hit a floor.
      }
      if (fix.y > 0) {
        // If we move the Enemy down, we must have hit our head on a ceiling.
      }
    }
    // recalculate AABB (since we moved the object AND we might have other collisions to fix yet this frame):
    calcEdges();
  }
}
