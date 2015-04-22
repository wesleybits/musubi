
byte avgBytes(byte[] bytes) {
  long t = 0;
  for (byte b : bytes) {
    t += (long)b;
  }
  return (byte)(t / bytes.length);
}

byte[][] thirds(byte[] bytes) {
  int rvalLen = bytes.length / 3;
  byte[][] retval = new byte[3][rvalLen];
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < rvalLen; j++) {
      int argPos = i * rvalLen + j;
      retval[i][j] = bytes[argPos];
    }
  }
  
  return retval;
}

color colorFromString(String str) {
  color rv;
  if (str.getBytes().length >= 3) {
    byte[][] g = thirds(str.getBytes());
    int[] shade = new int[3];
    
    for (int i = 0; i < 3; i++) {
      shade[i] = (int)avgBytes(g[i]);
    }
    
    if (shade[0] > shade[1] && shade[0] > shade[2]) {
      if (shade[1] > shade[2]) {
        rv = color(
          (shade[0] % 150) + 100,
          (shade[1] % 100) + 75,
          (shade[2] % 100) + 50
        );
      } else {
        rv = color(
          (shade[0] % 150) + 100,
          (shade[1] % 100) + 50,
          (shade[2] % 100) + 75
        );
      }
    } else if (shade[1] > shade[0] && shade[1] > shade[2]) {
      if (shade[0] > shade[2]) {
        rv = color(
          (shade[0] % 100) + 75,
          (shade[1] % 150) + 100,
          (shade[2] % 100) + 50
        );
      } else {
        rv = color(
          (shade[0] % 100) + 50,
          (shade[1] % 150) + 100,
          (shade[2] % 100) + 75
        );
      }
    } else {
      if (shade[0] > shade[1]) {
        rv = color(
          (shade[0] % 100) + 75,
          (shade[1] % 100) + 50,
          (shade[2] % 150) + 100
        );
      } else {
        rv = color(
          (shade[0] % 100) + 50,
          (shade[1] % 100) + 75,
          (shade[2] % 150) + 100
        );
      }
    }
    
  } else {
    int g = (int)avgBytes(str.getBytes());
    rv = color(g);
  }
  return rv;
}
