// This is the Coins Tab

class Coins extends AABB {

  float coinsAmount;
  float lifeTime = 5;
  float rotateAngle, directionAngle;

  Coins(float x, float y, float amount) {
    this.x = x;
    this.y = y;

    coinsAmount = amount;
    float size = map(coinsAmount, 0, 100, 6, 25);
    if (size > 25) size = 25;
    setSize(size, size);


    rotateAngle = random(radians(360));
    directionAngle = random(radians(360));

    velocity.x = size * 15;
    velocity.y = size * 15;
  }

  void update() {

    super.update();

    lifeTime -= dt;
    if (lifeTime <= 0) isDead = true;

    x += velocity.x * cos(directionAngle) * dt;
    y += velocity.y * sin(directionAngle) * dt;

    velocity.x *= 0.95;
    velocity.y *= 0.95;
  }

  void draw() {
    fill(200, 200, 0);
    pushMatrix();
    translate(x, y);
    rotate(rotateAngle);
    rect(-halfW, -halfH, w, h);
    popMatrix();
  }
}
