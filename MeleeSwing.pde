// This is the MeleeSwing Tab

class MeleeSwing extends AABB {

  float lifeTime = 0.05; // How long the MeleeSwing lives for
  float angleOfTravel;

  //boolean isSwinging = false;
  //float swingTimer = 1;
  //float swingCooldown = 1;
  //boolean canSwing = true;

  MeleeSwing(float x, float y, float angle) {
    this.x = x;
    this.y = y;

    velocity = new PVector(2000, 2000); // Speed of the MeleeSwing

    angleOfTravel = angle;
    setSize(90, 90); // Size of the MeleeSwing
  }

  void update() {
    super.update();
    
    //if(isSwinging) {
    // swingTimer -= dt;
    // if(swingTimer <= 0) {
    //  isSwinging = false;
    //  swingTimer = 0.35;
    // }
    //}
    
    //if(!canSwing) {
    // swingCooldown -= dt;
    // if(swingCooldown <= 0) {
    //  canSwing = true;
    //  swingCooldown = 1;
    // }
    //}

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
