// This is the AABB Tab

public class AABB {

  float x, y, w, h;
  PVector velocity = new PVector();

  // State properties:
  boolean isDead = false;

  // AABB Properties:
  protected float edgeL = 0;
  protected float edgeR = 0;
  protected float edgeT = 0;
  protected float edgeB = 0;
  protected float halfW = 0;
  protected float halfH = 0;

  public AABB() {
    // constructor code
  }

  public void update() {
    //update(dt);
    calcEdges(); // Calculate the edges
  }

  // Calculate the edges:
  public void calcEdges() {
    edgeL = x - halfW; // Set the left edge
    edgeR = x + halfW; // Set the right edge
    edgeT = y - halfH; // Set the top edge
    edgeB = y + halfH; // Set the bottom edge
  }

  // Set size:
  public void setSize(float w, float h) {
    this.w = w;
    this.h = h;
    halfW = w/2;
    halfH = h/2;
    calcEdges();
  }

  // Check for overlap between entities:
  public boolean checkOverlap(AABB other) {
    if (edgeR < other.edgeL) return false;
    if (edgeL > other.edgeR) return false;
    if (edgeB < other.edgeT) return false;
    if (edgeT > other.edgeB) return false;
    return true;
  }

  // Fix Overlap by pushing entities back:
  public void fixOverlap(AABB other) {
    float pushUp = edgeB - other.edgeT; // Push the player up so they can walk on top of the platforms
    float pushLeft = edgeR - other.edgeL; // Push the player left when they hit the side of platforms

    if (pushUp <= pushLeft) setBottomEdge(other.edgeT);
    else setRightEdge(other.edgeL);
  }

  // Set bottom edge:
  public void setBottomEdge(float Y) {
    y = Y - halfH;
    velocity.y = 0;
    calcEdges();
  }

  // Set right edge:
  public void setRightEdge(float X) {
    x = X - halfW;
    velocity.x = 0;
    calcEdges();
  }

  public PVector findOverlapFix(AABB other) {

    float moveL = other.edgeL - edgeR; // how far to move this box so it's to the LEFT of the other box
    float moveR = other.edgeR - edgeL; // how far to move this box so it's to the RIGHT of the other box
    float moveU = other.edgeT - edgeB; // how far to move this box so it's to the TOP of the other box
    float moveD = other.edgeB - edgeT; // how far to move this box so it's to the BOTTOM of the other box

    // The above values are potentially negative numbers; the sign indicates what direction to move.
    // But we want to find out which ABSOLUTE value is smallest, so we get a non-signed version of each.

    float absMoveL = abs(moveL);
    float absMoveR = abs(moveR);
    float absMoveU = abs(moveU);
    float absMoveD = abs(moveD);

    PVector result = new PVector();

    result.x = (absMoveL < absMoveR) ? moveL : moveR; // store the smaller horizontal value
    result.y = (absMoveU < absMoveD) ? moveU : moveD; // store the smaller vertical value

    if (abs(result.y) <= abs(result.x)) {
      // If the vertical value is smaller, set horizontal to zero.
      result.x = 0;
    } else {
      // If the horizontal value is smaller, set vertical to zero.
      result.y = 0;
    }

    return result;
  }

  // Stop entities from moving on collision:
  void applyFix(PVector fix) {
    x += fix.x;
    y += fix.y;
    if (fix.x != 0) {
      // If we move the player left or right, the player must have hit a wall, so we set horizontal velocity to zero.
      velocity.x = 0;
    }
    if (fix.y != 0) {
      // If we move the player up or down, the player must have hit a floor or ceiling, so we set vertical velocity to zero.
      velocity.y = 0;
      if (fix.y < 0) {
        // If we move the player up, we must have hit a floor.
      }
      if (fix.y > 0) {
        // If we move the player down, we must have hit our head on a ceiling.
      }
    }
    // recalculate AABB (since we moved the object AND we might have other collisions to fix yet this frame):
    calcEdges(); // Calculate the edges
  }
}
