// This is the Player Tab

class Player extends AABB { // Class player extends AABB, because the player has collision

  PImage[] runImages = new PImage[8]; // 8 image player cycle

  int runCounter = 0; // Set runCounter to 0
  int runIndex = 0; // Set runIndex to 0

  //float x, y; // DELETE THESE WHEN YOU EXTEND FROM AABB.
  float w = 100, h = 100; // DELETE THESE WHEN YOU EXTEND FROM AABB.

  //float moveSpeed = 250;

  ExperienceSystem exp;

  CoinsSystem coin;

  PVector acceleration = new PVector(); // Sest acceleration to a new PVector
  PVector dashVelocity = new PVector(); // Set dashVelocity to a new PVctor

  float angleToMouse = 0; // Set angleToMouse to be equal to 0

  boolean isDashing = false; // Set isDashing to false
  float dashTimer = 0.2; // How long the dash lasts for
  float dashCooldown = 1.5; // How long the dash cooldown is
  boolean canDash = true; // Set canDash to true

  boolean isSwinging = false; // Set isSwinging to false
  float swingTimer = 5; // Set swingTimer to 5
  float swingCooldown = 5; // Set swingCooldown to 5
  boolean canSwing = true; // Swet canSwing to true

  // Set the player's HP:
  float maxHealth = 100;
  float currentHealth = maxHealth;
  float mappedHealth;
  float barWidth = 200, barHeight = 20;

  // Instantiate the player:
  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;

    velocity.x = 1250; // Default 250
    velocity.y = 1250; // Default 250
    setSize(100, 100); // Set the player's size

    exp = new ExperienceSystem(); // Make take a String data for saves

    coin = new CoinsSystem(); // Make take a String data for saves

