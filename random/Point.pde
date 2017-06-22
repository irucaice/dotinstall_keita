class Point {
  float x;  // 現在の座標
  float y;
  float z;
  float targetX;  // 新しい座標
  float targetY;
  float targetZ;
  float radius;

  Point() {
    setTarget();
    x = targetX;
    y = targetY;
    z = targetZ;
  }
  
  void setTarget() {
    if (random(2) < 1) {
      radius = 260;
    } else {
      radius = 130;
    }      
    float phi = random(TWO_PI);
    float unitZ = random(-1, 1);
    targetX = radius * sqrt(1 - unitZ * unitZ) * cos(phi);
    targetY = radius * sqrt(1 - unitZ * unitZ) * sin(phi);
    targetZ = radius * unitZ;
  }
  
  void update() {
    if (frameCount % 150 == 0) {  // 2秒に1回新しい座標をセット
      setTarget();
    }
    // targetX と x の差に 0.05 あたりを掛けて
    // それをxに足していくと、徐々にその値に近づく
    x += (targetX - x) * 0.05;
    y += (targetY - y) * 0.05;
    z += (targetZ - z) * 0.05;
  }

  void display() {
    stroke(255);
    strokeWeight(3);
    point(x, y, z);
  }
}

