public class Wall extends AABB {

  public Wall(float x, float y, float W, float H) {
    this.x = x;
    this.y = y;
    setSize(W, H);
  }

  void update() {
  }

  void draw() {
    fill(100, 100, 100); // Wall color

    rect(x-halfW, y-halfH, halfW*2, halfH*2); // First two are position, second two are size
  }
}
