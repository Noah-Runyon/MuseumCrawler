// This is the Keyboard Tab

static public class Keyboard {

  private static boolean[] keys = new boolean[526]; // 128 Default
  private static boolean[] pKeys = new boolean[526]; // 128 Default
  public static final int LEFT = 37;
  public static final int RIGHT = 39;
  public static final int UP = 38;
  public static final int DOWN = 40;
  public static final int ENTER = 10;
  public static final int SPACE = 32;
  public static final int Q = 81;
  public static final int W = 87;
  public static final int E = 69;
  public static final int A = 65;
  public static final int S = 83;
  public static final int D = 68;
  public static final int X = 88;
  public static final int C = 67;
  public static final int B = 66;
  public static final int K = 75;
  public static final int L = 76;
  public static final int I = 73;
  public static final int O = 79;
  public static final int P = 80;

  public static void update() {
    // Update the state of all keys in the previous frame to the state in the current frame.
    for (int i = 0; i < keys.length; i++) {
      pKeys[i] = keys[i];
    }
  }

  private static void handleKey(int code, boolean isDown) {
    keys[code] = isDown;
  }

  public static boolean isDown(int code) {
    return keys[code];
  }

  public static boolean onDown(int code) {
    return (keys[code] && !pKeys[code]);
  }

  public static void handleKeyDown(int code) {
    handleKey(code, true);
  }

  public static void handleKeyUp(int code) {
    handleKey(code, false);
  }
}
