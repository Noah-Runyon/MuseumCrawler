// This is the MeleeSwing Tab

class MeleeSwing extends AABB {

  float lifeTime = 0.05; // How long the MeleeSwing lives for
  float angleOfTravel;

  MeleeSwing(float x, float y, float angle) {
    this.x = x;
    this.y = y;

    velocity = new PVector(2000, 2000); // Speed of the MeleeSwing

    angleOfTravel = angle;
    setSize(90, 90); // Size of the MeleeSwing
  }

  void update() {
    super.update();

    lifeTime -= dt;
    if (lifeTime <= 0) isDead = true;

    x += velocity.x * cos(angleOfTravel) * dt;
    y += velocity.y * sin(angleOfTravel) * dt;
  }

  void draw() {
    noFill();
    strokeWeight(10);
    //fill(#999999);
    ellipse(x, y, w, h);
    strokeWeight(1);
  }
}
