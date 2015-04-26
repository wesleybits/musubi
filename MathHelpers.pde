int sumBytes(byte[] bytes) {
  int t = 0;
  for (byte b : bytes) {
    t += (int)b;
  }
  return t;
}

byte avgBytes(byte[] bytes) {
  int t = sumBytes(bytes);
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
    byte[][] g = thirds(str.toLowerCase().getBytes());
    int[] shade = new int[3];
    
    for (int i = 0; i < 3; i++) {
      shade[i] = sumBytes(g[i]);
    }
    
    int biggest = shade[0];
    if (shade[1] >= biggest) biggest = shade[1];
    if (shade[2] >= biggest) biggest = shade[2];
    
    float red = (float)(shade[0]) / (float)(biggest);
    float green = (float)(shade[1]) / (float)(biggest);
    float blue = (float)(shade[2]) / (float)(biggest);
    
    rv = color(
      biggest == shade[0] ? (int)(255.0 * red) : (int)(180.0 * red),
      biggest == shade[1] ? (int)(250.0 * green) : (int)(180.0 * green),
      biggest == shade[2] ? (int)(250.0 * blue) : (int)(180.0 * blue)
    );
  } else {
    int g = (int)avgBytes(str.toLowerCase().getBytes());
    rv = color(g);
  }
  return rv;
}
