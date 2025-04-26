// This is the Camera Tab
// Rylynn showed me hot to get the camera zoom working properly

class Camera {

  float x, y;
  Player target;
  float tx, ty; // Target's x and y coordinates.
  float dx, dy;

  Camera(Player p) { // Make the camera center/target the player
    target = p; // Target is the player
    //tx = (target.x - width/2) * zoomValue;
    //ty = (target.y - height/2) * zoomValue;
    tx = (target.x - width/2);
    ty = (target.y - height/2);
    x = tx;
    y = ty;
  }

  void update() {
    tx = target.x - width/2;
    ty = target.y - height/2;


    // For Camera Easing Effect
    dx = tx - x;
    dy = ty - y;
    x += dx * 0.05; // Easing
    y += dy * 0.05; // Easing
  }
}
