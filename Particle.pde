// This is the Particle tab

public class Particle {

  float x, y;
  float size;
  float rotation;
  float rSpeed;
  PVector velocity = new PVector();
  float angle;
  float alpha;
  float lifeTime;
  boolean isDead = false;
  public int particleType;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;

    // Type 1:


    // Type 2:


    // Type 3:


    // Default:
    size = random(4, 8);
    rotation = random(0, radians(360));
    rSpeed = random(-400, -100);
    velocity.y = random(-200, -50);
    velocity.x = random(-300, -100);
    alpha = random(128, 255);
    lifeTime = random(2, 4);
  }

  void update(float dt) {

    x += velocity.x * dt;
    y += velocity.y * dt;

    rotation += rSpeed * dt;

    size -= dt;
    alpha -= 128 * dt;
    lifeTime -= dt;

    if (lifeTime <= 0 || alpha <= 0 || size <= 0) isDead = true;
  }

  void draw() {
    noStroke();
    // Type 1:


    // Type 2:


    // Type 3:


    // Default:
    fill(25, alpha);
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    rect(-size/2, -size/2, size, size);
    popMatrix();
  }
}
