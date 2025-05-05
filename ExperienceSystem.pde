// This is the ExperienceSystem Tab

class ExperienceSystem { // This Tab caculates the experience

  int level = 1;
  int levelUpSpendPoints = 0;
  float currentExperience = 0;
  float maxExperience;

  float expPool;
  float growSpeed = 5;

  String expString;

  float barX, barY, barWidth = 1100, barHeight = 20; // Draw the experience bar
  float expMapped;

  ExperienceSystem() {
    resetSystem();
    updateString();
  }

  float log10(float x) {

    return(log(x) / log(10));
  }

  void resetSystem() { // Reset the Experience and Levels for a new game
    level = 1;
    maxExperience = (level + 1) * log10(level + 1) * 100;
    currentExperience = 0;
  }

  void levelUp() { // For leveling Up
    level++; // +1 Level
    maxExperience = (level + 1) * log10(level + 1) * 100; // Increase experience needed
    currentExperience = 0; // Set back to 0 // Adjust for carry-over experience?
    levelUpSpendPoints += 1; // Increase level up spend points by 1
    println("Spend Points: ", levelUpSpendPoints);
  }

  void update() {

    updateExpPool();
    expMapped = map(currentExperience, 0, maxExperience, 0, barWidth);

    if (ceil(currentExperience) >= (int)maxExperience) { // Make experience have the right number

      levelUp();
    }
  }

  void updateString() {
    expString = "Lvl: " + level + "      XP: " + (int)(currentExperience) + " / " + (int)(maxExperience); // Write the level and EXP
  }

  void updateExpPool() { // EXP BAR EASE // Grow the EXP bar:
    currentExperience += expPool * dt * growSpeed;
    expPool -= expPool * dt * growSpeed;
    if (expPool <= 0) expPool = 0;
  }

  void draw() {
    textSize(20);
    textAlign(CENTER, CENTER);
    updateString();
    fill(75, 128); // Black and white, then Alpha
    rect(barX + 90, barY + 20, barWidth, barHeight); // Bar Background
    noStroke();
    //text(expString, width/2, 50);
    fill(255, 200, 0); // Bar inside
    rect(barX + 90, barY + 20, expMapped, barHeight);
    stroke(0);
    noFill();
    rect(barX + 90, barY + 20, barWidth, barHeight);
    fill(0);
    text(expString, width/2, 30); // Display the LV and EXP
  }
}