    for (int i = 0; i < runImages.length; i++) {
      runImages[i] = loadImage("player_sprites/player_sprite00" + (i+1) + ".png"); // Load the images in a cycle
      runImages[i].resize(75 + (width * 1/35), 75 + (height * 1/35)); // Resize the player imagess to a proper size
    }
  }

  void update() {

    super.update();

    calcAngleToMouse();

    exp.update();

    coin.update();

    // Dashing:
    if (isDashing) {
      dashTimer -= dt;
      if (dashTimer <= 0) {
        isDashing = false;
        dashTimer = 0.35;
      }
    }

    // Dash timer:
    if (!canDash) {
      dashCooldown -= dt;
      if (dashCooldown <= 0) {
        canDash = true;
        dashCooldown = 1.5;
      }
    }

    //if (Mouse.onDown(Mouse.LEFT)) {
    //  Bullet b = new Bullet(x, y, angleToMouse);
    //  bullets.add(b);
    //}

    // E Key for Bullets:
    if (Keyboard.onDown(Keyboard.E)) { // Press the E key to fire a bullet
      Bullet b = new Bullet(x, y, angleToMouse);
      scenePlay.bullets.add(b);
    }

    // X Key for EXP:
    if (Keyboard.onDown(Keyboard.X)) { // Press the Q key to get experience // Do a Modulo thing to get it to carry over leftover experience???
      //exp.levelUp();
      //exp.currentExperience += 20;
      exp.expPool += 20; // Give the player 20XP
    }

    // C Key for Coins:
    if (Keyboard.onDown(Keyboard.C)) { // Press the C key to get coins
      coin.coinsPool += 20; // Give the player coins
    }

    // If the player is swinging:
    if (isSwinging) {
      swingTimer -= dt;
      if (swingTimer <= 0) {
        isSwinging = false;
        swingTimer = 5;
      }
    }

    // Swing cooldown:
    if (!canSwing) {
      swingCooldown -= dt;
      if (swingCooldown <= 0) {
        canSwing = true;
        swingCooldown = 5;
      }
    }

    // Swing:
    if (Mouse.onDown(Mouse.LEFT) && canSwing == true && isSwinging == false) {
      MeleeSwing m = new MeleeSwing(x, y, angleToMouse);
      scenePlay.meleeSwings.add(m);
    }

    // Dash:
    if (Keyboard.onDown(Keyboard.SPACE)) {
      if (canDash && !isDashing) {
        isDashing = true;
        canDash = false;
        dash(1500, moveDirection());
      }
    }

    // If dashing:
    if (!isDashing) {
      //x += moveSpeed * moveDirection().x * dt;
      //y += moveSpeed * moveDirection().y * dt;
      x += velocity.x * moveDirection().x * dt;
      y += velocity.y * moveDirection().y * dt;

      runCounter++;
      if (runCounter >= 4) {
        runIndex++;
        if (runIndex >= 8) runIndex = 0;
        runCounter = 0;
      }
    } else {
      x += dashVelocity.x * dt;
      y += dashVelocity.y * dt;
    }

    // Player HP:
    mappedHealth = map(currentHealth, 0, maxHealth, 0, barWidth);
    if (currentHealth <= 0) {
      switchToGameOver();
    }
  }

  //if (Keyboard.onDown(Keyboard.Q)) { // Press the Q key to get experience // Do a Modulo thing to get it to carry over leftover experience???
  //  //exp.levelUp();
  //  //exp.currentExperience += 20;
  //  exp.expPool += 20; // Give the player 20XP
  //}

  void draw() {
    fill(#26DE30);
    pushMatrix();
    translate(x, y);
    //rotate(angleToMouse); // Rotate the image towards the mouse
    rotate(angleToMouse + radians(90)); // Rotate the image towards the mouse and rotate it 90 radians so it's facing the right direction
    image(runImages[runIndex], -halfW, -halfH); // Draw the player images
    //rect(-halfW, -halfH, w, h);
    popMatrix();

    //pushMatrix();
    //translate(x, y);
    //// Draw the animated health bar:
    //textSize(20); // Set the text size
    //textAlign(CENTER, CENTER); // Set the text alignment
    ////text("HP", width/2, height/2);
    //fill(0, 102, 0); // Green color
    //noStroke();
    //rect(-100, height - 650, mappedHealth, barHeight);

    //// Health bar boarder:
    //noFill();
    //stroke(0);
    //strokeWeight(1);
    //rect(-100, height - 650, barWidth, barHeight);
    //popMatrix();

    //exp.draw();
  }

  // Move Direction:
  PVector moveDirection() { // Set moving in a direction, so diagonals aren't faster
    float directionX = 0;
    float directionY = 0;
    if (Keyboard.isDown(Keyboard.W)) {
      directionY = -1;
    } else if (Keyboard.isDown(Keyboard.S)) {
      directionY = 1;
    } else {
      directionY = 0;
    }

    if (Keyboard.isDown(Keyboard.A)) {
      directionX = -1;
    } else if (Keyboard.isDown(Keyboard.D)) {
      directionX = 1;
    } else {
      directionX = 0;
    }

    return new PVector(directionX, directionY).normalize();
  }

  // Dash:
  void dash(float dashSpeed, PVector moveDirection) { // Dash
    PVector direction = moveDirection.copy();
    //println(direction);
    acceleration = direction.mult(dashSpeed);
    //acceleration = new PVector(dashSpeed, dashSpeed); // Set the dash speed
    dashVelocity.x = acceleration.x;
    dashVelocity.y = acceleration.y;
    //dashVelocity.x = acceleration.x * dt;
    //dashVelocity.y = acceleration.y * dt;
  }

  // Reset Velocity:
  void resetVelocity(float speed) { // Reset speed after dash
    velocity.x = speed;
    velocity.y = speed;
  }

  // Calculate the angle to the mouse:
  void calcAngleToMouse() {
    float dx = mouseX - x + scenePlay.camera.x; // Add the camera so the relative to mouse moves with the camera
    float dy = mouseY - y + scenePlay.camera.y;
    angleToMouse = atan2(dy, dx);
  }

  void applyFix(PVector fix) {
    x += fix.x;
    y += fix.y;
    if (fix.x != 0) {
      // If we move the player left or right, the player must have hit a wall, so we set horizontal velocity to zero.
      //velocity.x = 0;
    }
    if (fix.y != 0) {
      // If we move the player up or down, the player must have hit a floor or ceiling, so we set vertical velocity to zero.
      //velocity.y = 0;
      if (fix.y < 0) {
        // If we move the player up, we must have hit a floor.
      }
      if (fix.y > 0) {
        // If we move the player down, we must have hit our head on a ceiling.
      }
    }
    // recalculate AABB (since we moved the object AND we might have other collisions to fix yet this frame):
    calcEdges();
  }
}
