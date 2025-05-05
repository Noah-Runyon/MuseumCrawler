// This is the CoinsSystem Tab

class CoinsSystem { // This Tab caculates the coins

  float currentCoins;

  float coinsPool;
  float growSpeed = 5;

  String coinsString;

  float barX, barY, barWidth = 100, barHeight = 20; // Draw the coins bar
  float coinsMapped;

  CoinsSystem() {
    resetSystem();
    updateString();
  }

  float log10(float x) {

    return(log(x) / log(10));
  }

  void resetSystem() { // Reset the coins and Levels for a new game
    currentCoins = 0;
  }

  void update() {
    updateCoinsPool();
  }

  void updateString() {
    coinsString = "Coins: " + (int)(currentCoins); // Write the coins
  }

  void updateCoinsPool() { // coins BAR EASE // Grow the coins bar:
    currentCoins += coinsPool * dt * growSpeed;
    coinsPool -= coinsPool * dt * growSpeed;
    if (coinsPool <= 0) coinsPool = 0;
  }

  void draw() {
    textSize(20);
    textAlign(CENTER, CENTER);
    updateString();
    fill(75, 75, 0, 128); // Black and white, then Alpha
    rect(barX + 590, barY + 620, barWidth, barHeight); // Bar Background
    noStroke();
    //text(coinsString, width/2, 50);
    fill(255, 200, 0); // Bar inside
    rect(barX + 590, barY + 620, coinsMapped, barHeight);
    stroke(0);
    noFill();
    rect(barX + 590, barY + 620, barWidth, barHeight);
    fill(0);
    text(coinsString, width/2, 630); // Display the coins
  }
}
