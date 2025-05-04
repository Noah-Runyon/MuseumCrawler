// This is the Bullet Tab

class Bullet extends AABB {
  
  float lifeTime = 0.35; // How long the bullet lives for
  float angleOfTravel; 

  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    
    velocity = new PVector(1000, 1000); // Speed of the bullet
    
    angleOfTravel = angle;
    setSize(6, 6); // Size of the bullet
  }

  void update() {
    super.update();
    
    lifeTime -= dt;
    if(lifeTime <= 0) isDead = true;
    
    x += velocity.x * cos(angleOfTravel) * dt;
    y += velocity.y * sin(angleOfTravel) * dt;
    
  }

  void draw() {
    //fill(#2493FF);
    fill(random(0, 255)); // Randomize paintball bullet color from white to black
    ellipse(x, y, w, h);
  }
}
