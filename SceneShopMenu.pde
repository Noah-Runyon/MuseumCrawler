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

    fill(100, 150, 50); // Light Green
    rect(320, 0, width/2, height); // X Pos, Y Pos, X Size, Y Size
    fill(0);
    textAlign(CENTER, CENTER);

    // Set Water Bottle image position:
    image(waterBottleImage, width/3, height/2 + 50);
    // Set Energy Drink image position:
    image(energyDrinkImage, width/3, height/2 - 50);
    // Set Trail Mix image position:
    image(trailMixImage, width/3, height/2 + 150);

    // Level Up Menu:
    textSize(50);
    text("Level Up Menu", width/2, height/2 - 300);
    // L to return:
    textSize(25);
    text("Press H to return to the game", width/2, height/2 - 200);
    // Buy Water Bottle:
    textSize(25);
    text("Buy Water Bottle (I)", width/2, height/2 - 0);
    // Buy Energy Drink:
    textSize(25);
    text("Buy Energy Drink(O)", width/2, height/2 + 100);
    // Buy Trail Mix:
    textSize(25);
    text("Buy Trail Mix (P)", width/2, height/2 + 200);
    //}
  }
}
