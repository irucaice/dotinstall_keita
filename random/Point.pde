class Point {
  float x;
  float y;
  float z;
  float targetX;
  float targetY;
  float targetZ;
  float radius;

  Point() {
    radius = 250;
    float phi = random(TWO_PI);
    float unitZ = random(-1, 1);
    x = radius * sqrt(1 - unitZ * unitZ) * cos(phi);
    y = radius * sqrt(1 - unitZ * unitZ) * sin(phi);
    z = radius * unitZ;
  }

  void display() {
    stroke(180, 180, 255);
    strokeWeight(3);
    point(x, y, z);
  }
}

