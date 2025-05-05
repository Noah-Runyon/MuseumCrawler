// This is the Level Up Menu Tab

public class SceneShopMenu {

  PImage waterBottleImage;
  PImage energyDrinkImage;
  PImage trailMixImage;

  SceneShopMenu() {
    // Water Bottle:
    waterBottleImage = loadImage("shop_sprites/water_bottle.png");
    waterBottleImage.resize(100, 100);

    // Energy Drink:
    energyDrinkImage = loadImage("shop_sprites/energy_drink.png");
    energyDrinkImage.resize(100, 100);

    // Trail Mix:
    trailMixImage = loadImage("shop_sprites/trail_mix.png");
    trailMixImage.resize(100, 100);
  }

  void update() {
  }

  void draw() {

    fill(200, 200, 0); // Light Green
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);

    // Set Water Bottle image position:
    image(waterBottleImage, width/3.7, height/2 - 150); // + 50
    // Set Energy Drink image position:
    image(energyDrinkImage, width/3.7, height/2 - 0); // - 50
    // Set Trail Mix image position:
    image(trailMixImage, width/3.7, height/2 + 150); // + 150

    // Level Up Menu:
    textSize(50);
    text("Shop Menu", width/2, height/2 - 300);
    // Display current coins:
    textSize(35);
    text("Current Coins: " + (int(scenePlay.player.coin.currentCoins)), width/2, height/2 - 225);
    // L to return:
    textSize(25);
    text("Press H to return to the game", width/2, height/2 - 175);
    // Buy Water Bottle:
    textSize(25);
    text("Buy Water Bottle ('I') - ($20)", width/2, height/2 - 100); // 0
    // Water Bottle Text:
    textSize(20);
    text("Gives 20 EXP", width/2, height/2 - 50);
    // Buy Energy Drink:
    textSize(25);
    text("Buy Energy Drink ('O') - ($100)", width/2, height/2 + 50); // 100
    // Energy Drink Text:
    textSize(20);
    text("Upgrades your Dash Distance by 250", width/2, height/2 + 100);
    text("Current Dash Distance: " + (int(scenePlay.player.dashDistance)), width/2, height/2 + 150);
    // Buy Trail Mix:
    textSize(25);
    text("Buy Trail Mix ('P') - ($20)", width/2, height/2 + 200); // 200
    // Trail Mix Text:
    textSize(20);
    text("Heals 20 HP", width/2, height/2 + 250);
    text("Current HP: " + (int(scenePlay.player.currentHealth)) + " of " + (int(scenePlay.player.maxHealth)), width/2, height/2 + 300);
    //}
  }
}
