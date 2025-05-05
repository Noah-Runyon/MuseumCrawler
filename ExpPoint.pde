// This is the ExpPoint Tab

class ExpPoint extends AABB {

  float expAmount;
  float lifeTime = 5;
  float rotateAngle, directionAngle;

  ExpPoint(float x, float y, float amount) {
    this.x = x;
    this.y = y;

    expAmount = amount;
    float size = map(expAmount, 0, 100, 6, 25);
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
    fill(0, 200, 0);
    pushMatrix();
    translate(x, y);
    rotate(rotateAngle);
    rect(-halfW, -halfH, w, h);
    popMatrix();
  }
}
